# Basic compilation flags
add_library(AvrFlags INTERFACE)
target_compile_options(AvrFlags INTERFACE
    "-fno-exceptions"
    "-ffunction-sections"
    "-fdata-sections"
    "$<$<COMPILE_LANGUAGE:CXX>:-fno-threadsafe-statics>"
    "-mmcu=${AVR_MCU}"
)

target_compile_definitions(AvrFlags INTERFACE
    "F_CPU=${AVR_F_CPU}"
    "__AVR_${AVR_DEVICE_TYPE}__"
)

target_link_options(AvrFlags INTERFACE
    "-mmcu=${AVR_MCU}"
    "-fuse-linker-plugin"
    "LINKER:--gc-sections"
)

target_compile_features(AvrFlags INTERFACE cxx_std_11 c_std_11)
