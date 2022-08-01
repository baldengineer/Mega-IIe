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


//#include "hid_host.h"

//#define DEBUG_IIE_HID

#include "bsp/board.h"
#include "tusb.h"
#include <iie_hid_app.h>
#include <keyboard_mapping.h>
#include "constants.h"

#define MAX_REPORT 4

extern int audio_volume;

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
        printf("\nForcing Caps Lock to High\n");
        shift_lock_state = true;
        imma_led(0x2); // because we don't have a funciton to do it
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
/*
  explains keyboard packets (verbosely): https://wiki.osdev.org/USB_Human_Interface_Devices
  explains setup packet: https://www.beyondlogic.org/usbnutshell/usb6.shtml
*/
void imma_led(uint8_t state) {
    static uint32_t call_counter = 0;
    uint8_t dev_addr    = 0x01;
    uint8_t instance    = 0x00;
    uint8_t report_id   = 0x00;
    uint8_t report_type = 0x02;

    D(printf("%d: imma led: %d\n", call_counter++,kbd_led_state[0]);)
    if (state == 0x2)
        kbd_led_state[0] = kbd_led_state[0] | 0x02;
    if (state == 0x0)
        kbd_led_state[0] = kbd_led_state[0] & 0xFD;

    tuh_hid_set_report(dev_addr, instance, report_id, report_type, kbd_led_state, 1);
}

inline static uint8_t get_ascii(uint8_t keyboard_code, uint8_t mod_keys) {
    bool is_shift = mod_keys & (KEYBOARD_MODIFIER_LEFTSHIFT | KEYBOARD_MODIFIER_RIGHTSHIFT);
    bool const is_ctrl = mod_keys & (KEYBOARD_MODIFIER_LEFTCTRL | KEYBOARD_MODIFIER_RIGHTCTRL);

    // this mirrors how IIe works (but not IIgs, I think)
    if (shift_lock_state && (keyboard_code >= 4) && (keyboard_code <= 29))  //a=4, z=29
        is_shift = true;

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

static void handle_special_sequences(hid_keyboard_report_t const* report, uint8_t modifiers) {
        // looking for special key sequences

    if (modifiers > 0) {
        // left-windows key (open-apple)
        if ((modifiers & 0x08))
            OAPL_state = true;

        // right-windows key (closed-apple)
        if ((modifiers & 0x80))
            CAPL_state = true;

        // ctrl-alt-delete (same as IIe ctrl-reset)
        if ((modifiers == 5))
            for (uint8_t i = 0; i < 6; i++) {
                if (report->keycode[i]==76)
                    do_a_reset = true;
            }
    }
}

static void find_new_keys(hid_keyboard_report_t const* report,hid_keyboard_report_t const* prev_report, uint8_t report_count, uint8_t modifiers ) {
    D(printf("Getting new keys...\n");)
    for (int i=0; i < report_count; i++) {
        uint8_t curr_keycode = report->keycode[i];
        uint8_t prev_keycode = prev_report->keycode[i];
        char curr_char = get_ascii(curr_char, modifiers);

        if (curr_keycode != prev_keycode) {
            D(printf("Queuing: [%d] %c\n", curr_keycode, curr_char);)
            queue_key(get_ascii(curr_keycode, modifiers));
            last_key_pressed = get_ascii(curr_keycode, modifiers); // last one in report is the "last" key pressed
        } else {
            D(printf("Repeated: %d\n", curr_keycode, curr_char);)
        }
    }
}

static void process_kbd_report(hid_keyboard_report_t const* report) {
    static hid_keyboard_report_t prev_report = {0, 0, {0}};  // previous report to check key released
    static uint8_t prev_report_count = 0;
    static uint8_t prev_modifiers = 0;
  
    modifiers = report->modifier;

    OAPL_state = false;
    CAPL_state = false;
    if (modifiers > 0) {
        handle_special_sequences(report, modifiers);
    }

    // count the current reports
    bool special_function = false;
    uint8_t report_count = 0;
    for (uint8_t i = 0; i < 6; i++) {
        if (report->keycode[i] > 0) {
            if ((report->keycode[i] >= 57) && (report->keycode[i] <= 72))
                special_function = true;
            report_count++;
        }
    }

    if ((report_count > 0)) {
        // print the report
        D(printf("Report: (%lu) ", (unsigned long)time_us_32());)
        for (uint8_t i = 0; i < 6; i++) {
                D(printf("%d [%c],", report->keycode[i], get_ascii(report->keycode[i], modifiers));)
        }
        D(printf("\n");)
    }

    // Condition #0: does this current report contain caps, Fx, restore, 40/80 or Run/stop?
    if (special_function) {
        for (uint8_t i = 0; i < report_count; i++) {
            switch (report->keycode[i]) {

                case 57: // caps lock
                    D(printf("Caps Lock\n");)
                    shift_lock_state = !shift_lock_state;
                    if (shift_lock_state)
                        imma_led(0x2);
                    else
                        imma_led(0x0);
                    D(printf("Shift Lock: %d\n", shift_lock_state);)
                break;

                case 70: // now volume down, was restore
                    #ifdef Mega_IIe_Rev2
                        D(printf("Restore\n");)
                    #elif Mega_IIe_Rev3      
                        audio_volume++;
                        if (audio_volume > MCP4541_MAX_STEPS)
                            audio_volume = MCP4541_MAX_STEPS;
                        printf("Volume Down...[%d]", audio_volume);
                    #endif
                break;

                case 71: // now volume up, was 40/80
                    #ifdef Mega_IIe_Rev2
                        D(printf("40/80\n");)
                        color_mode_state = !color_mode_state;
                        D(printf("Color Mode State: %d\n", color_mode_state);)
                        set_color_mode(color_mode_state);
                    #elif Mega_IIe_Rev3
                        audio_volume--;
                        if (audio_volume <= MCP4541_MIN_STEPS)
                            audio_volume = MCP4541_MIN_STEPS;
                        printf("Volume Up...[%d]", audio_volume);
                    #endif
                break;

                case 72: // Run/Stop
                    D(printf("Run/Stop\n");)
                    power_cycle_timer = time_us_32();
                    power_cycle_key_counter++;
                    D(printf("PWR Cycle Count: (%d)\n", power_cycle_key_counter);)
                break;
            }
        }
    }

    // Condition #1: was previous report AND this report empty? ignore it
    if ((prev_report_count==0) && (report_count==0)) {
        D(printf("Ignorning report\n\n\n");)
        nkey = NKEY_IDLE;
        prev_report_count = report_count;
        prev_report = *report;       
        return;
    }

    //  Condition #2: did previous report have keys but this one is empty? then release everything
    if ((prev_report_count>0) && (report_count==0)) {
        D(printf("All Keys Released\n\n");)
        raise_key();
        nkey = NKEY_IDLE;
        prev_report_count = report_count;
        prev_report = *report;         
    }

    // Condition #3: was previous report empty? AND this report is not if so, queue up each key (new event)
    if ((prev_report_count==0) && (report_count>0)) {
        nkey = NKEY_NEW;
        for (uint8_t i = 0; i <= report_count; i++) {
            if (report->keycode[i] > 0) {
                uint8_t ascii = get_ascii(report->keycode[i], modifiers);
                queue_key(ascii);
                last_key_pressed = ascii; // last one in report is the "last" key pressed
                D(printf("W[%d]\n",ascii));
            }
        }
    }

    // Condition #4: did previous report and this report have keys?
    if ((prev_report_count > 0) && (report_count>0)) {
        // a new key was added to the queue
        nkey = NKEY_NEW;
        D(printf("BTB Reports with Keys\n");)
        if ((report_count >= prev_report_count)) {
            // queue the new keys
            find_new_keys(report, &prev_report, report_count, modifiers);
        }
    }
    prev_report_count = report_count;
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
