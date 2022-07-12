// Pin mapping for Mega IIe Rev 3b PCB

// DO NOT FORGET TO CHANGE PINOUTS IN THE PIO!

// Pins
#define   MD0  3
#define   MD1  4
#define   MD2  5
#define   MD3  6
#define   MD4  7
#define   MD5  8
#define   MD6  9
#define   MD7 10
#define KSEL0 17 
#define KSEL1 13
#define KSEL2 14
#define    RW 15
#define   PH0 16
#define RESET_STATUS 11

// IO Pins
//#define   DEBUG_PIN 24
#define   KBD_LED_PIN 25
#define   enable_245_pin 15
#define   OAPL_pin 19
#define   CAPL_pin 18
#define VID_ENABLE 20
#define RESET_CTL 2
#define KBD_TX_SDA 0
#define KBD_RX_SCL 1

// Audio
#define HP_SENSE 21
#define AUD_SDA 26
#define AUD_SCL 27

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

