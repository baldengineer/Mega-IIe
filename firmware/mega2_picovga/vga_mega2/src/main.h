
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
#endif // _MAIN_H
