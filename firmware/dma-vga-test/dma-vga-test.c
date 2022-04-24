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
uint pio_sm_1;

void TEST_CAP_pio_setup() {
    // do the setup things
    pio = pio0;
    pio_offset = pio_add_program(pio, &TEST_CAP_program);
    pio_sm = pio_claim_unused_sm(pio, true);

    pio_sm_config c = TEST_CAP_program_get_default_config(pio_offset);
    pio_sm_set_enabled(pio, pio_sm, false);
}



int main() {
    stdio_init_all();

    printf("\n[Init] - TEST_CAP Pio...");
    TEST_CAP_pio_setup();
    printf("done!");




    puts("\nHello, world!");

    return 0;
}
