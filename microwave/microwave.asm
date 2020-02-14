
_main:

;microwave.c,36 :: 		void main() {
;microwave.c,39 :: 		unsigned char u8Index = 0;
	CLRF        main_u8Index_L0+0 
;microwave.c,41 :: 		SEGMENT7_vidInit(MICROWAVE_REGISTER_DISPLAY_SELECT,
	MOVLW       TRISD+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(TRISD+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
;microwave.c,42 :: 		MICROWAVE_REGISTER_DISPLAY_DATA,
	MOVLW       TRISA+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(TRISA+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
;microwave.c,43 :: 		MICROWAVE_DISPLAY,
	MOVLW       PORTD+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
;microwave.c,44 :: 		MICROWAVE_DISPLAY_SELECT,
	MOVLW       PORTA+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
;microwave.c,45 :: 		MASK_MICROWAVE_DISPLAY_SELECT);
	MOVLW       195
	MOVWF       FARG_SEGMENT7_vidInit+0 
	CALL        _SEGMENT7_vidInit+0, 0
;microwave.c,47 :: 		time.seconds = 10;
	MOVLW       10
	MOVWF       _time+0 
;microwave.c,49 :: 		while(time.seconds >= 0)
L_main0:
	MOVLW       0
	SUBWF       _time+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main1
;microwave.c,51 :: 		for (u8Index = 0; u8Index < 200; u8Index += 1)
	CLRF        main_u8Index_L0+0 
L_main2:
	MOVLW       200
	SUBWF       main_u8Index_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;microwave.c,53 :: 		SEGMENT7_vidDisplayDigit(MASK_SECONDS_UNITS,
	MOVLW       32
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
;microwave.c,54 :: 		numbers[(time.seconds % 10)]);
	MOVLW       10
	MOVWF       R4 
	MOVF        _time+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       _numbers+0
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_numbers+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_numbers+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_SEGMENT7_vidDisplayDigit+0
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;microwave.c,56 :: 		Delay_us(2500);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       61
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;microwave.c,58 :: 		SEGMENT7_vidDisplayDigit(MASK_SECONDS_TENS,
	MOVLW       16
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
;microwave.c,59 :: 		numbers[(time.seconds / 10)]);
	MOVLW       10
	MOVWF       R4 
	MOVF        _time+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVLW       _numbers+0
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_numbers+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_numbers+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_SEGMENT7_vidDisplayDigit+0
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;microwave.c,61 :: 		Delay_us(2500);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       61
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
	NOP
;microwave.c,51 :: 		for (u8Index = 0; u8Index < 200; u8Index += 1)
	INCF        main_u8Index_L0+0, 1 
;microwave.c,62 :: 		}
	GOTO        L_main2
L_main3:
;microwave.c,63 :: 		time.seconds -= 1;
	DECF        _time+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _time+0 
;microwave.c,64 :: 		}
	GOTO        L_main0
L_main1:
;microwave.c,65 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
