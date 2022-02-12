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

queue_t keycode_queue;

// old habits die hard
uint32_t millis() {
    return ((time_us_32() / 1000));
}

// example of setting leds on keyboard
/*void wtf_bbq_led() {
    static uint8_t dev_addr = 0x1;
    static uint8_t instance = 0x0;
    static uint8_t report_id = 0x0;
    static uint8_t report_type = 0x2;

    if (kbd_connected)
        tuh_hid_set_report(dev_addr, instance, report_id, report_type, kbd_led_state, 1);
}*/

// trying to reduce bus contention
bool repeating_timer_callback(struct repeating_timer *t) {
    dousb = true;
    return true;
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
   // if (dousb) {
        tuh_task();
   //     dousb = false;
   // }
}

// TODO: convert to using the _mask function calls
void setup_main_databus() {
    const uint8_t main_data[] = {MD0, MD1, MD2, MD3, MD4, MD5, MD6};
    for (int x = 0; x < (sizeof(main_data)/sizeof(main_data[0])); x++) {
        gpio_init(main_data[x]);
        gpio_set_dir(main_data[x], GPIO_OUT);
        gpio_put(main_data[x], 0x0);
    }
}

inline void queue_key(uint8_t key) {
    // if the PIO is ready, let's send in the character now
    if (pio_interrupt_get(pio,1) && queue_is_empty(&keycode_queue)) {
        write_key(key);
        printf("Im[%c]", key);
    }  else if (!queue_try_add(&keycode_queue, &key))
        printf("Failed to add [%c]\n", key);
}

void prepare_key_value(uint8_t key_value) {
        // direction of mask and for() depends on GPIO to MDx mapping
        uint8_t io_mask = 0x80; 
        printf("(%#04x): ", key_value);

        // changing the GPIO pins
        for (int gpio = MD7; gpio >= MD0; gpio--) {
            if (gpio == MD3)
                printf(" ");
            if (io_mask & key_value) {
               // gpio_put(gpio,0x1);
                printf("1");
            } else {
               // gpio_put(gpio,0x0);
                printf("0");
            }
            io_mask = io_mask >> 1;
        }
        printf("\n");
        //write_key(key_value);
        queue_key(key_value);
}

// TODO  pass references to pio stuff so I can move to another file
void reset_mega(uint8_t reset_type) {
    //reset_type = cold or warm
    printf("Disabling Mega-II...");
    gpio_put(RESET_CTL, 0x1);
    printf("\nReseting PIO...");
    pio_sm_set_enabled(pio, pio_sm, false);
    pio_sm_set_enabled(pio, pio_sm_1, false);
    pio_sm_restart(pio, pio_sm);
    pio_sm_restart(pio, pio_sm_1);
    printf("\nPausing");
    busy_wait_ms(100);
    printf(".");
    hid_app_task();
    handle_tinyusb();
    printf("...[DONE]\n");
    pio_sm_set_enabled(pio, pio_sm, true);
    pio_sm_set_enabled(pio, pio_sm_1, true);
    printf("Enabling Mega-II...\n");
    gpio_put(RESET_CTL, 0x0);
}



inline void write_key(uint8_t key) {
    pio_sm_put(pio, pio_sm_1, key & 0x7F); 
    pio_sm_put(pio, pio_sm, 0x3);
    pio_interrupt_clear(pio, 1);
}

inline void raise_key() {
    if (!pio_interrupt_get(pio,1)) {  //If irq 1 is clear we have a new key still
        pio_sm_put(pio, pio_sm,0x1);
    } else {
        pio_sm_put(pio, pio_sm,0x0);
    }
}

inline static uint8_t handle_serial_keyboard() {
    int incoming_char = getchar_timeout_us(0);
    // MEGA-II only seems to like these values
    if ((incoming_char > 0) && (incoming_char < 128)) {
        return incoming_char;
    }
    return 0;
}

static void out_init(uint8_t pin, bool state) {
    gpio_init(pin);
    gpio_set_dir(pin, GPIO_OUT);
    gpio_put(pin, state);
}

void setup() {
    //setup_main_databus();
    stdio_init_all();  // so we can see stuff on UART

    // power sequence
    printf("\nInit Suppy Pins");
    setup_power_sequence();
    printf("\nTurning on Supply Pins\n");
    handle_power_sequence(0);

    // debug pin to trigger the external logic analyzer
    printf("\nConfiguring DEBUG Pin (%d)", DEBUG_PIN);
    out_init(DEBUG_PIN, 0x0);

    printf("\nConfiguring RESET_CTRL Pin (%d)", RESET_CTL);
    out_init(RESET_CTL, 0x0);

    // ************************************************************
    out_init(shifter_enable, 0x1); // the TXB0108 is active HI!

    // yay usb!
    tusb_init();

    // helps with throtting usb (may get fixed in future TinyUSB, I hope)
    printf("\nEnabling tuh_task");
    add_repeating_timer_ms(-2, repeating_timer_callback, NULL, &timer2);
    printf("\n(---------");

    // configure I/O control lines
    printf("\nConfiguring OAPL and CAPL");
    out_init(OAPL_pin, 0x0);
    out_init(CAPL_pin, 0x0);

    printf("\nConfiguring State Machine");
    KBD_pio_setup();  

    printf("\nConfiguring keyboard queue");
    queue_init(&keycode_queue, sizeof(uint8_t), 10); // really only need 6, but wutwevers

    printf("\n\n---------\nMega IIe Keyboard Emulatron 2000\n\nREADY.\n] ");
}

inline static void handle_apple_keys() {
    gpio_put(OAPL_pin, OAPL_state);
    gpio_put(CAPL_pin, CAPL_state);
}

inline static void handle_serial_buffer() {
    static uint32_t prev_serial_clear = 0;
    static bool serial_clear = false;

    uint8_t key_value = handle_serial_keyboard(); 
    if (key_value > 0) {
        if (key_value == 0x12) { // should be CTRL-R
            reset_mega(1); // 0 = cold, 1 = warm
            //handle_power_sequence(mega_power_state);
        } else {
            prepare_key_value(key_value);
            serial_clear = true;
            prev_serial_clear = millis();
        }
    }

    // deassert ANYKEY when receiving characters over serial
    if (serial_clear && (millis() - prev_serial_clear >= serial_anykey_clear_interval)) {
        serial_clear = false; 
        //pio_sm_put(pio, pio_sm, (0x0));
        raise_key();
    }
}

inline static void handle_three_finger_reset() {
    if (do_a_reset) {
        do_a_reset = false;
        busy_wait_ms(THREE_FINGER_WAIT);
        reset_mega(0);
    }
}   

int main() {
    setup();

    bool a = false;
    while (true) {
        hid_app_task();
        handle_tinyusb();

        handle_apple_keys();
        handle_three_finger_reset();

        // getting Mega Attention
        handle_mega_power_button();

        // Check the serial buffer
        handle_serial_buffer();

        // handle usb keyboard
        uint8_t key_value = last_key_pressed;

        // keep the PIO queue full I think
        if (pio_interrupt_get(pio,1) && !queue_is_empty(&keycode_queue)) {
            uint8_t next_key;
            if (queue_try_remove(&keycode_queue, &next_key))
                write_key(next_key);
        }
     /*
        switch (nkey) {               
            case NKEY_NEW:
                nkey_last_press = time_us_32();
                nkey = NKEY_ARMED;
            break;

            case NKEY_ARMED:
                if ((time_us_32() - nkey_last_press) >= nkey_wait_us) {
                    nkey = NKEY_REPEATING;
                    write_key(last_key_pressed);
                }
            break;

            case NKEY_REPEATING:
                if ((time_us_32() - nkey_last_press) >= nkey_repeat_us) {
                    write_key(last_key_pressed);
                    nkey_last_press = time_us_32();
                }
            break;

            case NKEY_NONE:
                //  ¯\_(ツ)_/¯
                raise_key(); // no moar keys
                nkey = NKEY_IDLE;
            break;

            case NKEY_IDLE:
            default:
 
            break;
        }
        
        static uint32_t previous_keypress = 0;
        if (nkey > 0) {
            if (millis() - previous_keypress >= 100) {
                write_key(last_key_pressed);
                previous_keypress = millis();
            }
        } */

    } // while (true)
    return 0;  // but you never will hah!
} // it's da main thing


