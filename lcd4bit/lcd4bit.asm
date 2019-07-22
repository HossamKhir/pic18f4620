
_lcd_enable:

;lcd4bit.c,3 :: 		void lcd_enable(void){
;lcd4bit.c,4 :: 		LCD_EN = 1;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;lcd4bit.c,5 :: 		Delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;lcd4bit.c,6 :: 		LCD_EN = 0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;lcd4bit.c,7 :: 		Delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;lcd4bit.c,8 :: 		}
L_end_lcd_enable:
	RETURN      0
; end of _lcd_enable

_lcd_send_command:

;lcd4bit.c,10 :: 		void lcd_send_command(char command){
;lcd4bit.c,11 :: 		char highCommand = command >> 4;   // the 4 msb
	MOVF        FARG_lcd_send_command_command+0, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	BCF         R1, 7 
;lcd4bit.c,12 :: 		LCD_RS = 0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;lcd4bit.c,14 :: 		LCD_DATA0 = 0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;lcd4bit.c,15 :: 		LCD_DATA1 = 0;
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
;lcd4bit.c,16 :: 		LCD_DATA2 = 0;
	BCF         RC6_bit+0, BitPos(RC6_bit+0) 
;lcd4bit.c,17 :: 		LCD_DATA3 = 0;
	BCF         RC7_bit+0, BitPos(RC7_bit+0) 
;lcd4bit.c,19 :: 		LCD_DATA0 = highCommand & 0x01;
	MOVLW       1
	ANDWF       R1, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_command12
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_command13
L__lcd_send_command12:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_command13:
;lcd4bit.c,20 :: 		LCD_DATA0 = highCommand & 0x02;
	MOVLW       2
	ANDWF       R1, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_command14
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_command15
L__lcd_send_command14:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_command15:
;lcd4bit.c,21 :: 		LCD_DATA0 = highCommand & 0x04;
	MOVLW       4
	ANDWF       R1, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_command16
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_command17
L__lcd_send_command16:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_command17:
;lcd4bit.c,22 :: 		LCD_DATA0 = highCommand & 0x08;
	MOVLW       8
	ANDWF       R1, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_command18
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_command19
L__lcd_send_command18:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_command19:
;lcd4bit.c,23 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd4bit.c,24 :: 		Delay_ms(2);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_lcd_send_command0:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_send_command0
	DECFSZ      R12, 1, 1
	BRA         L_lcd_send_command0
	NOP
	NOP
;lcd4bit.c,25 :: 		LCD_DATA0 = command & 0x01;
	MOVLW       1
	ANDWF       FARG_lcd_send_command_command+0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_command20
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_command21
L__lcd_send_command20:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_command21:
;lcd4bit.c,26 :: 		LCD_DATA0 = command & 0x02;
	MOVLW       2
	ANDWF       FARG_lcd_send_command_command+0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_command22
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_command23
L__lcd_send_command22:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_command23:
;lcd4bit.c,27 :: 		LCD_DATA0 = command & 0x04;
	MOVLW       4
	ANDWF       FARG_lcd_send_command_command+0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_command24
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_command25
L__lcd_send_command24:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_command25:
;lcd4bit.c,28 :: 		LCD_DATA0 = command & 0x08;
	MOVLW       8
	ANDWF       FARG_lcd_send_command_command+0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_command26
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_command27
L__lcd_send_command26:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_command27:
;lcd4bit.c,29 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd4bit.c,30 :: 		Delay_ms(2);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_lcd_send_command1:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_send_command1
	DECFSZ      R12, 1, 1
	BRA         L_lcd_send_command1
	NOP
	NOP
;lcd4bit.c,31 :: 		}
L_end_lcd_send_command:
	RETURN      0
; end of _lcd_send_command

_lcd_send_data:

;lcd4bit.c,33 :: 		void lcd_send_data(char Data){
;lcd4bit.c,34 :: 		char highData = Data >> 4;   // the 4 msb
	MOVF        FARG_lcd_send_data_Data+0, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	BCF         R1, 7 
;lcd4bit.c,35 :: 		LCD_RS = 0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;lcd4bit.c,37 :: 		LCD_DATA0 = 0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;lcd4bit.c,38 :: 		LCD_DATA1 = 0;
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
;lcd4bit.c,39 :: 		LCD_DATA2 = 0;
	BCF         RC6_bit+0, BitPos(RC6_bit+0) 
;lcd4bit.c,40 :: 		LCD_DATA3 = 0;
	BCF         RC7_bit+0, BitPos(RC7_bit+0) 
;lcd4bit.c,42 :: 		LCD_DATA0 = highData & 0x01;
	MOVLW       1
	ANDWF       R1, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_data29
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_data30
L__lcd_send_data29:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_data30:
;lcd4bit.c,43 :: 		LCD_DATA0 = highData & 0x02;
	MOVLW       2
	ANDWF       R1, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_data31
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_data32
L__lcd_send_data31:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_data32:
;lcd4bit.c,44 :: 		LCD_DATA0 = highData & 0x04;
	MOVLW       4
	ANDWF       R1, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_data33
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_data34
L__lcd_send_data33:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_data34:
;lcd4bit.c,45 :: 		LCD_DATA0 = highData & 0x08;
	MOVLW       8
	ANDWF       R1, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_data35
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_data36
L__lcd_send_data35:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_data36:
;lcd4bit.c,46 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd4bit.c,47 :: 		Delay_ms(2);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_lcd_send_data2:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_send_data2
	DECFSZ      R12, 1, 1
	BRA         L_lcd_send_data2
	NOP
	NOP
;lcd4bit.c,48 :: 		LCD_DATA0 = Data & 0x01;
	MOVLW       1
	ANDWF       FARG_lcd_send_data_Data+0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_data37
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_data38
L__lcd_send_data37:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_data38:
;lcd4bit.c,49 :: 		LCD_DATA0 = Data & 0x02;
	MOVLW       2
	ANDWF       FARG_lcd_send_data_Data+0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_data39
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_data40
L__lcd_send_data39:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_data40:
;lcd4bit.c,50 :: 		LCD_DATA0 = Data & 0x04;
	MOVLW       4
	ANDWF       FARG_lcd_send_data_Data+0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_data41
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_data42
L__lcd_send_data41:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_data42:
;lcd4bit.c,51 :: 		LCD_DATA0 = Data & 0x08;
	MOVLW       8
	ANDWF       FARG_lcd_send_data_Data+0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__lcd_send_data43
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__lcd_send_data44
L__lcd_send_data43:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__lcd_send_data44:
;lcd4bit.c,52 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd4bit.c,53 :: 		Delay_ms(2);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_lcd_send_data3:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_send_data3
	DECFSZ      R12, 1, 1
	BRA         L_lcd_send_data3
	NOP
	NOP
;lcd4bit.c,54 :: 		}
L_end_lcd_send_data:
	RETURN      0
; end of _lcd_send_data

_Lcd_Init:

;lcd4bit.c,56 :: 		void Lcd_Init(void){
;lcd4bit.c,57 :: 		LCD_RS_DIR = 0;
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;lcd4bit.c,58 :: 		LCD_EN_DIR = 0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;lcd4bit.c,59 :: 		LCD_RS = 0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;lcd4bit.c,60 :: 		LCD_EN = 0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;lcd4bit.c,61 :: 		LCD_DATA_DIR0 = 0;
	BCF         TRISC4_bit+0, BitPos(TRISC4_bit+0) 
;lcd4bit.c,62 :: 		LCD_DATA_DIR1 = 0;
	BCF         TRISC5_bit+0, BitPos(TRISC5_bit+0) 
;lcd4bit.c,63 :: 		LCD_DATA_DIR2 = 0;
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;lcd4bit.c,64 :: 		LCD_DATA_DIR3 = 0;
	BCF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;lcd4bit.c,65 :: 		LCD_DATA0 = 0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;lcd4bit.c,66 :: 		LCD_DATA1 = 0;
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
;lcd4bit.c,67 :: 		LCD_DATA2 = 0;
	BCF         RC6_bit+0, BitPos(RC6_bit+0) 
;lcd4bit.c,68 :: 		LCD_DATA3 = 0;
	BCF         RC7_bit+0, BitPos(RC7_bit+0) 
;lcd4bit.c,70 :: 		Delay_ms(17);
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       18
	MOVWF       R13, 0
L_Lcd_Init4:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_Init4
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_Init4
	NOP
;lcd4bit.c,71 :: 		LCD_DATA0 = 0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;lcd4bit.c,72 :: 		LCD_DATA1 = 0;
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
;lcd4bit.c,73 :: 		LCD_DATA2 = 0;
	BCF         RC6_bit+0, BitPos(RC6_bit+0) 
;lcd4bit.c,74 :: 		LCD_DATA3 = 0;
	BCF         RC7_bit+0, BitPos(RC7_bit+0) 
;lcd4bit.c,75 :: 		lcd_send_command(0x38);
	MOVLW       56
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,76 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd4bit.c,77 :: 		Delay_ms(6);
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Lcd_Init5:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_Init5
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_Init5
	NOP
	NOP
;lcd4bit.c,78 :: 		LCD_DATA0 = 0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;lcd4bit.c,79 :: 		LCD_DATA1 = 0;
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
;lcd4bit.c,80 :: 		LCD_DATA2 = 0;
	BCF         RC6_bit+0, BitPos(RC6_bit+0) 
;lcd4bit.c,81 :: 		LCD_DATA3 = 0;
	BCF         RC7_bit+0, BitPos(RC7_bit+0) 
;lcd4bit.c,82 :: 		lcd_send_command(0x38);
	MOVLW       56
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,83 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd4bit.c,84 :: 		Delay_us(150);
	MOVLW       49
	MOVWF       R13, 0
L_Lcd_Init6:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_Init6
	NOP
	NOP
;lcd4bit.c,85 :: 		LCD_DATA0 = 0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;lcd4bit.c,86 :: 		LCD_DATA1 = 0;
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
;lcd4bit.c,87 :: 		LCD_DATA2 = 0;
	BCF         RC6_bit+0, BitPos(RC6_bit+0) 
;lcd4bit.c,88 :: 		LCD_DATA3 = 0;
	BCF         RC7_bit+0, BitPos(RC7_bit+0) 
;lcd4bit.c,89 :: 		lcd_send_command(0x38);
	MOVLW       56
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,90 :: 		lcd_enable();
	CALL        _lcd_enable+0, 0
;lcd4bit.c,92 :: 		lcd_send_command(0x01);
	MOVLW       1
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,93 :: 		lcd_send_command(0x02);
	MOVLW       2
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,94 :: 		lcd_send_command(0x06);
	MOVLW       6
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,95 :: 		lcd_send_command(0x0C);
	MOVLW       12
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,96 :: 		lcd_send_command(0x14);
	MOVLW       20
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,97 :: 		lcd_send_command(0x38);
	MOVLW       56
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,98 :: 		lcd_send_command(0x80);
	MOVLW       128
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,99 :: 		}
L_end_Lcd_Init:
	RETURN      0
; end of _Lcd_Init

_lcdOutCP:

;lcd4bit.c,101 :: 		void lcdOutCP(char *text){
;lcd4bit.c,102 :: 		while(*text)
L_lcdOutCP7:
	MOVFF       FARG_lcdOutCP_text+0, FSR0
	MOVFF       FARG_lcdOutCP_text+1, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_lcdOutCP8
;lcd4bit.c,104 :: 		lcd_send_data(*text++);
	MOVFF       FARG_lcdOutCP_text+0, FSR0
	MOVFF       FARG_lcdOutCP_text+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_lcd_send_data_Data+0 
	CALL        _lcd_send_data+0, 0
	INFSNZ      FARG_lcdOutCP_text+0, 1 
	INCF        FARG_lcdOutCP_text+1, 1 
;lcd4bit.c,105 :: 		Delay_ms(2);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_lcdOutCP9:
	DECFSZ      R13, 1, 1
	BRA         L_lcdOutCP9
	DECFSZ      R12, 1, 1
	BRA         L_lcdOutCP9
	NOP
	NOP
;lcd4bit.c,106 :: 		}
	GOTO        L_lcdOutCP7
L_lcdOutCP8:
;lcd4bit.c,107 :: 		}
L_end_lcdOutCP:
	RETURN      0
; end of _lcdOutCP

_lcdChrCP:

;lcd4bit.c,109 :: 		void lcdChrCP(char text){
;lcd4bit.c,110 :: 		lcd_send_data(text);
	MOVF        FARG_lcdChrCP_text+0, 0 
	MOVWF       FARG_lcd_send_data_Data+0 
	CALL        _lcd_send_data+0, 0
;lcd4bit.c,111 :: 		}
L_end_lcdChrCP:
	RETURN      0
; end of _lcdChrCP

_lcdCmd:

;lcd4bit.c,113 :: 		void lcdCmd(char command){
;lcd4bit.c,114 :: 		lcd_send_command(command);
	MOVF        FARG_lcdCmd_command+0, 0 
	MOVWF       FARG_lcd_send_command_command+0 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,115 :: 		}
L_end_lcdCmd:
	RETURN      0
; end of _lcdCmd

_lcdSetCursor:

;lcd4bit.c,117 :: 		void lcdSetCursor(char row, char col){
;lcd4bit.c,118 :: 		row -= 1;
	DECF        FARG_lcdSetCursor_row+0, 1 
;lcd4bit.c,119 :: 		col -= 1;
	DECF        FARG_lcdSetCursor_col+0, 1 
;lcd4bit.c,120 :: 		lcd_send_command((0x80 +(row * 0x40)) + col);
	MOVLW       6
	MOVWF       R1 
	MOVF        FARG_lcdSetCursor_row+0, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L__lcdSetCursor50:
	BZ          L__lcdSetCursor51
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__lcdSetCursor50
L__lcdSetCursor51:
	MOVF        R0, 0 
	ADDLW       128
	MOVWF       FARG_lcd_send_command_command+0 
	MOVF        FARG_lcdSetCursor_col+0, 0 
	ADDWF       FARG_lcd_send_command_command+0, 1 
	CALL        _lcd_send_command+0, 0
;lcd4bit.c,121 :: 		}
L_end_lcdSetCursor:
	RETURN      0
; end of _lcdSetCursor

_lcdOut:

;lcd4bit.c,123 :: 		void lcdOut(char row, char col, char *text){
;lcd4bit.c,124 :: 		lcdSetCursor(row, col);
	MOVF        FARG_lcdOut_row+0, 0 
	MOVWF       FARG_lcdSetCursor_row+0 
	MOVF        FARG_lcdOut_col+0, 0 
	MOVWF       FARG_lcdSetCursor_col+0 
	CALL        _lcdSetCursor+0, 0
;lcd4bit.c,125 :: 		lcdOutCP(text);
	MOVF        FARG_lcdOut_text+0, 0 
	MOVWF       FARG_lcdOutCP_text+0 
	MOVF        FARG_lcdOut_text+1, 0 
	MOVWF       FARG_lcdOutCP_text+1 
	CALL        _lcdOutCP+0, 0
;lcd4bit.c,126 :: 		}
L_end_lcdOut:
	RETURN      0
; end of _lcdOut

_lcdChr:

;lcd4bit.c,128 :: 		void lcdChr(char row, char col, char text){
;lcd4bit.c,129 :: 		lcdSetCursor(row, col);
	MOVF        FARG_lcdChr_row+0, 0 
	MOVWF       FARG_lcdSetCursor_row+0 
	MOVF        FARG_lcdChr_col+0, 0 
	MOVWF       FARG_lcdSetCursor_col+0 
	CALL        _lcdSetCursor+0, 0
;lcd4bit.c,130 :: 		lcdChrCP(text);
	MOVF        FARG_lcdChr_text+0, 0 
	MOVWF       FARG_lcdChrCP_text+0 
	CALL        _lcdChrCP+0, 0
;lcd4bit.c,131 :: 		}
L_end_lcdChr:
	RETURN      0
; end of _lcdChr
