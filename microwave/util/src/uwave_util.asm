
_UWAVE_UTIL_vidUpdateTime:

;uwave_util.c,4 :: 		UWAVE_UTIL_vidUpdateTime(HeatingTimeRef timeout)
;uwave_util.c,6 :: 		timeout->u8Seconds = timeout->u16TimeDisplay % 100;
	MOVF        FARG_UWAVE_UTIL_vidUpdateTime_timeout+0, 0 
	MOVWF       FLOC__UWAVE_UTIL_vidUpdateTime+0 
	MOVF        FARG_UWAVE_UTIL_vidUpdateTime_timeout+1, 0 
	MOVWF       FLOC__UWAVE_UTIL_vidUpdateTime+1 
	MOVLW       2
	ADDWF       FARG_UWAVE_UTIL_vidUpdateTime_timeout+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_UWAVE_UTIL_vidUpdateTime_timeout+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       100
	MOVWF       R4 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVFF       FLOC__UWAVE_UTIL_vidUpdateTime+0, FSR1
	MOVFF       FLOC__UWAVE_UTIL_vidUpdateTime+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;uwave_util.c,7 :: 		timeout->u8Minutes = timeout->u16TimeDisplay / 100;
	MOVLW       1
	ADDWF       FARG_UWAVE_UTIL_vidUpdateTime_timeout+0, 0 
	MOVWF       FLOC__UWAVE_UTIL_vidUpdateTime+0 
	MOVLW       0
	ADDWFC      FARG_UWAVE_UTIL_vidUpdateTime_timeout+1, 0 
	MOVWF       FLOC__UWAVE_UTIL_vidUpdateTime+1 
	MOVLW       2
	ADDWF       FARG_UWAVE_UTIL_vidUpdateTime_timeout+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_UWAVE_UTIL_vidUpdateTime_timeout+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       100
	MOVWF       R4 
	CALL        _Div_8x8_U+0, 0
	MOVFF       FLOC__UWAVE_UTIL_vidUpdateTime+0, FSR1
	MOVFF       FLOC__UWAVE_UTIL_vidUpdateTime+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;uwave_util.c,8 :: 		}
L_end_UWAVE_UTIL_vidUpdateTime:
	RETURN      0
; end of _UWAVE_UTIL_vidUpdateTime

_UWAVE_UTIL_vidSetTime:

;uwave_util.c,11 :: 		UWAVE_UTIL_vidSetTime(HeatingTimeRef timeout, uint16 u16Time)
;uwave_util.c,13 :: 		timeout->u16TimeDisplay = u16Time % 10000;
	MOVLW       2
	ADDWF       FARG_UWAVE_UTIL_vidSetTime_timeout+0, 0 
	MOVWF       FLOC__UWAVE_UTIL_vidSetTime+0 
	MOVLW       0
	ADDWFC      FARG_UWAVE_UTIL_vidSetTime_timeout+1, 0 
	MOVWF       FLOC__UWAVE_UTIL_vidSetTime+1 
	MOVLW       16
	MOVWF       R4 
	MOVLW       39
	MOVWF       R5 
	MOVF        FARG_UWAVE_UTIL_vidSetTime_u16Time+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVFF       FLOC__UWAVE_UTIL_vidSetTime+0, FSR1
	MOVFF       FLOC__UWAVE_UTIL_vidSetTime+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;uwave_util.c,14 :: 		UWAVE_UTIL_vidUpdateTime(timeout);
	MOVF        FARG_UWAVE_UTIL_vidSetTime_timeout+0, 0 
	MOVWF       FARG_UWAVE_UTIL_vidUpdateTime_timeout+0 
	MOVF        FARG_UWAVE_UTIL_vidSetTime_timeout+1, 0 
	MOVWF       FARG_UWAVE_UTIL_vidUpdateTime_timeout+1 
	CALL        _UWAVE_UTIL_vidUpdateTime+0, 0
;uwave_util.c,15 :: 		}
L_end_UWAVE_UTIL_vidSetTime:
	RETURN      0
; end of _UWAVE_UTIL_vidSetTime

_UWAVE_UTIL_u8DecrementTime:

;uwave_util.c,19 :: 		UWAVE_UTIL_u8DecrementTime(HeatingTimeRef timeoutRef)
;uwave_util.c,21 :: 		if (timeoutRef->u8Seconds == 0)
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+0, FSR0
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_u8DecrementTime0
;uwave_util.c,23 :: 		if (timeoutRef->u8Minutes > 0)
	MOVLW       1
	ADDWF       FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_UWAVE_UTIL_u8DecrementTime1
;uwave_util.c,25 :: 		timeoutRef->u8Minutes -= 1;
	MOVLW       1
	ADDWF       FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+1, 0 
	MOVWF       R2 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	DECF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;uwave_util.c,26 :: 		timeoutRef->u8Seconds = 59;
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+0, FSR1
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+1, FSR1H
	MOVLW       59
	MOVWF       POSTINC1+0 
;uwave_util.c,27 :: 		}
	GOTO        L_UWAVE_UTIL_u8DecrementTime2
L_UWAVE_UTIL_u8DecrementTime1:
;uwave_util.c,30 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_UWAVE_UTIL_u8DecrementTime
;uwave_util.c,31 :: 		}
L_UWAVE_UTIL_u8DecrementTime2:
;uwave_util.c,32 :: 		}
	GOTO        L_UWAVE_UTIL_u8DecrementTime3
L_UWAVE_UTIL_u8DecrementTime0:
;uwave_util.c,35 :: 		timeoutRef->u8Seconds -= 1;
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+0, FSR0
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+0, FSR1
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_timeoutRef+1, FSR1H
	DECF        R0, 0 
	MOVWF       POSTINC1+0 
;uwave_util.c,36 :: 		}
L_UWAVE_UTIL_u8DecrementTime3:
;uwave_util.c,37 :: 		return 0;
	CLRF        R0 
;uwave_util.c,38 :: 		}
L_end_UWAVE_UTIL_u8DecrementTime:
	RETURN      0
; end of _UWAVE_UTIL_u8DecrementTime
