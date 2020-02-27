#line 1 "E:/embedded_diploma/projects/pic/microwave/test-playground/unit_02_LCD/01_code/unit02_01_helloWorldLCD.c"
#line 71 "E:/embedded_diploma/projects/pic/microwave/test-playground/unit_02_LCD/01_code/unit02_01_helloWorldLCD.c"
sbit LCD_RS at LATE2_bit;
sbit LCD_EN at LATE1_bit;
sbit LCD_D4 at LATD4_bit;
sbit LCD_D5 at LATD5_bit;
sbit LCD_D6 at LATD6_bit;
sbit LCD_D7 at LATD7_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
#line 32 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
const enum enTimers {
 TIMER0,
 TIMER1,
 TIMER2,
 TIMER3
};

const enum enPrescale {
 P1,
 P2,
 P4,
 P8,
 P16,
 P32,
 P64,
 P128,
 P256
};

void TIMERS_vidInitTimer(const enum enTimers, const enum enPrescale, unsigned long, unsigned long);
void TIMERS_vidStartTimer(const enum enTimers);
#line 87 "E:/embedded_diploma/projects/pic/microwave/test-playground/unit_02_LCD/01_code/unit02_01_helloWorldLCD.c"
void main(){




 ADCON1 |= 0X0F;


 Lcd_Init();



 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 TIMERS_vidInitTimer(TIMER0, P128, 1,  1000000 );



}
