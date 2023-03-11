
// ****************************************************************************
//
//                                 Main code
//
// ****************************************************************************

#ifndef _MAIN_H
#define _MAIN_H
// canvas format
#define FORMAT CANVAS_8		// 8-bit pixels

// screen resolution
#define DRV VideoVGA		// timings driver
#define WIDTH	584		// screen width
#define HEIGHT	192		// screen height
#define DBLY	true		// double lines
#define WIDTHBYTE WIDTH/2		// bytes per line
#define WIDTHWORDS WIDTHBYTE/4
#define LINE_COUNT 192

// KBD2040 Interface
#define KBD_UART uart1
#define KBD_BAUD 115200
#define KBD_TX 4
#define KBD_RX 5

// Rev 2
//#define FIRST_RGBx 14
//#define FIRST_INPUT 12
//#define INPUT_COUNT 8
// Rev 3
#define FIRST_RGBx 8
#define FIRST_INPUT 6
#define INPUT_COUNT 8

// Rev 2
//#define WINDOW 19
// Rev 3
#define WINDOW 13

// Rev 2
//const uint BLINKY_PIN=3  ; // 3 on VGA2040
// Rev 3

// Other Pins
#define VSYNC 20
#define BLINKY_PIN 0

// Other Globals
#define LED_OFF 0
#define LED_ON  1
#define LED_TOG 2

bool led_pin_state = LED_ON;

// Palette (Rev3)
u8 palwedongongoofedthebits[16] = {
    0,
    54,
    136,
    188,
    86,
    73,
    220,
    126,
    163,
    183,
    73,
    91,
    215,
    79,
    235,
    255
};

// buffer
extern unsigned char rawData[56064];
ALIGNED u8 Box[(WIDTHBYTE)*HEIGHT];
u16 trans[256];

PIO pio;
uint pio_offset;
uint magic_pio_offset;
uint pio_sm;
uint magic_pio_sm;
uint rgb_dma_chan;


#endif // _MAIN_H



//Old bit patterns
// u8 palwedongongoofedthebits[16] = {
// 0,  //black   0000
// 193, //red    0001
// 4,  // blue   0010
// 206, // pink  0011
// 25, //green   0100
// 82, //grey    0101
// 15, //blue    0110
// 111,//lblue   0111
// 144, //brown  1000
// 216, //organe 1001
// 173, //lgray  1010
// 228, //lpink   1011
// 48, //lgreen  1100
// 248, //yellow 1101
// 124, //teal   1110
// 255 //white   1111
// };
// u8 palwedongongoofedthebits[16] = {
// 0,  //black   0000
// 144, //brown  1000
// 25, //green   0100
// 48, //lgreen  1100
// 4,  // blue   0010
// 173, //lgray  1010
// 15, //blue    0110
// 124, //teal   1110
// 193, //red    0001
// 216, //organe 1001
// 82, //grey    0101
// 228, //lpink  1011
// 206, // pink  0011
// 248, //yellow 1101
// 111,//lblue   0111
// 255 //white   1111
// };

// u8 palwedongongoofedthebits[16] = {
// 0,    // black
// 1,   // red
// 80,  // dark blue
// 109, // purple 
// 196,  // dark green
// 227,  // grey
// 240, // mid blue
// 201, // light blue
// 52,  // dark brown
// 39, // light brown
// 24, // bright grey
// 185, // salmon
// 146,  // lime green
// 175, // yellow
// 248, // light green
// 255 // white
// };

//rev 3
// u8 palwedongongoofedthebits[16] = {
// 0,
// 163, // brown
// 86, // dark green 
// 215, // green
// 136, // drk purple (drk blue)
// 73, // light purple
// 220, // cyan
// 235, // light blue
// 54, // red
// 183, // orange
// 73,
// 79,
// 188,
// 91,
// 126,
// 255
// };

