#ifndef constants_H
#define constants_H

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
#define BALD_ENGINEER_IS_BALD true

// Constantly constant
static const uint16_t led_interval = 500;
static const uint16_t key_delay = 100;
static const uint16_t delay_time = 1000;

// Pins
// Corrected data bus on rev2
#define KSEL0  25
#define   MD0  3
#define   MD1  4
#define   MD2  5
#define   MD3  6
#define   MD4  7
#define   MD5  8
#define   MD6  9
#define   MD7 10
// EN_245 11
// RESET 12
#define KSEL1 13
#define KSEL2 14
#define    RW 15
#define   PH0 16
#define RESET_CTL 18
#define COLOR_MODE_PIN 22

// Free pins
// 17, 19, 21

// IO Pins
//const uint LED_PIN = PICO_DEFAULT_LED_PIN;  // its the LED pin (that we don't have)
extern const uint DEBUG_PIN; // 24
extern const uint8_t enable_245_pin; // 11
extern const uint8_t shifter_enable; // 25
extern const uint8_t OAPL_pin; // 20
extern const uint8_t CAPL_pin; // 23

// Power Sequencing
#define   MEGA_POWER 26   // input!
#define  Enable_p12V 27   // output
#define  Enable_n12V 28   // output
#define   Enable_p5V 29   // output
#define PWR_SEQ_MASK 0x38000000  // should match 29,28,27
#define      PRESSED 0x0
#define  NOT_PRESSED 0x1
#define      PWR_OFF 0x0
#define       PWR_ON 0x1
#define   PWR_TOGGLE 0x2

// Apple Keys and RESET
#define THREE_FINGER_WAIT 500  //milliseconds

extern bool OAPL_state;
extern bool CAPL_state;
extern bool do_a_reset;
extern bool shift_lock_state;

#endif