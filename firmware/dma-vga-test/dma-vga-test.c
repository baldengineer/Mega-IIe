#include <stdio.h>
#include <stdlib.h>

#include "pico/stdlib.h"
#include "hardware/dma.h"
#include "hardware/pio.h"
#include "hardware/structs/bus_ctrl.h"

#include "TEST_CAP.pio.h"

PIO pio;
uint pio_offset;
uint pio_sm;
uint rgb_dma_chan;

void TEST_CAP_pio_init() {
    // do the setup things
    pio = pio0;
    pio_offset = pio_add_program(pio, &TEST_CAP_program);

    pio_sm = pio_claim_unused_sm(pio, true);
    pio_sm_config c = TEST_CAP_program_get_default_config(pio_offset);
    pio_sm_set_enabled(pio, pio_sm, false);

    sm_config_set_in_pins(&c, 12); // capture 7M too, because why not?
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
    pio_sm_clear_fifos(pio, pio_sm);  //pio reset also clears these buffers
    pio_sm_restart(pio, pio_sm);

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
    puts("[PIO Arm] Starting CAP Pio.");
    pio_sm_set_enabled(pio, pio_sm, true);
}

void print_capture_buf(const uint32_t *buf) {
    printf("Capture: lol\n");
    // Each FIFO record may be only partially filled with bits, depending on
    // whether pin_count is a factor of 32.
    // uint record_size_bits = 32;
    // for (int sample = 0; sample < n_samples; ++sample) {
    //     uint word_index = bit_index / record_size_bits;
    //     // Data is left-justified in each FIFO entry, hence the (32 - record_size_bits) offset
    //     uint word_mask = 1u << (bit_index % record_size_bits + 32 - record_size_bits);
    //     printf(buf[word_index] & word_mask ? "." : " ");
    // }
    // printf("\n");
}


int main() {
    stdio_init_all();

    printf("\n[Init] TEST_CAP Pio...");
    TEST_CAP_pio_init();
    printf("done!");

    puts("\n\n----\nDMA VGA Test.");

    while(1) {
        puts("Starting capture (breakpoint!)");
        // create buffer for a line
        uint buf_size_words = 560;
        uint32_t *capture_buf = malloc(buf_size_words * sizeof(uint32_t));
        hard_assert(capture_buf); // did we get buffer?

        // Grant high bus priority to the DMA, so it can shove the processors out
        // of the way. This should only be needed if you are pushing things up to
        // >16bits/clk here, i.e. if you need to saturate the bus completely.
        // not entirely sure when this is needed, but will leave here just in case.
        // bus_ctrl_hw->priority = BUSCTRL_BUS_PRIORITY_DMA_W_BITS | BUSCTRL_BUS_PRIORITY_DMA_R_BITS;

        TEST_CAP_pio_arm(capture_buf, buf_size_words);

        dma_channel_wait_for_finish_blocking(rgb_dma_chan); // not sure I did the maths right...

        print_capture_buf(capture_buf);
    }


    return 0;
}
