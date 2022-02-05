#ifndef constants_H

#include <stdio.h>
#include "pico/stdlib.h"

// So much easier to read
#define ON 0x1
#define OFF 0x0

// valid for active LOW signals
#define ENABLED 0x0
#define DISABLED 0x1

// used for something?
#define OUT true
#define IN false

// Constantly constant
static const uint16_t led_interval = 500;
static const uint16_t key_delay = 100;
static const uint16_t delay_time = 1000;

// Pins
// Corrected data bus on rev2
#define KSEL0  2
#define   MD0  3
#define   MD1  4
#define   MD2  5
#define   MD3  6
#define   MD4  7
#define   MD5  8
#define   MD6  9
#define   MD7 10
#define KSEL1 13
#define KSEL2 14
#define    RW 15
#define   PH0 16
#define RESET_CTL 18

// IO Pins
//const uint LED_PIN = PICO_DEFAULT_LED_PIN;  // its the LED pin (that we don't have)
static const uint DEBUG_PIN = 24;
static const uint8_t enable_245_pin = 11;
static const uint8_t shifter_enable = 25;

// Power Sequencing
#define   MEGA_POWER 26   // input!
#define  Enable_p12V 27   // output
#define  Enable_n12V 28   // output
#define   Enable_p5V 29   // output
#define PWR_SEQ_MASK 0x38000000  
#define      PRESSED 0x0
#define  NOT_PRESSED 0x1

#endif