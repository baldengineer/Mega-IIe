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

// IIe But Pins
#define KSEL0 3
#define RW 20
#define MD7 4
#define MD6 5
#define MD5 6
#define MD4 7
#define MD3 8
#define MD2 9
#define MD1 10
#define MD0 11

#define SERIAL_ANYKEY_CLEAR_INTERVAL 50

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
const uint DEBUG_PIN = 24;

// PIO Globals
PIO pio;
uint pio_offset;
uint pio_sm;

// From the outside scary world
extern void imma_led(uint8_t state);
extern void hid_app_task(void);
extern bool tusb_init();
extern bool tuh_task();
extern bool any_key;
extern bool tuh_hid_set_report(uint8_t dev_addr, uint8_t instance, uint8_t report_id, uint8_t report_type, void *report, uint16_t len);
static inline void KBD_pio_setup();

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
    const uint8_t main_data[7] = {5, 6, 7, 8, 9, 10, 11};
    for (int x = 0; x < 7; x++) {
        gpio_init(main_data[x]);
        gpio_set_dir(main_data[x], GPIO_OUT);
        gpio_put(main_data[x], 0x1);
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
    pio_sm_set_consecutive_pindirs(pio, pio_sm, KSEL0, 2, IN); 

    // 74HCT245 Enable signal (via Side Set)
    pio_gpio_init(pio, enable_245_pin);
    pio_sm_set_consecutive_pindirs(pio, pio_sm, enable_245_pin, 1, OUT);
    sm_config_set_sideset_pins(&c, enable_245_pin);

    // configure JMP pin to be the R/W Signal
    sm_config_set_jmp_pin(&c, RW);

    // Load our configraution, and jump to program start
    pio_sm_init(pio, pio_sm, pio_offset, &c);
    // set the state machine running
    pio_sm_set_enabled(pio, pio_sm, true);
}


void prepare_key_value(uint8_t key_value) {
        // direction of mask and for() depends on GPIO to MDx mapping
        uint8_t io_mask = 0x40; 
        //printf("(%#04x): ", key_value);
        printf("%c", key_value);
        // make sure we don't respond with valid data while
        // changing the GPIO pins
        pio_sm_put(pio, pio_sm, (0x0));
        for (int gpio = MD6; gpio <= MD0; gpio++) {
            if (io_mask & key_value) {
                gpio_put(gpio, 0x1);
                // printf("1");
            } else {
                gpio_put(gpio, 0x0);
                // printf("0");
            }
            io_mask = io_mask >> 1; 
        }
//        printf("\n");
        pio_sm_put(pio, pio_sm, (0x1));
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

    // TODO: Add an LED to the board
    // gpio_init(LED_PIN);
    // gpio_set_dir(LED_PIN, GPIO_OUT);

    // debug pin to trigger the external logic analyzer
    printf("Configuring DEBUG Pin (%d)\n", DEBUG_PIN);
    gpio_init(DEBUG_PIN);
    gpio_set_dir(DEBUG_PIN, GPIO_OUT);
    gpio_put(DEBUG_PIN, 0x0);

    // yay usb!
    tusb_init();

    // couple of times for funnsies
    // add_repeating_timer_ms(500, blink_led_callback, NULL, &timer1);
    // add_repeating_timer_ms(-2, repeating_timer_callback, NULL, &timer2);
    printf("(---------\n");
    // printf("Connecting System Clock to Pin 21\n");
    // clock_gpio_init(21, CLOCKS_CLK_GPOUT0_CTRL_AUXSRC_VALUE_CLK_SYS, 10);

    printf("Configuring State Machine\n");
    KBD_pio_setup();  
    printf("Configuring initial Keyvalue (%c)", 0x20);
    prepare_key_value(0x20);

    printf("---------\nIIe Keyboard Emulatron 2000 READY\n]\n");
}

int main() {

    setup();

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
        check_keyboard_buffer();

        // Check the serial buffer
        key_value = handle_serial_keyboard(); 
        if (key_value > 0) {
            prepare_key_value(key_value);
            any_clear = true;
            previous_anyclear = millis();
        }

        // deassert ANYKEY when receiving characters over serial
        if (any_clear && (millis() - previous_anyclear >= SERIAL_ANYKEY_CLEAR_INTERVAL)) {
            any_clear = false;
            pio_sm_put(pio, pio_sm, (0x0));
        }
    }

    return 0;  // but you never will hah!
}

