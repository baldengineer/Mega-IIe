
#include <stdio.h>
#include "hardware/clocks.h"
#include "hardware/pio.h"
#include "hardware/timer.h"
#include "hardware/watchdog.h"
#include "pico/stdlib.h"

#include "constants.h"

void handle_mega_power_button();
void handle_power_sequence(uint8_t state);
void setup_power_sequence();

extern bool mega_power_state;

void setup_power_sequence() {
    // Init Outputs and turn it all off
    gpio_init_mask(PWR_SEQ_MASK);
    gpio_put_masked(PWR_SEQ_MASK, 0x0);   // does this set the value for output before enabling it?
    gpio_set_dir_out_masked(PWR_SEQ_MASK);
    gpio_put_masked(PWR_SEQ_MASK, 0x0);

    // Get Mega Power Button Ready
    gpio_init(MEGA_POWER);
    gpio_set_input_enabled(MEGA_POWER, true);
    gpio_pull_up(MEGA_POWER);
}

inline void handle_mega_power_button() {
    static bool prev_mega_power = NOT_PRESSED;

    bool curr_mega_power = gpio_get(MEGA_POWER);

    if (curr_mega_power != prev_mega_power) {
        if (curr_mega_power == PRESSED) {
            mega_power_state = !mega_power_state;
            handle_power_sequence(mega_power_state);
        }
        prev_mega_power = curr_mega_power;
    }
}

void handle_power_sequence(uint8_t state) {
    // state 0: turn off everything
    // state 1: turn on everything
    // state 2: power cycle
    switch(state) {
        case 0:
            printf("Turning off supplies.\n");
            gpio_put_masked(PWR_SEQ_MASK, 0x0);
        break;

        case 1:
            printf("Turning on Supplies.\n");
            gpio_put_masked(PWR_SEQ_MASK, PWR_SEQ_MASK); // mask has the bits we want
        break;

        case 2:
            printf("Cycling Power\n");
            printf("Off...");
            gpio_put_masked(PWR_SEQ_MASK, 0x0);
            busy_wait_ms(250);
            printf("---");
            busy_wait_ms(250);
            printf("On...\n");
            gpio_put_masked(PWR_SEQ_MASK, PWR_SEQ_MASK);
        break;
    }
}