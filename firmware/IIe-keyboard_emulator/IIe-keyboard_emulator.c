#include <stdio.h>

#include "hardware/clocks.h"
#include "hardware/pio.h"
#include "hardware/timer.h"
#include "hardware/watchdog.h"
#include "pico/stdlib.h"

#define ON 0x1
#define OFF 0x0

extern void hid_app_task(void);

uint8_t keys[101] = {0};

const uint16_t led_interval = 500;
bool print_usb_report = false;
extern void imma_led(uint8_t state);
extern bool any_key;
volatile bool kbd_connected = false;
volatile uint8_t kbd_led_state[1] = {0x0};
const uint LED_PIN = PICO_DEFAULT_LED_PIN;  // its the LED pin
struct repeating_timer timer1;
struct repeating_timer timer2;
volatile bool dousb = false;

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
        if (scroll_led_state) {
            kbd_led_state[0] = kbd_led_state[0] | 0x04;
        } else {
            kbd_led_state[0] = kbd_led_state[0] & 0xFB;
        }
        wtf_bbq_led();
    }
}

bool repeating_timer_callback(struct repeating_timer *t) {
    dousb = true;
    return true;
}

int main() {
    // Timer example code - This example fires off the callback after 2000ms

    static uint32_t prev_key_millis = 0;
    static uint16_t key_delay = 100;
    uint16_t delay_time = 1000;

    stdio_init_all();  // so we can see stuff on UART
    gpio_init(LED_PIN);
    gpio_set_dir(LED_PIN, GPIO_OUT);

    tusb_init();
    add_repeating_timer_ms(500, blink_led_callback, NULL, &timer1);
    add_repeating_timer_ms(-2, repeating_timer_callback, NULL, &timer2);

    printf("---------\nHello There!\n---------\n");
    while (true) {
        static uint32_t previous_millis = 0;
        uint32_t current_millis = millis();

        // tinyusb stuff
        if (dousb) {
            tuh_task();
            dousb = false;
        }
        // hid_app_task();
        static unsigned long prev_whatever_micros = 0;
        
        if (time_us_32() - prev_whatever_micros >= 10000000) {
            printf("%d\n", (time_us_32()/1000));
            prev_whatever_micros = time_us_32();
        }

        // print something when receiving any character
        int incoming_char = getchar_timeout_us(0);
        if ((incoming_char > 31) && (incoming_char < 127)) {
            switch (incoming_char) {
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

        // check the keyboard buffer
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

    return 0;
}
