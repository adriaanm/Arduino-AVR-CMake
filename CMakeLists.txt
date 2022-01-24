cmake_minimum_required(VERSION 3.19)

project(blink LANGUAGES C CXX ASM)

set(AVR_MCU attiny85)
set(AVR_F_CPU 8000000)
set(AVR_DEVICE_TYPE ATtiny85)
set(ARDUINO_VARIANT tiny)

# use cmake config  MinSizeRel (vs code: "cmake: select variant")

include(cmake/lto.cmake)
include(cmake/avr_flags.cmake)
include(cmake/arduino_core.cmake)
include(cmake/avr_hex.cmake)
# include(cmake/arduino_upload.cmake)
# uploading with micronucleus directly

add_executable(blink blink.cpp)
target_link_libraries(blink PUBLIC ArduinoCore)
target_compile_options(blink PUBLIC
    "-Wall"
    "-Wextra"
    "-pedantic"
)
avr_hex(blink)

# set(ARDUINO_PORT "/dev/ttyACM0"
#     CACHE STRING "The serial port for uploading using avrdude")
# arduino_avr_upload(blink ${ARDUINO_PORT})
