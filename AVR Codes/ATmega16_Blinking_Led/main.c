/*
Hello AVR World
Make a blinking led with ATmega16 and led on PORTC(pin PC0)
 */

#include <avr/io.h>
#include<avr/delay.h>

int main(void)
{
    DDRC=0xFF;

    while(1)
    {
     PORTC=0x00;
     _delay_ms(500);
     PORTC=0x01;
     _delay_ms(500);
    }
    return 0;
}
