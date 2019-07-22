#include "lcd4bit.h"

void lcd_enable(void){
     LCD_EN = 1;
     Delay_us(5);
     LCD_EN = 0;
     Delay_us(5);
}

void lcd_send_command(char command){
     char highCommand = command >> 4;   // the 4 msb
     LCD_RS = 0;
     
     LCD_DATA0 = 0;
     LCD_DATA1 = 0;
     LCD_DATA2 = 0;
     LCD_DATA3 = 0;
     
     LCD_DATA0 = highCommand & 0x01;
     LCD_DATA0 = highCommand & 0x02;
     LCD_DATA0 = highCommand & 0x04;
     LCD_DATA0 = highCommand & 0x08;
     lcd_enable();
     Delay_ms(2);
     LCD_DATA0 = command & 0x01;
     LCD_DATA0 = command & 0x02;
     LCD_DATA0 = command & 0x04;
     LCD_DATA0 = command & 0x08;
     lcd_enable();
     Delay_ms(2);
}

void lcd_send_data(char Data){
     char highData = Data >> 4;   // the 4 msb
     LCD_RS = 0;

     LCD_DATA0 = 0;
     LCD_DATA1 = 0;
     LCD_DATA2 = 0;
     LCD_DATA3 = 0;

     LCD_DATA0 = highData & 0x01;
     LCD_DATA0 = highData & 0x02;
     LCD_DATA0 = highData & 0x04;
     LCD_DATA0 = highData & 0x08;
     lcd_enable();
     Delay_ms(2);
     LCD_DATA0 = Data & 0x01;
     LCD_DATA0 = Data & 0x02;
     LCD_DATA0 = Data & 0x04;
     LCD_DATA0 = Data & 0x08;
     lcd_enable();
     Delay_ms(2);
}

void Lcd_Init(void){
     LCD_RS_DIR = 0;
     LCD_EN_DIR = 0;
     LCD_RS = 0;
     LCD_EN = 0;
     LCD_DATA_DIR0 = 0;
     LCD_DATA_DIR1 = 0;
     LCD_DATA_DIR2 = 0;
     LCD_DATA_DIR3 = 0;
     LCD_DATA0 = 0;
     LCD_DATA1 = 0;
     LCD_DATA2 = 0;
     LCD_DATA3 = 0;
     // LCD Reset Operations
     Delay_ms(17);
     LCD_DATA0 = 0;
     LCD_DATA1 = 0;
     LCD_DATA2 = 0;
     LCD_DATA3 = 0;
     lcd_send_command(0x38);
     lcd_enable();
     Delay_ms(6);
     LCD_DATA0 = 0;
     LCD_DATA1 = 0;
     LCD_DATA2 = 0;
     LCD_DATA3 = 0;
     lcd_send_command(0x38);
     lcd_enable();
     Delay_us(150);
     LCD_DATA0 = 0;
     LCD_DATA1 = 0;
     LCD_DATA2 = 0;
     LCD_DATA3 = 0;
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