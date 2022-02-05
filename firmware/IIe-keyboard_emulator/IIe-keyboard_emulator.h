#ifndef IIe_keyboard_emulator_h

#include <stdio.h>

// These aren't all used yet, but they will be
#include "KBD.pio.h"
#include "hardware/clocks.h"
#include "hardware/pio.h"
#include "hardware/timer.h"
#include "hardware/watchdog.h"
#include "pico/stdlib.h"
#include "src/constants.h"

uint8_t mega_power_state = 0x0;
uint8_t serial_anykey_clear_interval = 100;
extern uint8_t last_key_pressed;
extern uint8_t nkey;

uint8_t keys[101] = {0};
uint8_t modifiers = 0;

// Useful flags for useful things
volatile bool kbd_connected = false;
volatile bool dousb = false;
volatile uint8_t kbd_led_state[1] = {0x0};
bool print_usb_report = false;
struct repeating_timer timer1;
struct repeating_timer timer2;
bool state_245 = DISABLED;

// PIO Globals
PIO pio;
uint pio_offset;
uint pio_sm;
uint pio_sm_1;

// prototypes
void raise_key();
void write_key(uint8_t key);
void reset_mega(uint8_t reset_type);

// From the outside scary world
extern void imma_led(uint8_t state);
extern void hid_app_task(void);
extern bool tusb_init();
extern bool tuh_task();
extern bool any_key;
extern bool tuh_hid_set_report(uint8_t dev_addr, uint8_t instance, uint8_t report_id, uint8_t report_type, void *report, uint16_t len);
static inline void KBD_pio_setup();
extern uint8_t get_ascii(uint8_t keyboard_code, uint8_t mod_keys);

extern void toggle_pwr_pins();
extern void handle_mega_power_button();
extern void handle_power_sequence(uint8_t state);
extern void setup_power_sequence();
extern void KBD_pio_setup(PIO *pio, uint *pio_offset, uint *pio_sm, uint *pio_sm_1);
#endif