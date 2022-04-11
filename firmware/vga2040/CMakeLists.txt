# Generated Cmake Pico project file

cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialise pico_sdk from installed location
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_PATH "C:/Users/balde/Dropbox/Pico/pico-sdk")

# Pull in Raspberry Pi Pico SDK (must be before project)
include(pico_sdk_import.cmake)

project(vga2040 C CXX ASM)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

# Add executable. Default name is the project name, version 0.1

add_executable(vga2040 vga2040.c )

pico_set_program_name(vga2040 "vga2040")
pico_set_program_version(vga2040 "0.1")

pico_enable_stdio_uart(vga2040 1)
pico_enable_stdio_usb(vga2040 1)

# Add the standard library to the build
target_link_libraries(vga2040 pico_stdlib)

# Add any user requested libraries
target_link_libraries(vga2040
        hardware_spi
        hardware_i2c
        hardware_dma
        hardware_pio
        hardware_interp
        hardware_timer
        hardware_watchdog
        hardware_clocks
        )

pico_add_extra_outputs(vga2040)

