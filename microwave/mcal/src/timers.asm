
timers_TIMERS_vidSetScale:

;timers.c,17 :: 		enPostscale postscale)
;timers.c,19 :: 		switch (timerID)
	GOTO        L_timers_TIMERS_vidSetScale0
;timers.c,21 :: 		case TIMER0:
L_timers_TIMERS_vidSetScale2:
;timers.c,22 :: 		GET_TMR_CTRL_REG(TIMER0)   |=  (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
	MOVLW       18
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       _u16Prescaler+0
	ADDWF       R0, 0 
	MOVWF       R5 
	MOVLW       hi_addr(_u16Prescaler+0)
	ADDWFC      R1, 0 
	MOVWF       R6 
	MOVLW       higher_addr(_u16Prescaler+0)
	ADDWFC      R2, 0 
	MOVWF       R7 
	MOVF        FARG_timers_TIMERS_vidSetScale_prescale+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        R6, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        R7, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R3
	MOVLW       1
	ANDWF       FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       R1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L_timers_TIMERS_vidSetScale25:
	BZ          L_timers_TIMERS_vidSetScale26
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L_timers_TIMERS_vidSetScale25
L_timers_TIMERS_vidSetScale26:
	MOVF        R0, 0 
	IORWF       T0CON+0, 1 
;timers.c,23 :: 		break;
	GOTO        L_timers_TIMERS_vidSetScale1
;timers.c,24 :: 		case TIMER1:
L_timers_TIMERS_vidSetScale3:
;timers.c,25 :: 		GET_TMR_CTRL_REG(TIMER1)   |=  (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
	MOVLW       18
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       _u16Prescaler+0
	ADDWF       R0, 0 
	MOVWF       R5 
	MOVLW       hi_addr(_u16Prescaler+0)
	ADDWFC      R1, 0 
	MOVWF       R6 
	MOVLW       higher_addr(_u16Prescaler+0)
	ADDWFC      R2, 0 
	MOVWF       R7 
	MOVF        FARG_timers_TIMERS_vidSetScale_prescale+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        R6, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        R7, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R3
	MOVLW       1
	ANDWF       FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       R1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L_timers_TIMERS_vidSetScale27:
	BZ          L_timers_TIMERS_vidSetScale28
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L_timers_TIMERS_vidSetScale27
L_timers_TIMERS_vidSetScale28:
	MOVF        R0, 0 
	IORWF       T1CON+0, 1 
;timers.c,26 :: 		break;
	GOTO        L_timers_TIMERS_vidSetScale1
;timers.c,27 :: 		case TIMER2:
L_timers_TIMERS_vidSetScale4:
;timers.c,28 :: 		GET_TMR_CTRL_REG(TIMER2)   |=  (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
	MOVLW       18
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       _u16Prescaler+0
	ADDWF       R0, 0 
	MOVWF       R5 
	MOVLW       hi_addr(_u16Prescaler+0)
	ADDWFC      R1, 0 
	MOVWF       R6 
	MOVLW       higher_addr(_u16Prescaler+0)
	ADDWFC      R2, 0 
	MOVWF       R7 
	MOVF        FARG_timers_TIMERS_vidSetScale_prescale+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        R6, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        R7, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R3
	MOVLW       1
	ANDWF       FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       R1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L_timers_TIMERS_vidSetScale29:
	BZ          L_timers_TIMERS_vidSetScale30
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L_timers_TIMERS_vidSetScale29
L_timers_TIMERS_vidSetScale30:
	MOVF        R0, 0 
	IORWF       T2CON+0, 1 
;timers.c,29 :: 		GET_TMR_CTRL_REG(TIMER2)    |=  (postscale << 3);
	MOVF        FARG_timers_TIMERS_vidSetScale_postscale+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	IORWF       T2CON+0, 1 
;timers.c,30 :: 		break;
	GOTO        L_timers_TIMERS_vidSetScale1
;timers.c,31 :: 		case TIMER3:
L_timers_TIMERS_vidSetScale5:
;timers.c,32 :: 		GET_TMR_CTRL_REG(TIMER3)   |=  (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
	MOVLW       18
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       _u16Prescaler+0
	ADDWF       R0, 0 
	MOVWF       R5 
	MOVLW       hi_addr(_u16Prescaler+0)
	ADDWFC      R1, 0 
	MOVWF       R6 
	MOVLW       higher_addr(_u16Prescaler+0)
	ADDWFC      R2, 0 
	MOVWF       R7 
	MOVF        FARG_timers_TIMERS_vidSetScale_prescale+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        R6, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        R7, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R3
	MOVLW       1
	ANDWF       FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       R1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L_timers_TIMERS_vidSetScale31:
	BZ          L_timers_TIMERS_vidSetScale32
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L_timers_TIMERS_vidSetScale31
L_timers_TIMERS_vidSetScale32:
	MOVF        R0, 0 
	IORWF       T3CON+0, 1 
;timers.c,33 :: 		break;
	GOTO        L_timers_TIMERS_vidSetScale1
;timers.c,34 :: 		}
L_timers_TIMERS_vidSetScale0:
	MOVF        FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_timers_TIMERS_vidSetScale2
	MOVF        FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_timers_TIMERS_vidSetScale3
	MOVF        FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_timers_TIMERS_vidSetScale4
	MOVF        FARG_timers_TIMERS_vidSetScale_timerID+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_timers_TIMERS_vidSetScale5
L_timers_TIMERS_vidSetScale1:
;timers.c,35 :: 		}
L_end_TIMERS_vidSetScale:
	RETURN      0
; end of timers_TIMERS_vidSetScale

_TIMERS_vidInitTimer:

;timers.c,43 :: 		)
;timers.c,45 :: 		u64TargetTime = GET_TIME_IN_USEC(u64TargetTime,u64TimeUnit);
	MOVF        FARG_TIMERS_vidInitTimer_u64TargetTime+0, 0 
	MOVWF       R0 
	MOVF        FARG_TIMERS_vidInitTimer_u64TargetTime+1, 0 
	MOVWF       R1 
	MOVF        FARG_TIMERS_vidInitTimer_u64TargetTime+2, 0 
	MOVWF       R2 
	MOVF        FARG_TIMERS_vidInitTimer_u64TargetTime+3, 0 
	MOVWF       R3 
	MOVF        FARG_TIMERS_vidInitTimer_u64TimeUnit+0, 0 
	MOVWF       R4 
	MOVF        FARG_TIMERS_vidInitTimer_u64TimeUnit+1, 0 
	MOVWF       R5 
	MOVF        FARG_TIMERS_vidInitTimer_u64TimeUnit+2, 0 
	MOVWF       R6 
	MOVF        FARG_TIMERS_vidInitTimer_u64TimeUnit+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_TIMERS_vidInitTimer_u64TargetTime+0 
	MOVF        R1, 0 
	MOVWF       FARG_TIMERS_vidInitTimer_u64TargetTime+1 
	MOVF        R2, 0 
	MOVWF       FARG_TIMERS_vidInitTimer_u64TargetTime+2 
	MOVF        R3, 0 
	MOVWF       FARG_TIMERS_vidInitTimer_u64TargetTime+3 
;timers.c,46 :: 		TIMERS_vidUpdateInitialCount(u64TargetTime, timerID, prescale, postscale);
	MOVF        R0, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+0 
	MOVF        R1, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+1 
	MOVF        R2, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+2 
	MOVF        R3, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+3 
	MOVF        FARG_TIMERS_vidInitTimer_timerID+0, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+0 
	MOVF        FARG_TIMERS_vidInitTimer_prescale+0, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+0 
	MOVF        FARG_TIMERS_vidInitTimer_postscale+0, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+0 
	CALL        _TIMERS_vidUpdateInitialCount+0, 0
;timers.c,47 :: 		TIMERS_vidSetScale(timerID, prescale, postscale);
	MOVF        FARG_TIMERS_vidInitTimer_timerID+0, 0 
	MOVWF       FARG_timers_TIMERS_vidSetScale_timerID+0 
	MOVF        FARG_TIMERS_vidInitTimer_prescale+0, 0 
	MOVWF       FARG_timers_TIMERS_vidSetScale_prescale+0 
	MOVF        FARG_TIMERS_vidInitTimer_postscale+0, 0 
	MOVWF       FARG_timers_TIMERS_vidSetScale_postscale+0 
	CALL        timers_TIMERS_vidSetScale+0, 0
;timers.c,48 :: 		TIMERS_vidResetTimer(timerID);
	MOVF        FARG_TIMERS_vidInitTimer_timerID+0, 0 
	MOVWF       FARG_TIMERS_vidResetTimer+0 
	CALL        _TIMERS_vidResetTimer+0, 0
;timers.c,49 :: 		}
L_end_TIMERS_vidInitTimer:
	RETURN      0
; end of _TIMERS_vidInitTimer

_TIMERS_vidUpdateInitialCount:

;timers.c,56 :: 		)
;timers.c,58 :: 		switch (timerID)
	GOTO        L_TIMERS_vidUpdateInitialCount6
;timers.c,60 :: 		case TIMER0:
L_TIMERS_vidUpdateInitialCount8:
;timers.c,61 :: 		case TIMER1:
L_TIMERS_vidUpdateInitialCount9:
;timers.c,62 :: 		case TIMER3:
L_TIMERS_vidUpdateInitialCount10:
;timers.c,63 :: 		u64InitialCount = (FULL_COUNT + 1) - (uint64)(u64TargetTime / (CYCLE_PERIOD * (double)u16Prescaler[timerID][prescale][1]));
	MOVLW       18
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_timerID+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       _u16Prescaler+0
	ADDWF       R0, 0 
	MOVWF       R5 
	MOVLW       hi_addr(_u16Prescaler+0)
	ADDWFC      R1, 0 
	MOVWF       R6 
	MOVLW       higher_addr(_u16Prescaler+0)
	ADDWFC      R2, 0 
	MOVWF       R7 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_prescale+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        R5, 0 
	ADDWF       R0, 1 
	MOVF        R6, 0 
	ADDWFC      R1, 1 
	MOVF        R7, 0 
	ADDWFC      R2, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	CALL        _Byte2Double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+0 
	MOVF        R1, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+1 
	MOVF        R2, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+2 
	MOVF        R3, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+3 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_u64TargetTime+0, 0 
	MOVWF       R0 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_u64TargetTime+1, 0 
	MOVWF       R1 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_u64TargetTime+2, 0 
	MOVWF       R2 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_u64TargetTime+3, 0 
	MOVWF       R3 
	CALL        _Longword2Double+0, 0
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+0, 0 
	MOVWF       R4 
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+1, 0 
	MOVWF       R5 
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+2, 0 
	MOVWF       R6 
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+3, 0 
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _Double2Longword+0, 0
	MOVLW       0
	MOVWF       _u64InitialCount+0 
	MOVLW       0
	MOVWF       _u64InitialCount+1 
	MOVLW       1
	MOVWF       _u64InitialCount+2 
	MOVLW       0
	MOVWF       _u64InitialCount+3 
	MOVF        R0, 0 
	SUBWF       _u64InitialCount+0, 1 
	MOVF        R1, 0 
	SUBWFB      _u64InitialCount+1, 1 
	MOVF        R2, 0 
	SUBWFB      _u64InitialCount+2, 1 
	MOVF        R3, 0 
	SUBWFB      _u64InitialCount+3, 1 
;timers.c,64 :: 		break;
	GOTO        L_TIMERS_vidUpdateInitialCount7
;timers.c,65 :: 		case TIMER2:
L_TIMERS_vidUpdateInitialCount11:
;timers.c,66 :: 		u64InitialCount = (uint64)(u64TargetTime / (CYCLE_PERIOD * (double)u16Prescaler[timerID][prescale][1] * (postscale + 1)));
	MOVLW       18
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_timerID+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       _u16Prescaler+0
	ADDWF       R0, 0 
	MOVWF       R5 
	MOVLW       hi_addr(_u16Prescaler+0)
	ADDWFC      R1, 0 
	MOVWF       R6 
	MOVLW       higher_addr(_u16Prescaler+0)
	ADDWFC      R2, 0 
	MOVWF       R7 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_prescale+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        R5, 0 
	ADDWF       R0, 1 
	MOVF        R6, 0 
	ADDWFC      R1, 1 
	MOVF        R7, 0 
	ADDWFC      R2, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	CALL        _Byte2Double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+0 
	MOVF        R1, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+1 
	MOVF        R2, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+2 
	MOVF        R3, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+3 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_postscale+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	CALL        _Int2Double+0, 0
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+0, 0 
	MOVWF       R4 
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+1, 0 
	MOVWF       R5 
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+2, 0 
	MOVWF       R6 
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+0 
	MOVF        R1, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+1 
	MOVF        R2, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+2 
	MOVF        R3, 0 
	MOVWF       FLOC__TIMERS_vidUpdateInitialCount+3 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_u64TargetTime+0, 0 
	MOVWF       R0 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_u64TargetTime+1, 0 
	MOVWF       R1 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_u64TargetTime+2, 0 
	MOVWF       R2 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_u64TargetTime+3, 0 
	MOVWF       R3 
	CALL        _Longword2Double+0, 0
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+0, 0 
	MOVWF       R4 
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+1, 0 
	MOVWF       R5 
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+2, 0 
	MOVWF       R6 
	MOVF        FLOC__TIMERS_vidUpdateInitialCount+3, 0 
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _Double2Longword+0, 0
	MOVF        R0, 0 
	MOVWF       _u64InitialCount+0 
	MOVF        R1, 0 
	MOVWF       _u64InitialCount+1 
	MOVF        R2, 0 
	MOVWF       _u64InitialCount+2 
	MOVF        R3, 0 
	MOVWF       _u64InitialCount+3 
;timers.c,67 :: 		break;
	GOTO        L_TIMERS_vidUpdateInitialCount7
;timers.c,68 :: 		}
L_TIMERS_vidUpdateInitialCount6:
	MOVF        FARG_TIMERS_vidUpdateInitialCount_timerID+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidUpdateInitialCount8
	MOVF        FARG_TIMERS_vidUpdateInitialCount_timerID+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidUpdateInitialCount9
	MOVF        FARG_TIMERS_vidUpdateInitialCount_timerID+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidUpdateInitialCount10
	MOVF        FARG_TIMERS_vidUpdateInitialCount_timerID+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidUpdateInitialCount11
L_TIMERS_vidUpdateInitialCount7:
;timers.c,69 :: 		}
L_end_TIMERS_vidUpdateInitialCount:
	RETURN      0
; end of _TIMERS_vidUpdateInitialCount

_TIMERS_vidResetTimer:

;timers.c,72 :: 		TIMERS_vidResetTimer(enTimer timerID)
;timers.c,74 :: 		switch (timerID)
	GOTO        L_TIMERS_vidResetTimer12
;timers.c,76 :: 		case TIMER0:
L_TIMERS_vidResetTimer14:
;timers.c,77 :: 		FILL_TMR_REGS(TIMER0,u64InitialCount);
	MOVLW       255
	ANDWF       _u64InitialCount+0, 0 
	MOVWF       TMR0L+0 
	MOVF        _u64InitialCount+1, 0 
	MOVWF       R0 
	MOVF        _u64InitialCount+2, 0 
	MOVWF       R1 
	MOVF        _u64InitialCount+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR0H+0 
;timers.c,78 :: 		CLR_TMR_INT_FLAG(TIMER0);
	BCF         INTCON+0, 2 
;timers.c,79 :: 		break;
	GOTO        L_TIMERS_vidResetTimer13
;timers.c,80 :: 		case TIMER1:
L_TIMERS_vidResetTimer15:
;timers.c,81 :: 		FILL_TMR_REGS(TIMER1,u64InitialCount);
	MOVLW       255
	ANDWF       _u64InitialCount+0, 0 
	MOVWF       TMR1L+0 
	MOVF        _u64InitialCount+1, 0 
	MOVWF       R0 
	MOVF        _u64InitialCount+2, 0 
	MOVWF       R1 
	MOVF        _u64InitialCount+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;timers.c,82 :: 		CLR_TMR_INT_FLAG(TIMER1);
	BCF         INTCON+0, 0 
;timers.c,83 :: 		break;
	GOTO        L_TIMERS_vidResetTimer13
;timers.c,84 :: 		case TIMER3:
L_TIMERS_vidResetTimer16:
;timers.c,85 :: 		FILL_TMR_REGS(TIMER3,u64InitialCount);
	MOVLW       255
	ANDWF       _u64InitialCount+0, 0 
	MOVWF       TMR3L+0 
	MOVF        _u64InitialCount+1, 0 
	MOVWF       R0 
	MOVF        _u64InitialCount+2, 0 
	MOVWF       R1 
	MOVF        _u64InitialCount+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR3H+0 
;timers.c,86 :: 		CLR_TMR_INT_FLAG(TIMER3);
	BCF         INTCON+0, 1 
;timers.c,87 :: 		break;
	GOTO        L_TIMERS_vidResetTimer13
;timers.c,88 :: 		case TIMER2:
L_TIMERS_vidResetTimer17:
;timers.c,90 :: 		PR2 =   GET_TIME_REG_LOW(u64InitialCount);
	MOVLW       255
	ANDWF       _u64InitialCount+0, 0 
	MOVWF       PR2+0 
;timers.c,91 :: 		CLR_TMR_INT_FLAG(TIMER2);
	BCF         INTCON+0, 1 
;timers.c,92 :: 		break;
	GOTO        L_TIMERS_vidResetTimer13
;timers.c,93 :: 		}
L_TIMERS_vidResetTimer12:
	MOVF        FARG_TIMERS_vidResetTimer_timerID+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidResetTimer14
	MOVF        FARG_TIMERS_vidResetTimer_timerID+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidResetTimer15
	MOVF        FARG_TIMERS_vidResetTimer_timerID+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidResetTimer16
	MOVF        FARG_TIMERS_vidResetTimer_timerID+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidResetTimer17
L_TIMERS_vidResetTimer13:
;timers.c,94 :: 		}
L_end_TIMERS_vidResetTimer:
	RETURN      0
; end of _TIMERS_vidResetTimer

_TIMERS_vidConfigTimerInterrupts:

;timers.c,97 :: 		TIMERS_vidConfigTimerInterrupts(enTimer timerID, enPriority priority)
;timers.c,99 :: 		INTERRUPT_vidInit();
	CALL        _INTERRUPT_vidInit+0, 0
;timers.c,101 :: 		switch(timerID)
	GOTO        L_TIMERS_vidConfigTimerInterrupts18
;timers.c,103 :: 		case TIMER0:
L_TIMERS_vidConfigTimerInterrupts20:
;timers.c,104 :: 		INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_TMR0,IntFlag_TMR0_CCP1_HLVD);
	BCF         INTCON+0, 2 
;timers.c,105 :: 		INTERRUPT_vidSetPriority(IntPr_TMR0_CCP1_HLVD, priority);
	MOVLW       2
	MOVWF       FARG_INTERRUPT_vidSetPriority+0 
	MOVF        FARG_TIMERS_vidConfigTimerInterrupts_priority+0, 0 
	MOVWF       FARG_INTERRUPT_vidSetPriority+0 
	CALL        _INTERRUPT_vidSetPriority+0, 0
;timers.c,106 :: 		INTERRUPT_ENABLE_SRC(INTERRUPT_REG_EN_TMR0,IntEn_TMR0_RX);
	BSF         INTCON+0, 5 
;timers.c,107 :: 		break;
	GOTO        L_TIMERS_vidConfigTimerInterrupts19
;timers.c,108 :: 		case TIMER1:
L_TIMERS_vidConfigTimerInterrupts21:
;timers.c,109 :: 		INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_TMR1_TMR2,IntFlag_RB_INT1_TMR1_CCP2);
	BCF         PIR1+0, 0 
;timers.c,110 :: 		INTERRUPT_vidSetPriority(IntPr_RB_TMR1_CCP2, priority);
	CLRF        FARG_INTERRUPT_vidSetPriority+0 
	MOVF        FARG_TIMERS_vidConfigTimerInterrupts_priority+0, 0 
	MOVWF       FARG_INTERRUPT_vidSetPriority+0 
	CALL        _INTERRUPT_vidSetPriority+0, 0
;timers.c,111 :: 		INTERRUPT_ENABLE_SRC(INTERRUPT_REG_EN_TMR1_TMR2,IntEn_TMR1_CCP2);
	BSF         PIE1+0, 0 
;timers.c,112 :: 		break;
	GOTO        L_TIMERS_vidConfigTimerInterrupts19
;timers.c,113 :: 		case TIMER2:
L_TIMERS_vidConfigTimerInterrupts22:
;timers.c,114 :: 		INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_TMR1_TMR2,IntFlag_INT0_INT2_TMR2_TMR3);
	BCF         PIR1+0, 1 
;timers.c,115 :: 		INTERRUPT_vidSetPriority(IntPr_TMR2_TMR3, priority);
	MOVLW       1
	MOVWF       FARG_INTERRUPT_vidSetPriority+0 
	MOVF        FARG_TIMERS_vidConfigTimerInterrupts_priority+0, 0 
	MOVWF       FARG_INTERRUPT_vidSetPriority+0 
	CALL        _INTERRUPT_vidSetPriority+0, 0
;timers.c,116 :: 		INTERRUPT_ENABLE_SRC(INTERRUPT_REG_EN_TMR1_TMR2,IntEn_TMR2_TMR3);
	BSF         PIE1+0, 1 
;timers.c,117 :: 		break;
	GOTO        L_TIMERS_vidConfigTimerInterrupts19
;timers.c,118 :: 		case TIMER3:
L_TIMERS_vidConfigTimerInterrupts23:
;timers.c,119 :: 		INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_TMR3,IntFlag_INT0_INT2_TMR2_TMR3);
	BCF         PIR2+0, 1 
;timers.c,120 :: 		INTERRUPT_vidSetPriority(IntPr_TMR2_TMR3, priority);
	MOVLW       1
	MOVWF       FARG_INTERRUPT_vidSetPriority+0 
	MOVF        FARG_TIMERS_vidConfigTimerInterrupts_priority+0, 0 
	MOVWF       FARG_INTERRUPT_vidSetPriority+0 
	CALL        _INTERRUPT_vidSetPriority+0, 0
;timers.c,121 :: 		INTERRUPT_ENABLE_SRC(INTERRUPT_REG_EN_TMR3,IntEn_TMR2_TMR3);
	BSF         PIE2+0, 1 
;timers.c,122 :: 		break;
	GOTO        L_TIMERS_vidConfigTimerInterrupts19
;timers.c,123 :: 		}
L_TIMERS_vidConfigTimerInterrupts18:
	MOVF        FARG_TIMERS_vidConfigTimerInterrupts_timerID+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidConfigTimerInterrupts20
	MOVF        FARG_TIMERS_vidConfigTimerInterrupts_timerID+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidConfigTimerInterrupts21
	MOVF        FARG_TIMERS_vidConfigTimerInterrupts_timerID+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidConfigTimerInterrupts22
	MOVF        FARG_TIMERS_vidConfigTimerInterrupts_timerID+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidConfigTimerInterrupts23
L_TIMERS_vidConfigTimerInterrupts19:
;timers.c,124 :: 		}
L_end_TIMERS_vidConfigTimerInterrupts:
	RETURN      0
; end of _TIMERS_vidConfigTimerInterrupts
