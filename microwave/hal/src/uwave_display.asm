
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
;uwave_display.c,22 :: 		vidGetTimeDigits(timeoutRef);
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_timeoutRef+0, 0 
	MOVWF       FARG_uwave_display_vidGetTimeDigits_timeoutRef+0 
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_timeoutRef+1, 0 
	MOVWF       FARG_uwave_display_vidGetTimeDigits_timeoutRef+1 
	CALL        uwave_display_vidGetTimeDigits+0, 0
;uwave_display.c,24 :: 		switch (u8CurrentCursor++)
	MOVF        UWAVE_DISPLAY_vidUpdateTimeDisplay_u8CurrentCursor_L0+0, 0 
	MOVWF       FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+0 
	INCF        UWAVE_DISPLAY_vidUpdateTimeDisplay_u8CurrentCursor_L0+0, 1 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay0
;uwave_display.c,26 :: 		case 0:
L_UWAVE_DISPLAY_vidUpdateTimeDisplay2:
;uwave_display.c,27 :: 		SEGMENT7_vidDisplayDigit(MASK_SECONDS_UNITS, u8SecondsUnits);
	MOVLW       32
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        _u8SecondsUnits+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,28 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay1
;uwave_display.c,29 :: 		case 1:
L_UWAVE_DISPLAY_vidUpdateTimeDisplay3:
;uwave_display.c,30 :: 		SEGMENT7_vidDisplayDigit(MASK_SECONDS_TENS, u8SecondsTens);
	MOVLW       16
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        _u8SecondsTens+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,31 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay1
;uwave_display.c,32 :: 		case 2:
L_UWAVE_DISPLAY_vidUpdateTimeDisplay4:
;uwave_display.c,33 :: 		SEGMENT7_vidDisplayDigit(MASK_MINUTES_UNITS, u8MinutesUnits);
	MOVLW       8
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        _u8MinutesUnits+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,34 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay1
;uwave_display.c,35 :: 		case 3:
L_UWAVE_DISPLAY_vidUpdateTimeDisplay5:
;uwave_display.c,36 :: 		SEGMENT7_vidDisplayDigit(MASK_MINUTES_TENS, u8MinutesTens);
	MOVLW       4
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        _u8MinutesTens+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,37 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay1
;uwave_display.c,38 :: 		default:
L_UWAVE_DISPLAY_vidUpdateTimeDisplay6:
;uwave_display.c,39 :: 		u8CurrentCursor = 0;
	CLRF        UWAVE_DISPLAY_vidUpdateTimeDisplay_u8CurrentCursor_L0+0 
;uwave_display.c,40 :: 		}
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay1
L_UWAVE_DISPLAY_vidUpdateTimeDisplay0:
	MOVF        FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay2
	MOVF        FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay3
	MOVF        FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay4
	MOVF        FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay5
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay6
L_UWAVE_DISPLAY_vidUpdateTimeDisplay1:
;uwave_display.c,42 :: 		}
L_end_UWAVE_DISPLAY_vidUpdateTimeDisplay:
	RETURN      0
; end of _UWAVE_DISPLAY_vidUpdateTimeDisplay

_UWAVE_DISPLAY_vidDisplayEnd:

;uwave_display.c,45 :: 		UWAVE_DISPLAY_vidDisplayEnd(void)
;uwave_display.c,49 :: 		switch (u8CurrentCursor++)
	MOVF        UWAVE_DISPLAY_vidDisplayEnd_u8CurrentCursor_L0+0, 0 
	MOVWF       FLOC__UWAVE_DISPLAY_vidDisplayEnd+0 
	INCF        UWAVE_DISPLAY_vidDisplayEnd_u8CurrentCursor_L0+0, 1 
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd7
;uwave_display.c,51 :: 		case 0:
L_UWAVE_DISPLAY_vidDisplayEnd9:
;uwave_display.c,52 :: 		SEGMENT7_vidDisplayFigure(MASK_MINUTES_UNITS, UWAVE_DISPLAY_E);
	MOVLW       8
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	MOVLW       134
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	CALL        _SEGMENT7_vidDisplayFigure+0, 0
;uwave_display.c,53 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd8
;uwave_display.c,54 :: 		case 1:
L_UWAVE_DISPLAY_vidDisplayEnd10:
;uwave_display.c,55 :: 		SEGMENT7_vidDisplayFigure(MASK_SECONDS_TENS, UWAVE_DISPLAY_N);
	MOVLW       16
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	MOVLW       171
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	CALL        _SEGMENT7_vidDisplayFigure+0, 0
;uwave_display.c,56 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd8
;uwave_display.c,57 :: 		case 2:
L_UWAVE_DISPLAY_vidDisplayEnd11:
;uwave_display.c,58 :: 		SEGMENT7_vidDisplayFigure(MASK_SECONDS_UNITS, UWAVE_DISPLAY_D);
	MOVLW       32
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	MOVLW       161
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	CALL        _SEGMENT7_vidDisplayFigure+0, 0
;uwave_display.c,59 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd8
;uwave_display.c,60 :: 		default:
L_UWAVE_DISPLAY_vidDisplayEnd12:
;uwave_display.c,61 :: 		u8CurrentCursor = 0;
	CLRF        UWAVE_DISPLAY_vidDisplayEnd_u8CurrentCursor_L0+0 
;uwave_display.c,62 :: 		}
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd8
L_UWAVE_DISPLAY_vidDisplayEnd7:
	MOVF        FLOC__UWAVE_DISPLAY_vidDisplayEnd+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd9
	MOVF        FLOC__UWAVE_DISPLAY_vidDisplayEnd+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd10
	MOVF        FLOC__UWAVE_DISPLAY_vidDisplayEnd+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd11
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd12
L_UWAVE_DISPLAY_vidDisplayEnd8:
;uwave_display.c,63 :: 		}
L_end_UWAVE_DISPLAY_vidDisplayEnd:
	RETURN      0
; end of _UWAVE_DISPLAY_vidDisplayEnd
