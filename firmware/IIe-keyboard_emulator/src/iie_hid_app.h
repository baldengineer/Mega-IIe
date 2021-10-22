#ifndef __IIE_HID_APP_H__
#define __IIE_HID_APP_H__

#include <stdint.h>

extern uint8_t keys[101];
extern uint8_t modifiers;
extern bool kbd_connected;
extern uint8_t kbd_led_state[1];
extern bool any_key;
void imma_led(uint8_t state);
void hid_app_task(void);
uint8_t get_ascii(uint8_t keyboard_code, uint8_t mod_keys);

#endif
