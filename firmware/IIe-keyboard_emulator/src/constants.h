#ifndef constants_H
#define constants_H

#include <stdio.h>
#include "pico/stdlib.h"

// To make switching between proto and final easier
#define Mega_IIe_Rev2 1
#define Mega_IIe_Rev3 0


// Pin Mapping
#if Mega_IIe_Rev2
    #include "pins_rev2.h"
#elif Mega_IIe_Rev3
    #include "pins_rev3.h"
#endif

// So much easier to read
#define ON 0x1
#define OFF 0x0

// valid for active LOW signals
#define ENABLED 0x0
#define DISABLED 0x1

// used for something?
#define OUT true
#define IN false
#define BALD_ENGINEER_IS_BALD true

// Constantly constant
static const uint16_t led_interval = 500;
static const uint16_t key_delay = 100;
static const uint16_t delay_time = 1000;

// Apple Keys and RESET
#define THREE_FINGER_WAIT 500  //milliseconds
extern bool OAPL_state;
extern bool CAPL_state;
extern bool do_a_reset;
extern bool shift_lock_state;

#endif