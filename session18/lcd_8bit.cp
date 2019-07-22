#line 1 "G:/embeddedDiploma/proteusFiles/session18/lcd_8bit.c"
#line 1 "g:/embeddeddiploma/proteusfiles/session18/lcd_8bit.h"










void lcd_enable(void);
void lcd_send_command(char command);
void lcd_send_data(char Data);
void Lcd_Init(void);
#line 3 "G:/embeddedDiploma/proteusFiles/session18/lcd_8bit.c"
void lcd_enable(void){
  RC1_bit  = 1;
 Delay_us(5);
  RC1_bit  = 0;
 Delay_us(5);
}

void lcd_send_command(char command){
  RC0_bit  = 0;
  PORTD  = 0;
  PORTD  = command;
 lcd_enable();
}

void lcd_send_data(char Data){
  RC0_bit  = 1;
  PORTD  = 0;
  PORTD  = Data;
 lcd_enable();
}

void Lcd_Init(void){
  TRISC0_bit  = 0;
  TRISC1_bit  = 0;
  RC0_bit  = 0;
  RC1_bit  = 0;
  TRISD  = 0;
  PORTD  = 0;

 Delay_ms(17);
  PORTD  = 0;
 lcd_send_command(0x38);
 lcd_enable();
 Delay_ms(6);
  PORTD  = 0;
 lcd_send_command(0x38);
 lcd_enable();
 Delay_us(150);
  PORTD  = 0;
 lcd_send_command(0x38);
 lcd_enable();

 lcd_send_command(0x01);
 lcd_send_command(0x02);
 lcd_send_command(0x06);
 lcd_send_command(0x0C);
 lcd_send_command(0x14);
 lcd_send_command(0x38);
 lcd_send_command(0x80);
}
