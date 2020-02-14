#include "segment7.h"

int second = 0, minute = 0, hour = 0, i;

const char numbers[10] = { 0b00111111,            // 0
      0b00000110,                               // 1
      0b01011011,                               // 2
      0b01001111,                               // 3
      0b01100110,                               // 4
      0b01101101,                               // 5
      0b01111101,                               // 6
      0b00000111,                               // 7
      0b01111111,                               // 8
      0b01101111                                // 9
      };

void main() {
     /*TRISA &= ~(0x3C); // 0b00111100
     PORTA &= ~(0x3C);
     TRISD &= ~(0x7F);
     PORTD &= ~(0x7F);*/
     
     
/*PORTA = 0b11111111;
     PORTD = 0b01101001;*/
     SEGMENT7_vidInit(&TRISD, &TRISA, ~(0x3C));
     
     while (1)
     {
        for (i = 0; i <= 50; i++)
        {
            PORTA = 32;
            PORTD = numbers[second % 10];
            Delay_us(3333);
            PORTA = 16;
            PORTD = numbers[second /10];
            Delay_us(3333);
            PORTA = 8;
            PORTD = numbers[minute % 10];
            Delay_us(3333);
            PORTA = 4;
            PORTD = numbers[minute /10];
            Delay_us(3333);
            /*PORTD = 32;
            PORTD = hour % 10;
            Delay_us(3333);
            PORTD = 32;
            PORTD = hour /10;
            Delay_us(3333);*/
        }

        second++;
        if (second == 60)
        {
           second = 0;
           minute++;
        }
        if (minute == 60)
        {
           minute = 0;
           hour++;
        }
        if (hour == 24)
        {
           hour = 0;
        }
     }

}