#ifndef constants_H
#define constants_H

#include <stdio.h>
#include "pico/stdlib.h"
#include "mcp4541.h"

// To make switching between proto and final easier
#define Mega_IIe_Rev2 0
#define Mega_IIe_Rev3 1


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
#define WIPER_CHECK_INTERVAL 1e6

// Apple Keys and RESET
#define THREE_FINGER_WAIT 500  //milliseconds
extern bool OAPL_state;
extern bool CAPL_state;
extern bool do_a_reset;
extern bool shift_lock_state;

// Special Key Mapping
#define CTRL_KEY 57
#define  F1  58
#define  F2  59
#define  F3  60
#define  F4  61
#define  F5  62
#define  F6  63
#define  F7  64
#define  F8  65
#define  F9  66
#define F10  67
#define F11  68
#define F12  69
#define VOL_DOWN 70
#define VOL_MUTE 71
#define VOL_UP 72

#endif