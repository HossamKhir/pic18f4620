
uwave_display_vidGetTimeDigits:

;uwave_display.c,9 :: 		vidGetTimeDigits(HeatingTimeRef timeoutRef)
;uwave_display.c,11 :: 		u8SecondsUnits = (timeoutRef->u8Seconds) % 10;
	MOVFF       FARG_uwave_display_vidGetTimeDigits_timeoutRef+0, FSR0
	MOVFF       FARG_uwave_display_vidGetTimeDigits_timeoutRef+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       10
	MOVWF       R4 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _u8SecondsUnits+0 
;uwave_display.c,12 :: 		u8SecondsTens  = (timeoutRef->u8Seconds) / 10;
	MOVFF       FARG_uwave_display_vidGetTimeDigits_timeoutRef+0, FSR0
	MOVFF       FARG_uwave_display_vidGetTimeDigits_timeoutRef+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       10
	MOVWF       R4 
	CALL        _Div_8x8_U+0, 0
	MOVF        R0, 0 
	MOVWF       _u8SecondsTens+0 
;uwave_display.c,13 :: 		u8MinutesUnits = (timeoutRef->u8Minutes) % 10;
	MOVLW       1
	ADDWF       FARG_uwave_display_vidGetTimeDigits_timeoutRef+0, 0 
	MOVWF       FLOC_uwave_display_vidGetTimeDigits+0 
	MOVLW       0
	ADDWFC      FARG_uwave_display_vidGetTimeDigits_timeoutRef+1, 0 
	MOVWF       FLOC_uwave_display_vidGetTimeDigits+1 
	MOVFF       FLOC_uwave_display_vidGetTimeDigits+0, FSR0
	MOVFF       FLOC_uwave_display_vidGetTimeDigits+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       10
	MOVWF       R4 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _u8MinutesUnits+0 
;uwave_display.c,14 :: 		u8MinutesTens  = (timeoutRef->u8Minutes) / 10;
	MOVFF       FLOC_uwave_display_vidGetTimeDigits+0, FSR0
	MOVFF       FLOC_uwave_display_vidGetTimeDigits+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       10
	MOVWF       R4 
	CALL        _Div_8x8_U+0, 0
	MOVF        R0, 0 
	MOVWF       _u8MinutesTens+0 
;uwave_display.c,15 :: 		}
L_end_vidGetTimeDigits:
	RETURN      0
; end of uwave_display_vidGetTimeDigits

_UWAVE_DISPLAY_vidUpdateTimeDisplay:

;uwave_display.c,18 :: 		UWAVE_DISPLAY_vidUpdateTimeDisplay(HeatingTimeRef timeoutRef)
;uwave_display.c,21 :: 		vidGetTimeDigits(timeoutRef);
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_timeoutRef+0, 0 
	MOVWF       FARG_uwave_display_vidGetTimeDigits_timeoutRef+0 
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_timeoutRef+1, 0 
	MOVWF       FARG_uwave_display_vidGetTimeDigits_timeoutRef+1 
	CALL        uwave_display_vidGetTimeDigits+0, 0
;uwave_display.c,23 :: 		SEGMENT7_vidDisplayDigit(MASK_SECONDS_UNITS, u8SecondsUnits);
	MOVLW       32
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        _u8SecondsUnits+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,24 :: 		Delay_us(1250);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       61
	MOVWF       R13, 0
L_UWAVE_DISPLAY_vidUpdateTimeDisplay0:
	DECFSZ      R13, 1, 1
	BRA         L_UWAVE_DISPLAY_vidUpdateTimeDisplay0
	DECFSZ      R12, 1, 1
	BRA         L_UWAVE_DISPLAY_vidUpdateTimeDisplay0
	NOP
	NOP
;uwave_display.c,25 :: 		SEGMENT7_vidDisplayDigit(MASK_SECONDS_TENS, u8SecondsTens);
	MOVLW       16
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        _u8SecondsTens+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,26 :: 		Delay_us(1250);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       61
	MOVWF       R13, 0
L_UWAVE_DISPLAY_vidUpdateTimeDisplay1:
	DECFSZ      R13, 1, 1
	BRA         L_UWAVE_DISPLAY_vidUpdateTimeDisplay1
	DECFSZ      R12, 1, 1
	BRA         L_UWAVE_DISPLAY_vidUpdateTimeDisplay1
	NOP
	NOP
;uwave_display.c,27 :: 		SEGMENT7_vidDisplayDigit(MASK_MINUTES_UNITS, u8MinutesUnits);
	MOVLW       8
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        _u8MinutesUnits+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,28 :: 		Delay_us(1250);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       61
	MOVWF       R13, 0
L_UWAVE_DISPLAY_vidUpdateTimeDisplay2:
	DECFSZ      R13, 1, 1
	BRA         L_UWAVE_DISPLAY_vidUpdateTimeDisplay2
	DECFSZ      R12, 1, 1
	BRA         L_UWAVE_DISPLAY_vidUpdateTimeDisplay2
	NOP
	NOP
;uwave_display.c,29 :: 		SEGMENT7_vidDisplayDigit(MASK_MINUTES_TENS, u8MinutesTens);
	MOVLW       4
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        _u8MinutesTens+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,30 :: 		Delay_us(1250);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       61
	MOVWF       R13, 0
L_UWAVE_DISPLAY_vidUpdateTimeDisplay3:
	DECFSZ      R13, 1, 1
	BRA         L_UWAVE_DISPLAY_vidUpdateTimeDisplay3
	DECFSZ      R12, 1, 1
	BRA         L_UWAVE_DISPLAY_vidUpdateTimeDisplay3
	NOP
	NOP
;uwave_display.c,31 :: 		}
L_end_UWAVE_DISPLAY_vidUpdateTimeDisplay:
	RETURN      0
; end of _UWAVE_DISPLAY_vidUpdateTimeDisplay
