#ifndef iie_hid_app_h
#define iie_hid_app_h

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
extern bool OAPL_state;
extern bool CAPL_state;
extern bool do_a_reset;

extern bool shift_lock_state;
static bool last_shift_lock_state;

bool any_key=false;
extern bool OAPL_state;
extern bool CAPL_state;
extern bool do_a_reset;

static uint8_t const keycode2ascii[128][2] = {HID_KEYCODE_TO_ASCII};

// Each HID instance can has multiple reports
static struct{
    uint8_t report_count;
    tuh_hid_report_info_t report_info[MAX_REPORT];
} hid_info[CFG_TUH_HID];

static void process_kbd_report(hid_keyboard_report_t const* report);
static void process_generic_report(uint8_t dev_addr, uint8_t instance, uint8_t const* report, uint16_t len);


#endif