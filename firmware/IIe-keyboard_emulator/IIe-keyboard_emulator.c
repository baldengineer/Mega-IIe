/* 
 * The MIT License (MIT)
 *
 * Copyright (c) 2020-2021 James Lewis
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#include "IIe-keyboard_emulator.h"

// old habits die hard
uint32_t millis() {
    return ((time_us_32() / 1000));
}

void wtf_bbq_led() {
    static uint8_t dev_addr = 0x1;
    static uint8_t instance = 0x0;
    static uint8_t report_id = 0x0;
    static uint8_t report_type = 0x2;

    if (kbd_connected)
        tuh_hid_set_report(dev_addr, instance, report_id, report_type, kbd_led_state, 1);
}

// eventually this causes the keyboard to stop respoding
// we took out the panic assertion that it normally causes
/*bool blink_led_callback(struct repeating_timer *t) {
    (void)t;
    static bool led_state = OFF;

    // blink GP25 LED (which I don't have)
    // led_state = !led_state;
    // gpio_put(LED_PIN, led_state);

    // blink keyboard's scrolllock key
    if (kbd_connected) {
        static bool scroll_led_state = false;
        scroll_led_state = !scroll_led_state;
        if (scroll_led_state)
            kbd_led_state[0] = kbd_led_state[0] | 0x04;
        else
            kbd_led_state[0] = kbd_led_state[0] & 0xFB;
        wtf_bbq_led();
    }
} */

// Tim said this helps to prevent bus contention
// it doesn't hurt but not sure if it helps
bool repeating_timer_callback(struct repeating_timer *t) {
    dousb = true;
    return true;
}

// not sure what to do with this section. need a mode to 
// enable and disable the "serial" passthrough
void handle_serial() {
    // print something when receiving any character
    int incoming_char = getchar_timeout_us(0);
    if ((incoming_char > 31) && (incoming_char < 127)) {
        switch (incoming_char) {
            case 'b':
            case 'B':
                state_245 = !state_245;
                puts(state_245 == ENABLED ? "245 enabled" : "245 disabled");
                gpio_put(enable_245_pin, state_245);
                break;
            case '.':
                print_usb_report = !print_usb_report;
                break;
            case 'p':
                imma_led(0x01);
                break;
            case 'o':
                imma_led(0x02);
                break;
            case 'i':
                imma_led(0x04);
                break;
            case 'u':
                imma_led(0x08);
                break;
            case 'y':
                imma_led(0x10);
                break;
            case 'z':
                imma_led(0x00);
                break;
            default:
                printf("millis(): %d\n", millis());
                break;
        }
    }
}

void check_keyboard_buffer() {
    // check the keyboard buffer
    static uint32_t prev_key_millis = 0;
    uint32_t current_millis = millis();
    if (any_key) {// (current_millis - prev_key_millis >= key_delay)) {
        bool did_print = false;
        any_key = false;
        for (uint8_t x = 0; x < 101; x++) {
            if (keys[x]) {
                if (did_print)
                    printf(",");
                uint8_t ascii = get_ascii(x, modifiers);
                // handle special case :)
                if ((x==76) && (modifiers==5)) {
                    // ctrl-alt-del!!
                    reset_mega(1);
                    return;
                }
              //  printf("%d - %c (%d) (0x%02X)",x, ascii, ascii, ascii);
                write_key(ascii);
                did_print = true;
            }
        }
        // if (did_print)
        //     printf(",%d\n", modifiers);

        prev_key_millis = current_millis;
    }
}

void handle_tinyusb() {
    if (dousb) {
        tuh_task();
        dousb = false;
    }
}





// todo: convert to using the _mask function calls
void setup_main_databus() {
    const uint8_t main_data[] = {MD0, MD1, MD2, MD3, MD4, MD5, MD6};
    for (int x = 0; x < (sizeof(main_data)/sizeof(main_data[0])); x++) {
        gpio_init(main_data[x]);
        gpio_set_dir(main_data[x], GPIO_OUT);
        gpio_put(main_data[x], 0x1);
        busy_wait_ms(5);
    }
}

static inline void KBD_pio_setup() {
    pio = pio0;
    pio_offset = pio_add_program(pio, &KBD_program);
    pio_sm = pio_claim_unused_sm(pio, true);

    pio_sm_config c = KBD_program_get_default_config(pio_offset);
    pio_sm_set_enabled(pio, pio_sm, false); // make sure SM isn't running

    // SM's only output is the "strobe" bit
    pio_gpio_init(pio, MD7);  
    sm_config_set_out_pins(&c, MD7, 1); // out is direction
    sm_config_set_set_pins(&c, MD7, 1); // set is type

    // so PIO can determine C000 or C010 access
    sm_config_set_in_pins(&c, KSEL0); 

    // HighZ KSEL0 and MD7
    pio_sm_set_consecutive_pindirs(pio, pio_sm, KSEL0, 1, IN); 

    // 74HCT245 Enable signal (via Side Set)
    pio_gpio_init(pio, enable_245_pin);
    pio_sm_set_consecutive_pindirs(pio, pio_sm, enable_245_pin, 1, OUT);
    sm_config_set_sideset_pins(&c, enable_245_pin);

    // configure JMP pin to be the R/W Signal
    sm_config_set_jmp_pin(&c, RW);

    // sm_config_set_in_shift 	(&c,false,false,0);
    // Load our configraution, and jump to program start
    pio_sm_init(pio, pio_sm, pio_offset, &c);

    // set the state machine running
    pio_sm_set_enabled(pio, pio_sm, true);

    //-------------------------------
    // second state machine
    //-------------------------------
    pio_offset = pio_add_program(pio, &dataout_program);
    pio_sm_1 = pio_claim_unused_sm(pio, true);

    c = dataout_program_get_default_config(pio_offset);
    pio_sm_set_enabled(pio, pio_sm_1, false);

    //Set GPIO
    for (int x = MD0; x < MD7; x++){
         pio_gpio_init(pio, x);
    }
    sm_config_set_out_pins(&c, MD0, 7); // TODO: Fix this later
    pio_sm_set_consecutive_pindirs(pio, pio_sm_1, MD0, 7, OUT);
    pio_sm_init(pio, pio_sm_1, pio_offset, &c); // james add
    pio_sm_set_enabled(pio, pio_sm_1, true);
}

void prepare_key_value(uint8_t key_value) {
        // direction of mask and for() depends on GPIO to MDx mapping
        uint8_t io_mask = 0x80; 
        printf("(%#04x): ", key_value);
        //printf("%c", key_value);
        // make sure we don't respond with valid data while
        // changing the GPIO pins
     //   pio_sm_put(pio, pio_sm, (0x0));
        for (int gpio = MD7; gpio >= MD0; gpio--) {
            if (gpio == MD3)
                printf(" ");
            if (io_mask & key_value) {
                gpio_put(gpio,0x1);
                printf("1");
            } else {
                gpio_put(gpio,0x0);
                printf("0");
            }
            io_mask = io_mask >> 1;
        }
        printf("\n");
       // pio_sm_put(pio, pio_sm, (0x1));
       write_key(key_value);
}

uint8_t handle_serial_keyboard() {
    int incoming_char = getchar_timeout_us(0);
    // MEGA-II only seems to like these values
    if ((incoming_char > 0) && (incoming_char < 128)) {
        return incoming_char;
    }
    return 0;
}

void setup() {
    setup_main_databus();
    stdio_init_all();  // so we can see stuff on UART

    // power sequence
    printf("\nInit Suppy Pins");
    setup_power_sequence();
    printf("\nTurning on Supply Pins\n");
    handle_power_sequence(0);

    // debug pin to trigger the external logic analyzer
    printf("\nConfiguring DEBUG Pin (%d)", DEBUG_PIN);
    gpio_init(DEBUG_PIN);
    gpio_set_dir(DEBUG_PIN, GPIO_OUT);
    gpio_put(DEBUG_PIN, 0x0);

    printf("\nConfiguring RESET_CTRL Pin (%d)", RESET_CTL);
    gpio_init(RESET_CTL);
    gpio_set_dir(RESET_CTL, GPIO_OUT);
    gpio_put(RESET_CTL, 0x0);

    // ************************************************************

    // TODO: Add an LED to the board (Whooops)
    // gpio_init(LED_PIN);
    // gpio_set_dir(LED_PIN, GPIO_OUT);

    gpio_init(shifter_enable);
    gpio_set_dir(shifter_enable, GPIO_OUT);
    gpio_put(shifter_enable, true); // the TXB0108 is active HI!

    // yay usb!
    tusb_init();

    // couple of times for funnsies
    // add_repeating_timer_ms(500, blink_led_callback, NULL, &timer1);
    printf("\nEnabling tuh_task");
    add_repeating_timer_ms(-2, repeating_timer_callback, NULL, &timer2);
    printf("\n(---------");
    // printf("Connecting System Clock to Pin 21\n");
    // clock_gpio_init(21, CLOCKS_CLK_GPOUT0_CTRL_AUXSRC_VALUE_CLK_SYS, 10);

    // configure I/O control lines
    printf("\nConfiguring IO Pins");
    printf("\nConfiguring State Machine");
    KBD_pio_setup();  

    // printf("\nConfiguring initial Keyvalue (%c)", 0x20);
    // prepare_key_value(0x20);
    // raise_key();

    printf("\n\n---------\nMega IIe Keyboard Emulatron 2000\n\nREADY.\n] ");
}


void reset_mega(uint8_t reset_type) {
    //reset_type = cold or warm

    printf("Resetting Mega-II...");
    gpio_put(RESET_CTL, 0x1);
    pio_sm_set_enabled(pio, pio_sm, false);
    pio_sm_set_enabled(pio, pio_sm_1, false);
    pio_sm_restart(pio, pio_sm);
    pio_sm_restart(pio, pio_sm_1);
    printf("Resetting Mega-II....");
    busy_wait_ms(100);
    printf(".");
    hid_app_task();
    handle_tinyusb();
    printf("...[DONE]\n");
    pio_sm_set_enabled(pio, pio_sm, true);
    pio_sm_set_enabled(pio, pio_sm_1, true);
    gpio_put(RESET_CTL, 0x0);
}



int main() {
    setup();

    bool a = false;
    while (true) {
        static uint32_t previous_output = 0;
        static uint32_t previous_anyclear = 0;
        static uint8_t io_select = 0;
        static bool any_clear = false;
        
        hid_app_task();
        handle_tinyusb();
        //  handle_serial();

        uint8_t key_value = 0;
        // Check the USB keyboard
      //  check_keyboard_buffer();
        static uint32_t previous_keypress = 0;
        if (nkey > 0) {
            if (millis() - previous_keypress >= 100) {
                write_key(last_key_pressed);
                previous_keypress = millis();
            }
        }
        // getting Mega Attention
        handle_mega_power_button();

        // Check the serial buffer
        key_value = handle_serial_keyboard(); 
        if (key_value > 0) {
            if (key_value == 0x12) { // should be CTRL-R
                //reset_mega(1); // 0 = cold, 1 = warm
                handle_power_sequence(mega_power_state);
            } else {
                prepare_key_value(key_value);
                any_clear = true;
                previous_anyclear = millis();
            }

        }

        // deassert ANYKEY when receiving characters over serial
        if (any_clear && (millis() - previous_anyclear >= serial_anykey_clear_interval)) {
            any_clear = false; 
            //pio_sm_put(pio, pio_sm, (0x0));
            raise_key();
        }
    }

    return 0;  // but you never will hah!
}

void write_key(uint8_t key) {
   // gpio_put(enable_245_pin  , ENABLED);
    printf("+");
    gpio_put(DEBUG_PIN, 0x1);
    pio_sm_put(pio, pio_sm_1, key & 0x7F); 
    pio_sm_put(pio, pio_sm, 0x3);
    pio_interrupt_clear(pio, 1);
}

void raise_key() {
  //  gpio_put(enable_245_pin  , DISABLED);
    printf("-");
    gpio_put(DEBUG_PIN, 0x0);
    if (!pio_interrupt_get(pio,1)) {  //If irq 1 is clear we have a new key still
        pio_sm_put(pio, pio_sm,0x1);
    } else {
        pio_sm_put(pio, pio_sm,0x0);
    }
    
}
