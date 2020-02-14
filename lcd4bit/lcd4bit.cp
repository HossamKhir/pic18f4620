#line 1 "E:/embedded_diploma/projects/pic/lcd4bit/lcd4bit.c"
#line 1 "e:/embedded_diploma/projects/pic/lcd4bit/lcd4bit.h"
#line 17 "e:/embedded_diploma/projects/pic/lcd4bit/lcd4bit.h"
void lcd_enable(void);
void lcd_send_command(char command);
void lcd_send_data(char Data);
void Lcd_Init(void);
void lcdOutCP(char *text);
void lcdChrCP(char text);
void lcdCmd(char command);
void lcdSetCursor(char row, char col);
void lcdOut(char row, char col, char *text);
void lcdChr(char row, char col, char text);
#line 3 "E:/embedded_diploma/projects/pic/lcd4bit/lcd4bit.c"
void lcd_enable(void){
  RC1_bit  = 1;
 Delay_us(5);
  RC1_bit  = 0;
 Delay_us(5);
}

void lcd_send_command(char command){
 char highCommand = command >> 4;
  RC0_bit  = 0;

  RC4_bit  = 0;
  RC5_bit  = 0;
  RC6_bit  = 0;
  RC7_bit  = 0;

  RC4_bit  = highCommand & 0x01;
  RC4_bit  = highCommand & 0x02;
  RC4_bit  = highCommand & 0x04;
  RC4_bit  = highCommand & 0x08;
 lcd_enable();
 Delay_ms(2);
  RC4_bit  = command & 0x01;
  RC4_bit  = command & 0x02;
  RC4_bit  = command & 0x04;
  RC4_bit  = command & 0x08;
 lcd_enable();
 Delay_ms(2);
}

void lcd_send_data(char Data){
 char highData = Data >> 4;
  RC0_bit  = 0;

  RC4_bit  = 0;
  RC5_bit  = 0;
  RC6_bit  = 0;
  RC7_bit  = 0;

  RC4_bit  = highData & 0x01;
  RC4_bit  = highData & 0x02;
  RC4_bit  = highData & 0x04;
  RC4_bit  = highData & 0x08;
 lcd_enable();
 Delay_ms(2);
  RC4_bit  = Data & 0x01;
  RC4_bit  = Data & 0x02;
  RC4_bit  = Data & 0x04;
  RC4_bit  = Data & 0x08;
 lcd_enable();
 Delay_ms(2);
}

void Lcd_Init(void){
  TRISC0_bit  = 0;
  TRISC1_bit  = 0;
  RC0_bit  = 0;
  RC1_bit  = 0;
  TRISC4_bit  = 0;
  TRISC5_bit  = 0;
  TRISC6_bit  = 0;
  TRISC7_bit  = 0;
  RC4_bit  = 0;
  RC5_bit  = 0;
  RC6_bit  = 0;
  RC7_bit  = 0;

 Delay_ms(17);
  RC4_bit  = 0;
  RC5_bit  = 0;
  RC6_bit  = 0;
  RC7_bit  = 0;
 lcd_send_command(0x38);
 lcd_enable();
 Delay_ms(6);
  RC4_bit  = 0;
  RC5_bit  = 0;
  RC6_bit  = 0;
  RC7_bit  = 0;
 lcd_send_command(0x38);
 lcd_enable();
 Delay_us(150);
  RC4_bit  = 0;
  RC5_bit  = 0;
  RC6_bit  = 0;
  RC7_bit  = 0;
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

void lcdOutCP(char *text){
 while(*text)
 {
 lcd_send_data(*text++);
 Delay_ms(2);
 }
}

void lcdChrCP(char text){
 lcd_send_data(text);
}

void lcdCmd(char command){
 lcd_send_command(command);
}

void lcdSetCursor(char row, char col){
 row -= 1;
 col -= 1;
 lcd_send_command((0x80 +(row * 0x40)) + col);
}

void lcdOut(char row, char col, char *text){
 lcdSetCursor(row, col);
 lcdOutCP(text);
}

void lcdChr(char row, char col, char text){
 lcdSetCursor(row, col);
 lcdChrCP(text);
}
