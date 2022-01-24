# Transforms the target.elf file into target.eep (EEPROM) and target.hex files.
# Also prints the size of each section in target.elf.
function(avr_hex target)
    set_target_properties(${target} PROPERTIES SUFFIX ".elf")
    add_custom_command(TARGET ${target} POST_BUILD
        COMMAND ${CMAKE_SIZE} ARGS 
            -A "$<TARGET_FILE:${target}>"
        USES_TERMINAL)
    add_custom_command(TARGET ${target} POST_BUILD
        BYPRODUCTS ${target}.eep
        COMMAND ${CMAKE_OBJCOPY} ARGS 
            -O ihex -j .eeprom
            --set-section-flags=.eeprom=alloc,load
            --no-change-warnings --change-section-lma 
            .eeprom=0
            "$<TARGET_FILE:${target}>"
            ${target}.eep)
    add_custom_command(TARGET ${target} POST_BUILD
        BYPRODUCTS ${target}.hex
        COMMAND ${CMAKE_OBJCOPY} ARGS 
            -O ihex -R .eeprom
            "$<TARGET_FILE:${target}>"
            ${target}.hex)
endfunction()

# Creates a target upload-target that uses micronucleus to upload target.hex
function(avr_micronucleus_upload target)
    add_custom_target(upload-${target} COMMAND ${MICRONUCLEUS} "$<TARGET_FILE_BASE_NAME:${target}>.hex")
    add_dependencies(upload-${target} ${target})
endfunction()