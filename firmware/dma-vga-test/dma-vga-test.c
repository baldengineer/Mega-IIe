#include <stdio.h>
#include <stdlib.h>

#include "hardware/dma.h"
#include "hardware/pio.h"
#include "hardware/structs/bus_ctrl.h"
#include "pico/stdlib.h"

#include <tusb.h>

#include "TEST_CAP.pio.h"

PIO pio;
uint pio_offset;
uint pio_sm;
uint rgb_dma_chan = 0;

#define LED_OFF 0
#define LED_ON  1
#define LED_TOG 2

#define LINE_COUNT 192
#define WINDOW 19

const uint LED_PIN = PICO_DEFAULT_LED_PIN; // 3 on VGA2040
bool led_pin_state = LED_ON;


void TEST_CAP_pio_init() {
    // do the setup things
    pio = pio0;
    pio_offset = pio_add_program(pio, &TEST_CAP_program);

    pio_sm = pio_claim_unused_sm(pio, true);
    pio_sm_config c = TEST_CAP_program_get_default_config(pio_offset);
    pio_sm_set_enabled(pio, pio_sm, false);

    sm_config_set_in_pins(&c, 14); // capture 7M too, because why not?
    pio_sm_set_consecutive_pindirs(pio, pio_sm, 12, 8, GPIO_IN);

    //sm_config_set_clkdiv(&c, ???); // LA example reduces sample rate with this

    // From C SDK PDF:
    // sm_config_set_in_shift sets the shift direction to rightward, enables autopush, and sets the autopush threshold to 32.
    // The state machine keeps an eye on the total amount of data shifted into the ISR, and on the in which reaches or
    // breaches a total shift count of 32 (or whatever number you have configured), the ISR contents, along with the new data
    // from the in. goes straight to the RX FIFO. The ISR is cleared to zero in the same operation.
    sm_config_set_in_shift(&c, true, true, 32); // i've setup 8 bits to make this boundry clean, i think
    sm_config_set_fifo_join(&c, PIO_FIFO_JOIN_RX); // PIO_FIFO_JOIN_NONE, _RX, _TX
    pio_sm_init(pio, pio_sm, pio_offset, &c);
}

void TEST_CAP_pio_arm(uint32_t *capture_buf, size_t capture_size_words) {
    pio_sm_set_enabled(pio, pio_sm, false);
    pio_sm_clear_fifos(pio, pio_sm);  
    //pio_sm_restart(pio, pio_sm);

    dma_channel_config c = dma_channel_get_default_config(rgb_dma_chan);
    channel_config_set_read_increment(&c, false);
    channel_config_set_write_increment(&c, true);
    channel_config_set_dreq(&c, pio_get_dreq(pio, pio_sm, false));

    dma_channel_configure(rgb_dma_chan, &c,
        capture_buf,            // Destination pointer
        &pio->rxf[pio_sm],      // Source pointer
        capture_size_words,     // Number of transfers
        true                    // Start immediately
    );

   // puts("[PIO Arm] Starting CAP Pio.");
    pio_sm_restart(pio, pio_sm);
    pio_sm_exec(pio, pio_sm, pio_encode_jmp(TEST_CAP_offset_start));
    pio_sm_set_enabled(pio, pio_sm, true);
}

void print_capture_buf(const uint32_t *buf, uint word_count, uint offset) {
   // printf("Captured: Hex, Binary, RGBx[4 Words, right to left]\n");
    for (int x=0; x < word_count; x++) {
       // printf("%d:%#8x, b%b\n", x, buf[x], buf[x]); // lol, %b works
       uint32_t current_buf = buf[x+(70*offset)];
        printf("%d:%#8x, ", x+(70*offset), current_buf); // lol, %b works

        // RGB4 RGB8 RGB1 RGB2
        // 1010 1000 0011 0001 0010 0000 1111 1101

        for (int j=0; j<8; j++) {
            uint offset = 4 * j;
            printf((current_buf & (0x1<<2+(offset))) ? "1" : "0");
            printf((current_buf & (0x1<<3+(offset))) ? "1" : "0");
            printf((current_buf & (0x1<<0+(offset))) ? "1" : "0");
            printf((current_buf & (0x1<<1+(offset))) ? "1" : "0");
            printf((j!=7) ? ", " : "");
        } 
        printf("\n");

        // extact RGB8,4,2,1 for printing
        // for (int j=0; j<4; j++) {
        //     uint offset = 8 * j;
        //     printf((buf[x] & (0x1<<4+(offset))) ? "1" : "0");
        //     printf((buf[x] & (0x1<<5+(offset))) ? "1" : "0");
        //     printf((buf[x] & (0x1<<2+(offset))) ? "1" : "0");
        //     printf((buf[x] & (0x1<<3+(offset))) ? "1" : "0");
        //     printf((j!=3) ? ", " : "");
        // } 
        // printf("\n");
    }
    printf("\n");
}

uint ctrl_status_led(uint state) {
    switch (state) {
        case LED_OFF:
            led_pin_state = LED_OFF;
            break;
        case LED_ON:
            led_pin_state = LED_ON;
            break;
        case LED_TOG:
            led_pin_state = !led_pin_state;
            break;
    }
    gpio_put(LED_PIN, led_pin_state);
    return led_pin_state;
}


int main() {
    // wait for USB CDC to be up
    gpio_init(LED_PIN);
    gpio_set_dir(LED_PIN, GPIO_OUT);
    ctrl_status_led(LED_ON);
    stdio_init_all();
    while(!tud_cdc_connected()) { 
        sleep_ms(100);
        ctrl_status_led(LED_TOG);
    }
    sleep_ms(100);
    printf("Hello World...\n");
    ctrl_status_led(LED_OFF);

    //now do the things
    printf("\n[Init] TEST_CAP Pio...");
    TEST_CAP_pio_init();
    printf("done!");

    puts("\n\n----\nDMA VGA Test.");
    // if Patt Gen only sends 1 line at a time, this words well without
    // breakpoints

    gpio_init(WINDOW);
    gpio_set_dir(WINDOW,GPIO_IN);

    while(1) {
        puts("Starting capture");
        uint buf_size_words = 70; // 70 32-bit words plus 8 more bits.
        uint32_t *capture_buf = malloc(buf_size_words * sizeof(uint32_t) * 192);
        hard_assert(capture_buf); // did we get buffer?

        // detect window high for 1ms
        uint32_t previous_window_us = 0;
        bool vblank = false;

        while (!gpio_get(WINDOW)); // wait for window to deassert 
        previous_window_us = time_us_32();

        while(time_us_32() - previous_window_us <= 2500) {
            if (gpio_get(WINDOW) == 0x0)
                previous_window_us = time_us_32();
        }

        // restart the state machines ... 
        printf("Vblank\n");
          

        for (uint line_counter=0; line_counter < LINE_COUNT; line_counter++) {
            // capture_buf+(line_counter*(32*buf_size_words)
            // &array[index]

            TEST_CAP_pio_arm((capture_buf + (line_counter * buf_size_words)), buf_size_words);
            dma_channel_wait_for_finish_blocking(rgb_dma_chan); // not sure I did the maths right...
        //  printf(".");
        }

        print_capture_buf(capture_buf, buf_size_words, 191);
        free(capture_buf);
        puts("Breakpoint here...");
    }
    while(1);
        // while(1);
       // sleep_ms(1000);
    return 0;
}
