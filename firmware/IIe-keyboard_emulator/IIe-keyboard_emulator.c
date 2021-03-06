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

// trying to reduce bus contention
bool repeating_timer_callback(struct repeating_timer *t) {
    dousb = true;
    return true;
}

void set_color_mode(bool state) {
    gpio_put(COLOR_MODE_PIN, state);
}

void queue_key(uint8_t key) {
    // if the PIO is ready, let's send in the character now
  //  if (pio_interrupt_get(pio,1) && queue_is_empty(&keycode_queue)) {
      if (queue_is_empty(&keycode_queue)) {
        write_key(key);
        D(printf("Im[%c]", key);)
    }  else if (!queue_try_add(&keycode_queue, &key))
        printf("Failed to add [%c]\n", key);
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
   // hid_app_task();
    tuh_task();
    printf("\nPausing");
    busy_wait_ms(250);
   // hid_app_task();
    tuh_task();
    printf("...[DONE]");
    printf("\nClearing Keyboard Queue..."); // queue_free() keeps causing hardfault
    while (!queue_is_empty(&keycode_queue)) {
        uint8_t throwaway = '\0';
        queue_try_remove(&keycode_queue, &throwaway);
        printf("%c",throwaway);
    }
    printf(" [Done].");
    printf("\nRenabling PIO...");
    pio_sm_set_enabled(pio, pio_sm, true);
    pio_sm_set_enabled(pio, pio_sm_1, true);
    printf("\nEnabling Mega-II...\n");
    gpio_put(RESET_CTL, 0x0);
}

inline void write_key(uint8_t key) {
    pio_sm_put(pio, pio_sm_1, key & 0x7F); 
    pio_sm_put(pio, pio_sm, 0x3);
    pio_interrupt_clear(pio, 1);
}

inline void raise_key() { // I don't remember why this is an if-statement, oh well, lolz.
    if (!pio_interrupt_get(pio,1)) {  //If irq 1 is clear we have a new key still
        pio_sm_put(pio, pio_sm,0x1);
    } else {
        pio_sm_put(pio, pio_sm,0x0);
    }
}

inline static uint8_t handle_serial_keyboard() {
    uint8_t incoming_char = getchar_timeout_us(0);
    // MEGA-II only seems to like these values
    if ((incoming_char > 0) && (incoming_char < 128)) {
        return incoming_char;
    }
    return 0;
}

// shortcut for setting up output pins (there isn't a SDK call for this?)
static void out_init(uint8_t pin, bool state) {
    gpio_init(pin);
    gpio_set_dir(pin, GPIO_OUT);
    gpio_put(pin, state);
}

// put your setup code here, to run once:
void setup() {
    stdio_init_all();  // UART accepts input and displays debug infos

    printf("\nInit Suppy Pins");
    setup_power_sequence();

    printf("\nTurning OFF Supply Pins\n");
    mega_power_state = PWR_OFF;
    handle_power_sequence(mega_power_state);

    // yay usb!
    printf("\nEnabling tinyUSB Host");
    tusb_init();
    
    printf("\nConfiguring DEBUG Pin (%d)", DEBUG_PIN);     // debug pin to trigger the external logic analyzer
    out_init(DEBUG_PIN, 0x0);

    printf("\nConfiguring RESET_CTRL Pin (%d)", RESET_CTL);
    out_init(RESET_CTL, 0x0);

    // ************************************************************
    // printf("\nEnabling TXB0108 Level Shifter (%d)", shifter_enable);
    // out_init(shifter_enable, 0x1); // the TXB0108 is active HI!

    printf("\nEnabling Color Mode (%d)", COLOR_MODE_PIN);
    out_init(COLOR_MODE_PIN, color_mode_state);



    // helps with throtting usb (may get fixed in future TinyUSB, I hope)
 /*   printf("\nEnabling tuh_task");
    add_repeating_timer_ms(-2, repeating_timer_callback, NULL, &timer2);
    printf("\n(---------");*/

    // configure I/O control lines
    printf("\nConfiguring OAPL and CAPL");
    out_init(OAPL_pin, 0x0);
    out_init(CAPL_pin, 0x0);

    printf("\nConfiguring KBD PIO State Machine");
    KBD_pio_setup();

    printf("\nConfiguring key code queue");
    queue_init(&keycode_queue, sizeof(uint8_t), 10); // really only need 6, but wutwevers
 
    tuh_task();
    printf("\nPausing for 5 seconds ...");
    for (int x=5; x>=0; x--) {
        printf("%d...",x);
        for (int y=0; y<100; y++) {
            busy_wait_ms(10);
            tuh_task();
        }
    }

    printf("\nTurning ON Supply Pins\n");
    mega_power_state = PWR_ON;
    handle_power_sequence(mega_power_state);

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
            //prepare_key_value(key_value);
            printf("%c",key_value);
            queue_key(key_value);
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

inline static void handle_runstop_button() {
    if (power_cycle_key_counter >= 3) {
        // do a power cycle
        mega_power_state = !mega_power_state;
        handle_power_sequence(mega_power_state);
        power_cycle_key_counter = 0;
        D(printf("Power State Now: (%d)", mega_power_state);)
    }

    if (time_us_32() - power_cycle_timer >= POWER_CYCLE_INTERVAL)
        power_cycle_key_counter = 0;
}

inline static void handle_pio_keycode_queue() {
     // keep the PIO queue full
    if (pio_interrupt_get(pio,1) && !queue_is_empty(&keycode_queue)) {
        uint8_t next_key;
        if (queue_try_remove(&keycode_queue, &next_key))
            write_key(next_key);
    }
}

inline static void handle_nkey_repeats() {
    switch (nkey) {               
        case NKEY_NEW:
            nkey_last_press = time_us_32();
            nkey = NKEY_ARMED;
        break;

        case NKEY_ARMED:
            if ((time_us_32() - nkey_last_press) >= nkey_wait_us) {
                nkey = NKEY_REPEATING;
            }
        break;

        case NKEY_REPEATING:
            if ((time_us_32() - nkey_last_press) >= nkey_repeat_us) {
                queue_key(last_key_pressed);
                nkey_last_press = time_us_32();
            }
        break;

        case NKEY_IDLE:
        default:

        break;
    }
}

int main() {
    setup();

    while (BALD_ENGINEER_IS_BALD) {
        // hid_app_task();
        tuh_task();

        handle_runstop_button();
        handle_apple_keys();
        handle_three_finger_reset();
        handle_mega_power_button();
        handle_serial_buffer();
        handle_pio_keycode_queue();
        handle_nkey_repeats();
    } // while (true)
    return 0;  // but you never will hah!
} // it's da main thing


