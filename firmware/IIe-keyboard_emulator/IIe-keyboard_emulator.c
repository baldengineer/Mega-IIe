#include <stdio.h>

// These aren't all used yet, but they will be
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
const uint8_t testpins[8] = {11,10,9,8,7,6,5,4};


// From the outside scary world
extern void imma_led(uint8_t state);
extern void hid_app_task(void);
extern bool tusb_init();
extern bool tuh_task();
extern bool any_key;
extern bool tuh_hid_set_report(uint8_t dev_addr, uint8_t instance, uint8_t report_id, uint8_t report_type, void* report, uint16_t len);

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
    state_245 = DISABLED;
    gpio_put(enable_245_pin, state_245);

    // enable test pins to be output
    for (int x=0; x<8; x++) {
        gpio_init(testpins[x]);
        gpio_set_dir(testpins[x], GPIO_OUT);
    }

}

void setup() {
    // get the 245 off MD as soon as possible
    setup_main_databus();

    stdio_init_all();  // so we can see stuff on UART

    // TODO: Add an LED to the board
    // gpio_init(LED_PIN);
    // gpio_set_dir(LED_PIN, GPIO_OUT);

    // yay usb!
    tusb_init();

    // couple of times for funnsies
    // add_repeating_timer_ms(500, blink_led_callback, NULL, &timer1);
    add_repeating_timer_ms(-2, repeating_timer_callback, NULL, &timer2);
    
    printf("---------\nIIe Keyboard Emulatron 2000 READY\n]\n");
}

static inline void KBD_program_init(PIO pio, uint sm, uint offset, uint pin_tx) {
    // copies from UART TX example in the datasheet
    // need to "convert" Circuit Python setup to C-code
    pio_sm_set_pins_with_mask(pio, sm, 1u << pin_tx, 1u << pin_tx);
    pio_sm_set_pindirs_with_mask(pio, sm, 1u << pin_tx, 1u << pin_tx);
    pio_gpio_init(pio, pin_tx);
 
    pio_sm_config c = uart_tx_program_get_default_config(offset);
 
    // OUT shifts to right, no autopull
    sm_config_set_out_shift(&c, true, false, 32);
 
    // We are mapping both OUT and side-set to the same pin, because sometimes
    // we need to assert user data onto the pin (with OUT) and sometimes
    // assert constant values (start/stop bit)
    sm_config_set_out_pins(&c, pin_tx, 1);
}

static inline void uart_tx_program_init(PIO pio, uint sm, uint offset, uint pin_tx, uint baud) {

   }

int main() {
    setup();

    while (true) {
        static uint32_t previous_output = 0;
        static uint8_t io_select = 0;
        hid_app_task();
        handle_tinyusb();
        handle_serial();
        check_keyboard_buffer();

        if (millis() - previous_output >= 100) {  
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
        }
    }

    return 0; // but you never will hah!
}
