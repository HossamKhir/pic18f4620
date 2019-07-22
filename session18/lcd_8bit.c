#include "lcd_8bit.h"

void lcd_enable(void){
     LCD_EN = 1;
     Delay_us(5);
     LCD_EN = 0;
     Delay_us(5);
}

void lcd_send_command(char command){
     LCD_RS = 0;
     LCD_DATA = 0;
     LCD_DATA = command;
     lcd_enable();
}

void lcd_send_data(char Data){
     LCD_RS = 1;
     LCD_DATA = 0;
     LCD_DATA = Data;
     lcd_enable();
}

void Lcd_Init(void){
     LCD_RS_DIR = 0;
     LCD_EN_DIR = 0;
     LCD_RS = 0;
     LCD_EN = 0;
     LCD_DATA_DIR = 0;
     LCD_DATA = 0;
     // LCD Reset Operations
     Delay_ms(17);
     LCD_DATA = 0;
     lcd_send_command(0x38);
     lcd_enable();
     Delay_ms(6);
     LCD_DATA = 0;
     lcd_send_command(0x38);
     lcd_enable();
     Delay_us(150);
     LCD_DATA = 0;
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