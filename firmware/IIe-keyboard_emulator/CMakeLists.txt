# Generated Cmake Pico project file

cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# initalize pico_sdk from installed location
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_PATH "C:/Users/balde/Documents/Pico/pico-sdk")

# Pull in Raspberry Pi Pico SDK (must be before project)
include(pico_sdk_import.cmake)

project(IIe-keyboard_emulator C CXX ASM)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

# Add executable. Default name is the project name, version 0.1

add_executable(IIe-keyboard_emulator 
        IIe-keyboard_emulator.c 
        src/iie_hid_app.c
        )

        
pico_set_program_name(IIe-keyboard_emulator "IIe-keyboard_emulator")
pico_set_program_version(IIe-keyboard_emulator "0.1")

pico_enable_stdio_uart(IIe-keyboard_emulator 1)
pico_enable_stdio_usb(IIe-keyboard_emulator 0)

# pico_generate_pio_header(IIe-keyboard_emulator src/KBD.pio)
pico_generate_pio_header(IIe-keyboard_emulator ${CMAKE_CURRENT_LIST_DIR}/src/KBD.pio)


target_include_directories(IIe-keyboard_emulator PRIVATE src)

# Add the standard library to the build
target_link_libraries(IIe-keyboard_emulator pico_stdlib)

# Add any user requested libraries
target_link_libraries(IIe-keyboard_emulator
        hardware_pio
        hardware_timer
        hardware_watchdog
        hardware_clocks
        tinyusb_board
        tinyusb_host
        )

pico_add_extra_outputs(IIe-keyboard_emulator)

