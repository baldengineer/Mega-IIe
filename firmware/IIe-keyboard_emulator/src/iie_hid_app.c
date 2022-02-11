/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2021, Ha Thach (tinyusb.org)
 * Copyright (c) 2021 James Lewis
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#include "bsp/board.h"
#include "tusb.h"
#include "keyboard_mapping.h"
//#include "hid_host.h"

//--------------------------------------------------------------------+
// MACRO TYPEDEF CONSTANT ENUM DECLARATION
//--------------------------------------------------------------------+

// If your host terminal support ansi escape code such as TeraTerm
// it can be use to simulate mouse cursor movement within terminal
#define USE_ANSI_ESCAPE 0

#define MAX_REPORT 4

uint8_t last_key_pressed=0;
uint8_t nkey = 0;
extern uint8_t keys[101];
extern uint8_t modifiers;
extern bool print_usb_report;
extern uint32_t millis();
extern volatile bool kbd_connected;
extern void wtf_bbq_led(uint8_t state);
extern volatile uint8_t kbd_led_state[1];
extern void write_key(uint8_t key);
extern void raise_key();
uint8_t get_ascii(uint8_t keyboard_code, uint8_t mod_keys);

bool any_key=false;
extern bool OAPL_state;
extern bool CAPL_state;
extern bool do_a_reset;

static uint8_t const keycode2ascii[128][2] = {HID_KEYCODE_TO_ASCII};

// Each HID instance can has multiple reports
static struct
{
    uint8_t report_count;
    tuh_hid_report_info_t report_info[MAX_REPORT];
} hid_info[CFG_TUH_HID];

static void process_kbd_report(hid_keyboard_report_t const* report);
static void process_generic_report(uint8_t dev_addr, uint8_t instance, uint8_t const* report, uint16_t len);

void hid_app_task(void) {
    // nothing to do
}

//--------------------------------------------------------------------+
// TinyUSB Callbacks
//--------------------------------------------------------------------+

// Invoked when device with hid interface is mounted
// Report descriptor is also available for use. tuh_hid_parse_report_descriptor()
// can be used to parse common/simple enough descriptor.
// Note: if report descriptor length > CFG_TUH_ENUMERATION_BUFSIZE, it will be skipped
// therefore report_desc = NULL, desc_len = 0


void tuh_hid_mount_cb(uint8_t dev_addr, uint8_t instance, uint8_t const* desc_report, uint16_t desc_len) {
    printf("HID device address = %d, instance = %d is mounted\r\n", dev_addr, instance);

    // Interface protocol (hid_interface_protocol_enum_t)
    const char* protocol_str[] = {"None", "Keyboard", "Mouse"};
    uint8_t const itf_protocol = tuh_hid_interface_protocol(dev_addr, instance);

    printf("HID Interface Protocol = %s\r\n", protocol_str[itf_protocol]);

    // By default host stack will use activate boot protocol on supported interface.
    // Therefore for this simple example, we only need to parse generic report descriptor (with built-in parser)
    if (itf_protocol == HID_ITF_PROTOCOL_NONE) {
        hid_info[instance].report_count = tuh_hid_parse_report_descriptor(hid_info[instance].report_info, MAX_REPORT, desc_report, desc_len);
        printf("HID has %u reports \r\n", hid_info[instance].report_count);
    }

    // request to receive report
    // tuh_hid_report_received_cb() will be invoked when report is available
    if (!tuh_hid_receive_report(dev_addr, instance)) {
        printf("Error: cannot request to receive report\r\n");
    }
    if (dev_addr == 0x1 && instance == 0x1){
        // wtf_bbq_led(0x2);
        kbd_connected = true;
    }
}

// Invoked when device with hid interface is un-mounted
void tuh_hid_umount_cb(uint8_t dev_addr, uint8_t instance) {
    printf("HID device address = %d, instance = %d is unmounted\r\n", dev_addr, instance);
}

// Invoked when received report from device via interrupt endpoint
void tuh_hid_report_received_cb(uint8_t dev_addr, uint8_t instance, uint8_t const* report, uint16_t len) {
    uint8_t const itf_protocol = tuh_hid_interface_protocol(dev_addr, instance);

    switch (itf_protocol) {
        case HID_ITF_PROTOCOL_KEYBOARD:
            TU_LOG2("HID receive boot keyboard report\r\n");
            process_kbd_report((hid_keyboard_report_t const*)report);
            break;

        default:
            // Generic report requires matching ReportID and contents with previous parsed report info
            process_generic_report(dev_addr, instance, report, len);
            break;
    }

    // continue to request to receive report
    if (!tuh_hid_receive_report(dev_addr, instance)) {
        printf("Error: cannot request to receive report\r\n");
    }
}

//--------------------------------------------------------------------+
// Keyboard
//--------------------------------------------------------------------+

// look up new key in previous keys
static inline bool find_key_in_report(hid_keyboard_report_t const* report, uint8_t keycode) {
    for (uint8_t i = 0; i < 6; i++) {
        if (report->keycode[i] == keycode) return true;
    }

    return false;
}

void print_report_why_not(hid_keyboard_report_t const* report) {
    // printf("Report: ");
    // for (uint8_t i = 0; i < 6; i++) {
    //     printf("%d,", report->keycode[i]);
    // }
    // printf("\n");
}

/*
SETUP = 0x21
Request Code SetReport = 0x09
Report Id = 0x00
reprot type = 0x02 (these two might be backward, verify)

Value field of Setup Packet contains the report ID in the low byte, which is Zero
High byte contains the report type, which would be 0x02 for output report
    output report = software to the hardware
Index Field = Inteface number of USB Keyboard
Data stage = 1 byte

 explains keyboard packets (verbosely): https://wiki.osdev.org/USB_Human_Interface_Devices
  explains setup packet: https://www.beyondlogic.org/usbnutshell/usb6.shtml
*/

void imma_led(uint8_t state) {
    static uint32_t call_counter = 0;
    uint8_t dev_addr    = 0x01;
    uint8_t instance    = 0x00;
    uint8_t report_id   = 0x00;
    uint8_t report_type = 0x02;

    printf("%d: imma led: %d\n", call_counter++,kbd_led_state[0]);
    if (state == 0x2)
        kbd_led_state[0] = kbd_led_state[0] | 0x02;
    if (state == 0x0)
        kbd_led_state[0] = kbd_led_state[0] & 0xFD;

    tuh_hid_set_report(dev_addr, instance, report_id, report_type, kbd_led_state, 1);
}

void check_for_released_key(hid_keyboard_report_t const* prev_report, hid_keyboard_report_t const* report) {
    for (uint8_t prev = 0; prev < 6; prev++) {
        bool found_in_report = false;
        for (uint8_t curr = 0; curr < 6; curr++) {
            if (prev_report->keycode[prev] == report->keycode[curr])
                found_in_report = true;
        }
        if (!found_in_report) {
            printf("Raising '%c'(%d)\n", get_ascii(prev_report->keycode[prev],0), get_ascii(prev_report->keycode[prev],0));
            raise_key(get_ascii(prev_report->keycode[prev],0));
            keys[(prev_report->keycode[prev])] = 0;
        }

    }
}

uint8_t get_ascii(uint8_t keyboard_code, uint8_t mod_keys) {
    bool const is_shift = mod_keys & (KEYBOARD_MODIFIER_LEFTSHIFT | KEYBOARD_MODIFIER_RIGHTSHIFT);
    bool const is_ctrl = mod_keys & (KEYBOARD_MODIFIER_LEFTCTRL | KEYBOARD_MODIFIER_RIGHTCTRL);
    //uint8_t ch = keycode2ascii[keyboard_code][is_shift ? 1 : 0];

    //maps: normal_kbd_map ctrl_kbd_map shift_kbd_map both_kbd_map
    uint8_t ch = 0x0;
    if (is_shift && is_ctrl)
        ch = both_kbd_map[keyboard_code];
    else if (is_shift)
        ch = shift_kbd_map[keyboard_code];
    else if (is_ctrl) 
        ch = ctrl_kbd_map[keyboard_code];
    else
        ch = normal_kbd_map[keyboard_code];

    return ch;
}

static void process_kbd_report(hid_keyboard_report_t const* report) {
    static hid_keyboard_report_t prev_report = {0, 0, {0}};  // previous report to check key released

   // any_key = true; // should we do this?

    // if (print_usb_report)
    //     print_report_why_not(report);

    // see what keys were released
  //  check_for_released_key(&prev_report, report);

  // 0,0,0,0,0
  // 1,0,0,0,0 output: 1
  // 1,2,0,0,0 output: 2
  // 1,2,3,0,0 output: 3
  // 1,2,0,0,0 output: 3
  // 1,2,4     output: 4
  // 1,2,4     output: 4
  // 0,0,0,0,0
  // 0,0,0,0,0
  

    modifiers = report->modifier;
    printf("report: ");
   // last_key_pressed = 0;
    uint8_t pressed_count = 0;
    for (uint8_t i = 0; i < 6; i++) {
        printf("%d,", report->keycode[i]);
        if (report->keycode[i]) {
            pressed_count++;
            keys[report->keycode[i]] = 1;
            if (pressed_count > nkey) {
                nkey = pressed_count;
                last_key_pressed = get_ascii(report->keycode[i],modifiers);
            }
        }
    }
    printf("; modifiers=%d",report->modifier);

    printf("\n");
    if (pressed_count == 0) {
        raise_key();
        nkey = 0;
    } 

    OAPL_state = false;
    CAPL_state = false;
    if (report->modifier > 0) {
        if ((report->modifier & 0x08)) {
            OAPL_state = true;
           // printf("OA\n");
        }
            
        if ((report->modifier & 0x80)) {
            CAPL_state = true;
            //printf("CA\n");
        }

        if ((report->modifier == 5)) {
            for (uint8_t i = 0; i < 6; i++) {
                if (report->keycode[i]==76) {
                    do_a_reset = true;
                    printf("\n\nImma CTL-ALT-DEL!\n\n");
                }
            }
        }
    }
    // else {
    //     write_key(last_key_pressed);
    // }


    prev_report = *report;
}

//--------------------------------------------------------------------+
// Generic Report
//--------------------------------------------------------------------+
static void process_generic_report(uint8_t dev_addr, uint8_t instance, uint8_t const* report, uint16_t len) {
    (void)dev_addr;

    uint8_t const rpt_count = hid_info[instance].report_count;
    tuh_hid_report_info_t* rpt_info_arr = hid_info[instance].report_info;
    tuh_hid_report_info_t* rpt_info = NULL;

    if (rpt_count == 1 && rpt_info_arr[0].report_id == 0) {
        // Simple report without report ID as 1st byte
        rpt_info = &rpt_info_arr[0];
    } else {
        // Composite report, 1st byte is report ID, data starts from 2nd byte
        uint8_t const rpt_id = report[0];

        // Find report id in the arrray
        for (uint8_t i = 0; i < rpt_count; i++) {
            if (rpt_id == rpt_info_arr[i].report_id) {
                rpt_info = &rpt_info_arr[i];
                break;
            }
        }

        report++;
        len--;
    }

    if (!rpt_info) {
        printf("Couldn't find the report info for this report !\r\n");
        return;
    }

    // For complete list of Usage Page & Usage checkout src/class/hid/hid.h. For examples:
    // - Keyboard                     : Desktop, Keyboard
    // - Mouse                        : Desktop, Mouse
    // - Gamepad                      : Desktop, Gamepad
    // - Consumer Control (Media Key) : Consumer, Consumer Control
    // - System Control (Power key)   : Desktop, System Control
    // - Generic (vendor)             : 0xFFxx, xx
    if (rpt_info->usage_page == HID_USAGE_PAGE_DESKTOP) {
        switch (rpt_info->usage) {
            case HID_USAGE_DESKTOP_KEYBOARD:
                TU_LOG1("HID receive keyboard report\r\n");
                // Assume keyboard follow boot report layout
                process_kbd_report((hid_keyboard_report_t const*)report);
                break;

            default:
                break;
        }
    }
}
