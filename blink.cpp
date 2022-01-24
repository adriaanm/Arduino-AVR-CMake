#include <Arduino.h>

void setup() {
    delay(2000);
    pinMode(0, OUTPUT);
}

void loop() {
    digitalWrite(0, HIGH);
    delay(500);
    digitalWrite(0, LOW);
    delay(500);
}
