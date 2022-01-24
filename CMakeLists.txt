cmake_minimum_required(VERSION 3.19)

# use cmake config  MinSizeRel (vs code: "cmake: select variant")

project(blink LANGUAGES C CXX ASM)

set(AVR_MCU attiny85) # not avr25
set(AVR_DEVICE_TYPE ATtiny85)
set(AVR_F_CPU 8000000)
set(MICRONUCLEUS "micronucleus")

include(cmake/lto.cmake)
include(cmake/avr_flags.cmake)
include(cmake/avr_hex.cmake)

add_executable(blink blink.c)
target_link_libraries(blink PUBLIC AvrFlags)
target_compile_options(blink PUBLIC
    "-Wall"
    "-Wextra"
    "-pedantic"
)
avr_hex(blink)

avr_micronucleus_upload(blink)
