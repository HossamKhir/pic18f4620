
_CustomChar:

;LCD0.c,22 :: 		void CustomChar(char pos_row, char pos_char, const char* arr) {
;LCD0.c,24 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD0.c,25 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(arr[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar0:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar1
	MOVF        CustomChar_i_L0+0, 0 
	ADDWF       FARG_CustomChar_arr+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_CustomChar_arr+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_CustomChar_arr+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar0
L_CustomChar1:
;LCD0.c,26 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD0.c,27 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;LCD0.c,28 :: 		}
L_end_CustomChar:
	RETURN      0
; end of _CustomChar

_main:

;LCD0.c,31 :: 		void main() {
;LCD0.c,32 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;LCD0.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD0.c,34 :: 		while(1){
L_main3:
;LCD0.c,35 :: 		CustomChar(1,2,character0);
	MOVLW       1
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       2
	MOVWF       FARG_CustomChar_pos_char+0 
	MOVLW       _character0+0
	MOVWF       FARG_CustomChar_arr+0 
	MOVLW       hi_addr(_character0+0)
	MOVWF       FARG_CustomChar_arr+1 
	MOVLW       higher_addr(_character0+0)
	MOVWF       FARG_CustomChar_arr+2 
	CALL        _CustomChar+0, 0
;LCD0.c,36 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;LCD0.c,37 :: 		CustomChar(1,2,character1);
	MOVLW       1
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       2
	MOVWF       FARG_CustomChar_pos_char+0 
	MOVLW       _character1+0
	MOVWF       FARG_CustomChar_arr+0 
	MOVLW       hi_addr(_character1+0)
	MOVWF       FARG_CustomChar_arr+1 
	MOVLW       higher_addr(_character1+0)
	MOVWF       FARG_CustomChar_arr+2 
	CALL        _CustomChar+0, 0
;LCD0.c,38 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;LCD0.c,39 :: 		CustomChar(1,2,character2);
	MOVLW       1
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       2
	MOVWF       FARG_CustomChar_pos_char+0 
	MOVLW       _character2+0
	MOVWF       FARG_CustomChar_arr+0 
	MOVLW       hi_addr(_character2+0)
	MOVWF       FARG_CustomChar_arr+1 
	MOVLW       higher_addr(_character2+0)
	MOVWF       FARG_CustomChar_arr+2 
	CALL        _CustomChar+0, 0
;LCD0.c,40 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;LCD0.c,41 :: 		}
	GOTO        L_main3
;LCD0.c,44 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
