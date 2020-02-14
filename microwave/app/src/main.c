
#include "segment7.h"

#define MICROWAVE_REGISTER_DISPLAY_DATA        (&TRISA)
#define MICROWAVE_REGISTER_DISPLAY_SELECT      (&TRISD)
#define MICROWAVE_REGISTER_LAMP                (&TRISB)

#define MICROWAVE_DISPLAY           (&PORTD)
#define MICROWAVE_DISPLAY_SELECT    (&PORTA)
#define MICROWAVE_LAMP              (&PORTB)

#define MASK_SECONDS_UNITS          (0x20)
#define MASK_SECONDS_TENS           (0x10)
#define MASK_MINUTES_UNITS          (0x08)
#define MASK_MINUTES_TENS           (0x04)
#define MASK_LAMP                   (0x10)

#define MASK_MICROWAVE_DISPLAY_SELECT ~(0x3C)


const char numbers[10] = { 0b00111111,          // 0
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
      
struct Time {
       unsigned char seconds;
       unsigned char minutes;
} time;


void main() {
    // TODO: testing block

    unsigned char u8Index = 0;
    
    SEGMENT7_vidInit(MICROWAVE_REGISTER_DISPLAY_SELECT,
            MICROWAVE_REGISTER_DISPLAY_DATA,
            MICROWAVE_DISPLAY,
            MICROWAVE_DISPLAY_SELECT,
            MASK_MICROWAVE_DISPLAY_SELECT);
                     
    time.seconds = 10;
    
    *MICROWAVE_REGISTER_LAMP &= ~(0xff);
    *MICROWAVE_LAMP &= ~(0xFF);
    
    while(time.seconds >= 0)
    {
        for (u8Index = 0; u8Index < 200; u8Index += 1)
        {
            SEGMENT7_vidDisplayDigit(MASK_SECONDS_UNITS,
                    numbers[(time.seconds % 10)]);
            
            Delay_us(2500);
            
            SEGMENT7_vidDisplayDigit(MASK_SECONDS_TENS,
                    numbers[(time.seconds / 10)]);
            
            Delay_us(2500);
        }
        
        *MICROWAVE_LAMP ^= MASK_LAMP;
        
        time.seconds -= 1;
    }
}