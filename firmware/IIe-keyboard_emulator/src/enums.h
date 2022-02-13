#ifndef enums_h
#define enums_h

// state machine for the keyboard
enum nkey_states {
    NKEY_IDLE, // NO keys pressed
    NKEY_NEW, // new key!
    NKEY_ARMED,     // Waiting for another key (or release)
    NKEY_REPEATING, // Just doing the same ol' thing.
};

#endif