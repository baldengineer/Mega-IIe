#ifndef IIe_keyboard_emulator_h
#define IIe_keyboard_emulator_h

#include <stdio.h>

// These aren't all used yet, but they will be
#include "KBD.pio.h"

#include "pico/stdlib.h"
#include "hardware/clocks.h"
#include "hardware/pio.h"
#include "hardware/timer.h"
#include "hardware/watchdog.h"
#include "pico/util/queue.h"

#include "src/constants.h"
#include "src/enums.h"

//#define DEBUG_MAIN

bool mega_power_state = 0x0;
uint8_t serial_anykey_clear_interval = 100;
extern uint8_t last_key_pressed;
extern enum nkey_states nkey;
extern uint32_t nkey_last_press;
uint32_t   nkey_wait_us = 750e3;   //5M us =   5sec
uint32_t nkey_repeat_us = 50e3; //500K us = 500 ms

uint8_t keys[101] = {0};
uint8_t modifiers = 0;

// Useful flags for useful things
volatile bool kbd_connected = false;
volatile bool dousb = false;
uint8_t kbd_led_state[1] = {0x0};
bool print_usb_report = false;
struct repeating_timer timer1;
struct repeating_timer timer2;
bool state_245 = DISABLED;

bool OAPL_state=false;
bool CAPL_state=false;
bool do_a_reset=false;
const uint8_t OAPL_pin = 20;
const uint8_t CAPL_pin = 23;
bool shift_lock_state=false;

const uint DEBUG_PIN = 24;
const uint8_t enable_245_pin = 11;
const uint8_t shifter_enable = 25;

// PIO Globals
PIO pio;
uint pio_offset;
uint pio_sm;
uint pio_sm_1;

// prototypes
void raise_key();
void write_key(uint8_t key);
void queue_key(uint8_t key);
void reset_mega(uint8_t reset_type);

uint32_t power_cycle_timer;
uint8_t power_cycle_key_counter;
#define POWER_CYCLE_INTERVAL 500000 

void set_color_mode(bool state);
bool color_mode_state = true;

// From the outside scary world
extern void imma_led(uint8_t state);
extern void hid_app_task(void);
extern bool tusb_init();
extern bool tuh_task();
extern bool any_key;
extern bool tuh_hid_set_report(uint8_t dev_addr, uint8_t instance, uint8_t report_id, uint8_t report_type, void *report, uint16_t len);
extern void KBD_pio_setup();
extern uint8_t get_ascii(uint8_t keyboard_code, uint8_t mod_keys); 

extern void toggle_pwr_pins();
extern void handle_mega_power_button();
extern void handle_power_sequence(uint8_t state);
extern void setup_power_sequence();

#ifdef DEBUG_MAIN
#  define D(x) x
#else
#  define D(x) 
#endif

#endif