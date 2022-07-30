// Pin mapping for Mega IIe Rev 2, KBD2040 Rev 3
// Not confusing at all.

// DO NOT FORGET TO CHANGE PINOUTS IN THE PIO!

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
#define   DEBUG_PIN 24
#define   enable_245_pin 11
#define   OAPL_pin 20
#define   CAPL_pin 23

// Power Sequencing
#define   MEGA_POWER 29   // output! (was an input, that changed.) 
#define   ANALOG_POWER 28 // output 
// On Mega Rev3, only two pins were available for power sequence
//#define  Enable_p12V 27   // output
//#define  Enable_n12V 28   // output
//#define   Enable_p5V 29   // output
// PWR_SEQ_MASK was... (29,28,27)
// 0x3800 0000


// 0011 0000 0000 0000 
#define PWR_SEQ_MASK 0x30000000  // should match 29,28

#define      PRESSED 0x0
#define  NOT_PRESSED 0x1
#define      PWR_OFF 0x0
#define       PWR_ON 0x1
#define   PWR_TOGGLE 0x2

