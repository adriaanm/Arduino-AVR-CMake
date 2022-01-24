set(ARDUINO_AVRDUDE_PATH ${ARDUINO_PATH}/tools/avrdude/6.3.0-arduino17)
set(ARDUINO_AVRDUDE_CONF ${ARDUINO_AVRDUDE_PATH}/etc/avrdude.conf)
set(ARDUINO_AVRDUDE ${ARDUINO_AVRDUDE_PATH}/bin/avrdude)

# Creates a target upload-target that uses avrdude to upload target.hex to the
# given serial port.
function(arduino_avr_upload target port)
    add_custom_target(upload-${target}
        COMMAND ${ARDUINO_AVRDUDE} 
            -C${ARDUINO_AVRDUDE_CONF}
            -p${ARDUINO_MCU}
            -c${ARDUINO_AVRDUDE_PROTOCOL}
            -P${port}
            -b${ARDUINO_AVRDUDE_SPEED}
            -D
            "-Uflash:w:$<TARGET_FILE_BASE_NAME:${target}>.hex:i")
    add_dependencies(upload-${target} ${target})
endfunction()