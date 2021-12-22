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

#include <stdio.h>

// These aren't all used yet, but they will be
#include "KBD.pio.h"
#include "hardware/clocks.h"
#include "hardware/pio.h"
#include "hardware/timer.h"
#include "hardware/watchdog.h"
#include "pico/stdlib.h"

// So much easier to read
#define ON 0x1
#define OFF 0x0

#define ENABLED 0x0
#define DISABLED 0x1

#define OUT true
#define IN false

	uint8_t keys[101] = {0};

// Useful flags for useful things
volatile bool kbd_connected = false;
volatile bool dousb = false;
volatile uint8_t kbd_led_state[1] = {0x0};
bool print_usb_report = false;
struct repeating_timer timer1;
struct repeating_timer timer2;

// Constantly constant
const uint16_t led_interval = 500;
const uint16_t key_delay = 100;
const uint16_t delay_time = 1000;

// IO Pins
const uint LED_PIN = PICO_DEFAULT_LED_PIN;  // its the LED pin
const uint8_t testpins[8] = {11, 10, 9, 8, 7, 6, 5, 4};

// From the outside scary world
extern void imma_led(uint8_t state);
extern void hid_app_task(void);
extern bool tusb_init();
extern bool tuh_task();
extern bool any_key;
extern bool tuh_hid_set_report(uint8_t dev_addr, uint8_t instance, uint8_t report_id, uint8_t report_type, void *report, uint16_t len);
static inline void KBD_pio_setup(uint8_t pin, uint8_t pin_count);

// Pins for us to use somewhere else
const uint8_t enable_245_pin = 12;
bool state_245 = DISABLED;

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
bool blink_led_callback(struct repeating_timer *t) {
    (void)t;
    static bool led_state = OFF;

    // blink GP25 LED (which I don't have)
    led_state = !led_state;
    gpio_put(LED_PIN, led_state);

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
}

// Tim said this helps to prevent bus contention
// it doesn't hurt but not sure if it helps
bool repeating_timer_callback(struct repeating_timer *t) {
    dousb = true;
    return true;
}

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
    if (any_key || (current_millis - prev_key_millis >= key_delay)) {
        bool did_print = false;
        any_key = false;
        for (uint8_t x = 0; x < 101; x++) {
            if (keys[x]) {
                if (x > 0)
                    printf(",");
                printf("%d", x);
                did_print = true;
            }
        }
        if (did_print)
            printf("\n");

        prev_key_millis = current_millis;
    }
}

void handle_tinyusb() {
    if (dousb) {
        tuh_task();
        dousb = false;
    }
}

void setup_main_databus() {
    gpio_init(enable_245_pin);
    gpio_set_dir(enable_245_pin, GPIO_OUT);

    // disable our databus buffer
    state_245 = ENABLED;
    gpio_put(enable_245_pin, state_245);

    // enable test pins to be output
    /*  for (int x=0; x<8; x++) {
        gpio_init(testpins[x]);
        gpio_set_dir(testpins[x], GPIO_OUT);
    }
  */
}

PIO pio;
uint pio_offset;
uint pio_sm;
uint pio_sm_1;

static inline void KBD_pio_setup(uint8_t pin, uint8_t pin_count) {
    pio = pio0;
    pio_offset = pio_add_program(pio, &KBD_program);
    pio_sm = pio_claim_unused_sm(pio, true);

    pio_sm_config c = KBD_program_get_default_config(pio_offset);

    // map SM's OUT pin group to one pin?
    // sm_config_set_out_pins (pio_sm_config *c, uint out_base, uint out_count)
    //sm_config_set_out_pins(&c, pin, pin_count);

    pio_sm_set_enabled(pio, pio_sm, false);

    // for (int x = 0; x < pin_count; x++)
    //     sm_config_set_in_pins(pio, (pin+x));
    sm_config_set_out_pins(&c, 4, 1); // TODO: Fix this later

    // init GPIO for OUT (not needed for IN)
    pio_gpio_init(pio, 4);

    // set pin direction to 
    pio_sm_set_consecutive_pindirs(pio, pio_sm, 3, 22, IN);

// map MD7:0 to PINS for output
// KSEL0 to LSB to PINS for input
// give the PIO/SM the pins KSEL1, KSEL2, R/W, PH0

    // configure KSEL0,MD[7:0], 
    // don't care 1,2 R/W, and PH0 as INPUT (17-21)
    sm_config_set_in_pins(&c, 3);

    // set pin direction to 
    pio_sm_set_consecutive_pindirs(pio, pio_sm, 3, 2, IN);

    // side set for the enable signal
    pio_gpio_init(pio, enable_245_pin);
    pio_sm_set_consecutive_pindirs(pio, pio_sm, enable_245_pin, 1, OUT);
  
    // configure JMP pin to be the R/W Signal
    sm_config_set_jmp_pin(&c, 20);

    // create the KSEL0 set pin why is there a pio_sm and sm_config?
   // pio_sm_set_set_pins(pio, pio_sm, PIN_TO_USE, NUM_PINS);
//#    sm_config_set_set_pins(&c, 4, 1);

    // side set for OE signal
    sm_config_set_sideset_pins(&c, enable_245_pin);

   // sm_config_set_in_shift 	(&c,false,false,0);
    // Load our configraution, and jump to program start
    pio_sm_init(pio, pio_sm, pio_offset, &c);

    // set the state machine running
    pio_sm_set_enabled(pio, pio_sm, true);
    
    pio_offset = pio_add_program(pio, &dataout_program);
    pio_sm = pio_claim_unused_sm(pio, true);

    c = dataout_program_get_default_config(pio_offset);
    pio_sm_set_enabled(pio, pio_sm_1, false);
    //Set GPIO
    for (int x = 5; x < 13; x++){
         pio_gpio_init(pio, x);
    }
    sm_config_set_out_pins(&c, 5, 1); // TODO: Fix this later
    pio_sm_set_consecutive_pindirs(pio, pio_sm_1, 5, 7, OUT);
    pio_sm_set_enabled(pio, pio_sm_1, true);
    

}

void setup() {
    // get the 245 off MD as soon as possible
   // setup_main_databus();

    stdio_init_all();  // so we can see stuff on UART

    // TODO: Add an LED to the board
    // gpio_init(LED_PIN);
    // gpio_set_dir(LED_PIN, GPIO_OUT);

    // yay usb!
    tusb_init();

    // couple of times for funnsies
    // add_repeating_timer_ms(500, blink_led_callback, NULL, &timer1);
    add_repeating_timer_ms(-2, repeating_timer_callback, NULL, &timer2);
    printf("(---------\n");
    // printf("Connecting System Clock to Pin 21\n");
    // clock_gpio_init(21, CLOCKS_CLK_GPOUT0_CTRL_AUXSRC_VALUE_CLK_SYS, 10);

    printf("Configuring State Machine\n");
    KBD_pio_setup(4, 8);  //D0-D7 plus enable_245 (?)

    printf("---------\nIIe Keyboard Emulatron 2000 READY\n]\n");
}

#define CHAR_BIT 8

uint8_t reversi(uint8_t v) {
  //  unsigned int v;                    // input bits to be reversed
    uint8_t r = v & 1;            // r will be reversed bits of v; first get LSB of v
    int s = sizeof(v) * CHAR_BIT - 1;  // extra shift needed at end

    for (v >>= 1; v; v >>= 1) {
        r <<= 1;
        r |= v & 1;
        s--;
    }
    r <<= s;  // shift when v's highest bits are zero
    return r;
}

int main() {
    setup();
    gpio_init(22);
    gpio_init(17);
    gpio_init(16);
    gpio_init(13);
    gpio_init(14);
    gpio_set_dir(22,true);
    gpio_set_dir(17,true);
    gpio_set_dir(16,true);
    gpio_set_dir(13,true);
    gpio_set_dir(14,true);

    gpio_put(13,true); //RW
    gpio_put(22,true); //KSEL0
    gpio_put(17,true); //KSEL1
    gpio_put(16,true); //KSEL2
    gpio_put(14,false); //PH
    bool a = false;
    while (true) {
        static uint32_t previous_output = 0;
        static uint8_t io_select = 0;
      //  hid_app_task();
      //  handle_tinyusb();
     //   handle_serial();
     //   check_keyboard_buffer();

        static uint32_t previous_key = 0;   //A1 is 0x20 and C1 is 0x41
        static uint32_t previous_check = 0;
        static uint8_t ksel = 0;
         static uint8_t rsel = 0;
        static uint8_t the_key = 0xC1; //1010 0000   // 1100 0001
        static uint8_t c =0;
        if (millis() - previous_key >= 400) {
            pio_sm_put(pio, pio_sm, 0); 
            previous_key = millis();
            a=false;
        }else if (millis() - previous_key >= 300 && !a) {
            a=true;
           pio_sm_put(pio, pio_sm, 3);
        }
        if (millis() - previous_check >= 2) {
            
            gpio_put(13,rsel); //RW
            gpio_put(22,ksel); //KSEL0
            gpio_put(17,false); //KSEL1
            gpio_put(16,false); //KSEL2
            gpio_put(14,true); //PH0 Data phase
            busy_wait_ms(1);
            gpio_put(13,true); //RW
            gpio_put(22,true); //KSEL0
            gpio_put(17,true); //KSEL1
            gpio_put(16,true); //KSEL2
            gpio_put(14,false); //PH
            c++;
            if(c>10){
                rsel = (rsel+1) % 2;
            }
            if(c>20){
            ksel = (ksel+1) % 2;//Toggle between c010 and c000
            c=0;
            }
            previous_check = millis();
        }
        /*    if (millis() - previous_output >= 100) {  
            // defaults to disabled, enable over serial
            // and remove this   
            gpio_put(enable_245_pin, state_245);
            if (io_select > 7) {
                io_select = 0;
                for (int x=0; x<8; x++)
                    gpio_put(testpins[x], 0x0);
            }
            gpio_put(testpins[io_select++], 0x1);

            previous_output = millis();
        }*/
    }

    return 0;  // but you never will hah!
}
void write_key(uint8_t key)
{
    pio_sm_put(pio, pio_sm_1, key & 0x7F); 
    pio_sm_put(pio, pio_sm,0x3);
    pio_interrupt_clear(pio,1);
}
void raise_key()
{
    if(!pio_interrupt_get(pio,1)){  //If irq 1 is clear we have a new key still
        pio_sm_put(pio, pio_sm,0x1);
    }else{
        pio_sm_put(pio, pio_sm,0x0);
    }
    
}