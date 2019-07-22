
_lcd_enable:

;lcd_8bit.c,3 :: 		void lcd_enable(void){
;lcd_8bit.c,4 :: 		LCD_EN = 1;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;lcd_8bit.c,5 :: 		Delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;lcd_8bit.c,6 :: 		LCD_EN = 0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;lcd_8bit.c,7 :: 		Delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;lcd_8bit.c,8 :: 		}
L_end_lcd_enable:
	RETURN      0
; end of _lcd_enable

_lcd_send_command:

;lcd_8bit.c,10 :: 		void lcd_send_command(char command){
;lcd_8bit.c,11 :: 		LCD_RS = 0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;lcd_8bit.c,12 :: 		LCD_DATA = 0;
	CLRF        PORTD+0 
;lcd_8bit.c,13 :: 		LCD_DATA = command;
	MOVF        FARG_lcd_send_command_command+0, 0 
	MOVWF       PORTD+0 
;lcd_8bit.c,14 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd_8bit.c,15 :: 		}
L_end_lcd_send_command:
	RETURN      0
; end of _lcd_send_command

_lcd_send_data:

;lcd_8bit.c,17 :: 		void lcd_send_data(char Data){
;lcd_8bit.c,18 :: 		LCD_RS = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;lcd_8bit.c,19 :: 		LCD_DATA = 0;
	CLRF        PORTD+0 
;lcd_8bit.c,20 :: 		LCD_DATA = Data;
	MOVF        FARG_lcd_send_data_Data+0, 0 
	MOVWF       PORTD+0 
;lcd_8bit.c,21 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd_8bit.c,22 :: 		}
L_end_lcd_send_data:
	RETURN      0
; end of _lcd_send_data

_Lcd_Init:

;lcd_8bit.c,24 :: 		void Lcd_Init(void){
;lcd_8bit.c,25 :: 		LCD_RS_DIR = 0;
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;lcd_8bit.c,26 :: 		LCD_EN_DIR = 0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;lcd_8bit.c,27 :: 		LCD_RS = 0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;lcd_8bit.c,28 :: 		LCD_EN = 0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;lcd_8bit.c,29 :: 		LCD_DATA_DIR = 0;
	CLRF        TRISD+0 
;lcd_8bit.c,30 :: 		LCD_DATA = 0;
	CLRF        PORTD+0 
;lcd_8bit.c,32 :: 		Delay_ms(17);
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       18
	MOVWF       R13, 0
L_Lcd_Init0:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_Init0
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_Init0
	NOP
;lcd_8bit.c,33 :: 		LCD_DATA = 0;
	CLRF        PORTD+0 
;lcd_8bit.c,34 :: 		lcd_send_command(0x38);
	MOVLW       56
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd_8bit.c,35 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd_8bit.c,36 :: 		Delay_ms(6);
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Lcd_Init1:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_Init1
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_Init1
	NOP
	NOP
;lcd_8bit.c,37 :: 		LCD_DATA = 0;
	CLRF        PORTD+0 
;lcd_8bit.c,38 :: 		lcd_send_command(0x38);
	MOVLW       56
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd_8bit.c,39 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd_8bit.c,40 :: 		Delay_us(150);
	MOVLW       49
	MOVWF       R13, 0
L_Lcd_Init2:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_Init2
	NOP
	NOP
;lcd_8bit.c,41 :: 		LCD_DATA = 0;
	CLRF        PORTD+0 
;lcd_8bit.c,42 :: 		lcd_send_command(0x38);
	MOVLW       56
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd_8bit.c,43 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd_8bit.c,45 :: 		lcd_send_command(0x01);
	MOVLW       1
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd_8bit.c,46 :: 		lcd_send_command(0x02);
	MOVLW       2
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd_8bit.c,47 :: 		lcd_send_command(0x06);
	MOVLW       6
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd_8bit.c,48 :: 		lcd_send_command(0x0C);
	MOVLW       12
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd_8bit.c,49 :: 		lcd_send_command(0x14);
	MOVLW       20
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd_8bit.c,50 :: 		lcd_send_command(0x38);
	MOVLW       56
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd_8bit.c,51 :: 		lcd_send_command(0x80);
	MOVLW       128
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd_8bit.c,52 :: 		}
L_end_Lcd_Init:
	RETURN      0
; end of _Lcd_Init
