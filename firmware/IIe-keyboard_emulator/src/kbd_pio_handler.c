
#include "constants.h"
#include "KBD.pio.h"
#include "hardware/pio.h"

void KBD_pio_setup(PIO *pio, uint *pio_offset, uint *pio_sm, uint *pio_sm_1) {
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