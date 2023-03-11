#ifndef enums_h
#define enums_h

// state machine for the keyboard
enum nkey_states {
    NKEY_IDLE, // NO keys pressed
    NKEY_NEW, // new key!
    NKEY_ARMED,     // Waiting for another key (or release)
    NKEY_REPEATING, // Just doing the same ol' thing.
};

struct Macro_list {
    bool Print;
    bool Input;
    bool Poke;
    bool Peek;
    bool Call;
    bool PR;
    bool Text;
    bool Home;
    bool n151;
    bool x3F4;
    bool p1012;
    bool shift;
};

#endif