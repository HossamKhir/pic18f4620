
uwave_display_vidGetTimeDigits:

;uwave_display.c,13 :: 		vidGetTimeDigits(uint32 u32Time)
;uwave_display.c,15 :: 		u8MinutesTens   = u32Time / 1000;
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_uwave_display_vidGetTimeDigits_u32Time+0, 0 
	MOVWF       R0 
	MOVF        FARG_uwave_display_vidGetTimeDigits_u32Time+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       uwave_display_u8MinutesTens+0 
;uwave_display.c,16 :: 		u8MinutesUnits  = (u32Time % 1000) / 100;
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_uwave_display_vidGetTimeDigits_u32Time+0, 0 
	MOVWF       R0 
	MOVF        FARG_uwave_display_vidGetTimeDigits_u32Time+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       uwave_display_u8MinutesUnits+0 
;uwave_display.c,17 :: 		u8SecondsTens   = (u32Time % 100) / 10;
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_uwave_display_vidGetTimeDigits_u32Time+0, 0 
	MOVWF       R0 
	MOVF        FARG_uwave_display_vidGetTimeDigits_u32Time+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FLOC_uwave_display_vidGetTimeDigits+0 
	MOVF        R1, 0 
	MOVWF       FLOC_uwave_display_vidGetTimeDigits+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC_uwave_display_vidGetTimeDigits+0, 0 
	MOVWF       R0 
	MOVF        FLOC_uwave_display_vidGetTimeDigits+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       uwave_display_u8SecondsTens+0 
;uwave_display.c,18 :: 		u8SecondsUnits  = (u32Time % 100) % 10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC_uwave_display_vidGetTimeDigits+0, 0 
	MOVWF       R0 
	MOVF        FLOC_uwave_display_vidGetTimeDigits+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       uwave_display_u8SecondsUnits+0 
;uwave_display.c,19 :: 		}
L_end_vidGetTimeDigits:
	RETURN      0
; end of uwave_display_vidGetTimeDigits

_UWAVE_DISPLAY_vidUpdateTimeDisplay:

;uwave_display.c,22 :: 		UWAVE_DISPLAY_vidUpdateTimeDisplay(uint32 u32Time)
;uwave_display.c,25 :: 		vidGetTimeDigits(u32Time);
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_u32Time+0, 0 
	MOVWF       FARG_uwave_display_vidGetTimeDigits_u32Time+0 
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_u32Time+1, 0 
	MOVWF       FARG_uwave_display_vidGetTimeDigits_u32Time+1 
	CALL        uwave_display_vidGetTimeDigits+0, 0
;uwave_display.c,27 :: 		switch (u8CurrentCursor)
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay0
;uwave_display.c,29 :: 		case 0:
L_UWAVE_DISPLAY_vidUpdateTimeDisplay2:
;uwave_display.c,30 :: 		SEGMENT7_vidDisplayDigit(MASK_SECONDS_UNITS, u8SecondsUnits);
	MOVLW       32
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        uwave_display_u8SecondsUnits+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,31 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay1
;uwave_display.c,32 :: 		case 1:
L_UWAVE_DISPLAY_vidUpdateTimeDisplay3:
;uwave_display.c,33 :: 		SEGMENT7_vidDisplayDigit(MASK_SECONDS_TENS, u8SecondsTens);
	MOVLW       16
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        uwave_display_u8SecondsTens+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,34 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay1
;uwave_display.c,35 :: 		case 2:
L_UWAVE_DISPLAY_vidUpdateTimeDisplay4:
;uwave_display.c,36 :: 		SEGMENT7_vidDisplayDigit(MASK_MINUTES_UNITS, u8MinutesUnits);
	MOVLW       8
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        uwave_display_u8MinutesUnits+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,37 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay1
;uwave_display.c,38 :: 		case 3:
L_UWAVE_DISPLAY_vidUpdateTimeDisplay5:
;uwave_display.c,39 :: 		SEGMENT7_vidDisplayDigit(MASK_MINUTES_TENS, u8MinutesTens);
	MOVLW       4
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        uwave_display_u8MinutesTens+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;uwave_display.c,40 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay1
;uwave_display.c,41 :: 		}
L_UWAVE_DISPLAY_vidUpdateTimeDisplay0:
	MOVF        uwave_display_u8CurrentCursor+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay2
	MOVF        uwave_display_u8CurrentCursor+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay3
	MOVF        uwave_display_u8CurrentCursor+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay4
	MOVF        uwave_display_u8CurrentCursor+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay5
L_UWAVE_DISPLAY_vidUpdateTimeDisplay1:
;uwave_display.c,43 :: 		u8CurrentCursor = (u8CurrentCursor < UWAVE_DISPLAY_CURSOR_LIMIT(u32Time))? (u8CurrentCursor + 1) : 0;
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_u32Time+0, 0 
	MOVWF       R0 
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_u32Time+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay6
	MOVLW       3
	MOVWF       FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+1 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay7
L_UWAVE_DISPLAY_vidUpdateTimeDisplay6:
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_u32Time+0, 0 
	MOVWF       R0 
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_u32Time+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay8
	MOVLW       2
	MOVWF       FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+0 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay9
L_UWAVE_DISPLAY_vidUpdateTimeDisplay8:
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_u32Time+0, 0 
	MOVWF       R0 
	MOVF        FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay_u32Time+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay10
	MOVLW       1
	MOVWF       R0 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay11
L_UWAVE_DISPLAY_vidUpdateTimeDisplay10:
	CLRF        R0 
L_UWAVE_DISPLAY_vidUpdateTimeDisplay11:
	MOVF        R0, 0 
	MOVWF       FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+0 
L_UWAVE_DISPLAY_vidUpdateTimeDisplay9:
	MOVF        FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+0, 0 
	MOVWF       FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+1 
L_UWAVE_DISPLAY_vidUpdateTimeDisplay7:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	BTFSC       FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+1, 7 
	MOVLW       127
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__UWAVE_DISPLAY_vidUpdateTimeDisplay22
	MOVF        FLOC__UWAVE_DISPLAY_vidUpdateTimeDisplay+1, 0 
	SUBWF       uwave_display_u8CurrentCursor+0, 0 
L__UWAVE_DISPLAY_vidUpdateTimeDisplay22:
	BTFSC       STATUS+0, 0 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay12
	MOVF        uwave_display_u8CurrentCursor+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_UWAVE_DISPLAY_vidUpdateTimeDisplay13
L_UWAVE_DISPLAY_vidUpdateTimeDisplay12:
	CLRF        R0 
	CLRF        R1 
L_UWAVE_DISPLAY_vidUpdateTimeDisplay13:
	MOVF        R0, 0 
	MOVWF       uwave_display_u8CurrentCursor+0 
;uwave_display.c,44 :: 		}
L_end_UWAVE_DISPLAY_vidUpdateTimeDisplay:
	RETURN      0
; end of _UWAVE_DISPLAY_vidUpdateTimeDisplay

_UWAVE_DISPLAY_vidDisplayEnd:

;uwave_display.c,47 :: 		UWAVE_DISPLAY_vidDisplayEnd(void)
;uwave_display.c,50 :: 		switch (u8CurrentCursor++)
	MOVF        uwave_display_u8CurrentCursor+0, 0 
	MOVWF       FLOC__UWAVE_DISPLAY_vidDisplayEnd+0 
	INCF        uwave_display_u8CurrentCursor+0, 1 
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd14
;uwave_display.c,52 :: 		case 0:
L_UWAVE_DISPLAY_vidDisplayEnd16:
;uwave_display.c,53 :: 		SEGMENT7_vidDisplayFigure(MASK_MINUTES_UNITS, UWAVE_DISPLAY_E);
	MOVLW       8
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	MOVLW       134
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	CALL        _SEGMENT7_vidDisplayFigure+0, 0
;uwave_display.c,54 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd15
;uwave_display.c,55 :: 		case 1:
L_UWAVE_DISPLAY_vidDisplayEnd17:
;uwave_display.c,56 :: 		SEGMENT7_vidDisplayFigure(MASK_SECONDS_TENS, UWAVE_DISPLAY_N);
	MOVLW       16
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	MOVLW       171
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	CALL        _SEGMENT7_vidDisplayFigure+0, 0
;uwave_display.c,57 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd15
;uwave_display.c,58 :: 		case 2:
L_UWAVE_DISPLAY_vidDisplayEnd18:
;uwave_display.c,59 :: 		SEGMENT7_vidDisplayFigure(MASK_SECONDS_UNITS, UWAVE_DISPLAY_D);
	MOVLW       32
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	MOVLW       161
	MOVWF       FARG_SEGMENT7_vidDisplayFigure+0 
	CALL        _SEGMENT7_vidDisplayFigure+0, 0
;uwave_display.c,60 :: 		break;
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd15
;uwave_display.c,61 :: 		default:
L_UWAVE_DISPLAY_vidDisplayEnd19:
;uwave_display.c,62 :: 		u8CurrentCursor = 0;
	CLRF        uwave_display_u8CurrentCursor+0 
;uwave_display.c,63 :: 		}
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd15
L_UWAVE_DISPLAY_vidDisplayEnd14:
	MOVF        FLOC__UWAVE_DISPLAY_vidDisplayEnd+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd16
	MOVF        FLOC__UWAVE_DISPLAY_vidDisplayEnd+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd17
	MOVF        FLOC__UWAVE_DISPLAY_vidDisplayEnd+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd18
	GOTO        L_UWAVE_DISPLAY_vidDisplayEnd19
L_UWAVE_DISPLAY_vidDisplayEnd15:
;uwave_display.c,64 :: 		}
L_end_UWAVE_DISPLAY_vidDisplayEnd:
	RETURN      0
; end of _UWAVE_DISPLAY_vidDisplayEnd
