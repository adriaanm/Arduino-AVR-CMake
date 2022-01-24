# Minimal blink for attiny85 using avr-gcc and cmake

Compile AVR programs for an attiny85 using CMake. No dependencies on arduino.
Based on https://github.com/tttapa/Arduino-AVR-CMake.

## Instructions (Mac)
1. `brew install avr-gcc`
2. Install micronucleus
```
brew install pkg-config libusb libusb-compat libusb-dev
gh repo clone https://github.com/micronucleus/micronucleus
cd micronucleus/commandline
make install
```
3. Configure the project using CMake by running the following command:
    ```sh
    cmake -S. -Bbuild \
        -D CMAKE_TOOLCHAIN_FILE=cmake/toolchain/avr.toolchain.cmake \
        -D CMAKE_BUILD_TYPE=MinSizeRel
    ```
4. Finally, build and upload the example “blink” program (using micronucleus):
    ```sh
    cmake --build build -j -t upload-blink
    ```
    To compile the program without uploading, you can use 
    ```sh
    cmake --build build -j -t blink
    ```

## VSCode

Some stuff comes preconfigured.
