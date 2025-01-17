#include <avr/io.h>
#include <util/delay.h>
 
#define BLINK_DELAY_MS 1000
 
int main (void)
{
 /* set pin 5 of PORTB for output*/
 DDRB |= _BV(PB0);
 
 while(1) {
  /* set pin 5 high to turn led on */
  PORTB |= _BV(PB0);
  _delay_ms(BLINK_DELAY_MS);
 
  /* set pin 5 low to turn led off */
  PORTB &= ~_BV(PB0);
  _delay_ms(BLINK_DELAY_MS);
 }
}