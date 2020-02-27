
timers_TIMERS_vidSetPrescale:

;timers.c,16 :: 		TIMERS_vidSetPrescale(uint8 u8TimerID, static enum enPrescale prescale)
;timers.c,18 :: 		switch (u8TimerID)
	GOTO        L_timers_TIMERS_vidSetPrescale0
;timers.c,20 :: 		case TIMER0:
L_timers_TIMERS_vidSetPrescale2:
;timers.c,21 :: 		GET_TMR_CTRL_REG(TIMER0)   |=  (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
	MOVLW       18
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
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
	MOVF        FARG_timers_TIMERS_vidSetPrescale_prescale+0, 0 
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
	ANDWF       FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
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
L_timers_TIMERS_vidSetPrescale13:
	BZ          L_timers_TIMERS_vidSetPrescale14
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L_timers_TIMERS_vidSetPrescale13
L_timers_TIMERS_vidSetPrescale14:
	MOVF        R0, 0 
	IORWF       T0CON+0, 1 
;timers.c,22 :: 		break;
	GOTO        L_timers_TIMERS_vidSetPrescale1
;timers.c,23 :: 		case TIMER1:
L_timers_TIMERS_vidSetPrescale3:
;timers.c,24 :: 		GET_TMR_CTRL_REG(TIMER1)   |=  (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
	MOVLW       18
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
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
	MOVF        FARG_timers_TIMERS_vidSetPrescale_prescale+0, 0 
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
	ANDWF       FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
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
L_timers_TIMERS_vidSetPrescale15:
	BZ          L_timers_TIMERS_vidSetPrescale16
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L_timers_TIMERS_vidSetPrescale15
L_timers_TIMERS_vidSetPrescale16:
	MOVF        R0, 0 
	IORWF       T1CON+0, 1 
;timers.c,25 :: 		break;
	GOTO        L_timers_TIMERS_vidSetPrescale1
;timers.c,26 :: 		case TIMER2:
L_timers_TIMERS_vidSetPrescale4:
;timers.c,27 :: 		GET_TMR_CTRL_REG(TIMER2)   |=  (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
	MOVLW       18
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
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
	MOVF        FARG_timers_TIMERS_vidSetPrescale_prescale+0, 0 
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
	ANDWF       FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
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
L_timers_TIMERS_vidSetPrescale17:
	BZ          L_timers_TIMERS_vidSetPrescale18
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L_timers_TIMERS_vidSetPrescale17
L_timers_TIMERS_vidSetPrescale18:
	MOVF        R0, 0 
	IORWF       T2CON+0, 1 
;timers.c,28 :: 		break;
	GOTO        L_timers_TIMERS_vidSetPrescale1
;timers.c,29 :: 		case TIMER3:
L_timers_TIMERS_vidSetPrescale5:
;timers.c,30 :: 		GET_TMR_CTRL_REG(TIMER3)   |=  (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
	MOVLW       18
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
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
	MOVF        FARG_timers_TIMERS_vidSetPrescale_prescale+0, 0 
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
	ANDWF       FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
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
L_timers_TIMERS_vidSetPrescale19:
	BZ          L_timers_TIMERS_vidSetPrescale20
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L_timers_TIMERS_vidSetPrescale19
L_timers_TIMERS_vidSetPrescale20:
	MOVF        R0, 0 
	IORWF       T3CON+0, 1 
;timers.c,31 :: 		break;
	GOTO        L_timers_TIMERS_vidSetPrescale1
;timers.c,32 :: 		}
L_timers_TIMERS_vidSetPrescale0:
	MOVF        FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_timers_TIMERS_vidSetPrescale2
	MOVF        FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_timers_TIMERS_vidSetPrescale3
	MOVF        FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_timers_TIMERS_vidSetPrescale4
	MOVF        FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_timers_TIMERS_vidSetPrescale5
L_timers_TIMERS_vidSetPrescale1:
;timers.c,33 :: 		}
L_end_TIMERS_vidSetPrescale:
	RETURN      0
; end of timers_TIMERS_vidSetPrescale

_TIMERS_vidInitTimer:

;timers.c,40 :: 		)
;timers.c,42 :: 		u64TargetTime = GET_TIME_IN_USEC(u64TargetTime,u64TimeUnit);
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
;timers.c,43 :: 		TIMERS_vidUpdateInitialCount(u64TargetTime, u8TimerID, prescale);
	MOVF        R0, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+0 
	MOVF        R1, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+1 
	MOVF        R2, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+2 
	MOVF        R3, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+3 
	MOVF        FARG_TIMERS_vidInitTimer_u8TimerID+0, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+0 
	MOVF        FARG_TIMERS_vidInitTimer_prescale+0, 0 
	MOVWF       FARG_TIMERS_vidUpdateInitialCount+0 
	CALL        _TIMERS_vidUpdateInitialCount+0, 0
;timers.c,44 :: 		TIMERS_vidSetPrescale(u8TimerID, prescale);
	MOVF        FARG_TIMERS_vidInitTimer_u8TimerID+0, 0 
	MOVWF       FARG_timers_TIMERS_vidSetPrescale_u8TimerID+0 
	MOVF        FARG_TIMERS_vidInitTimer_prescale+0, 0 
	MOVWF       FARG_timers_TIMERS_vidSetPrescale_prescale+0 
	CALL        timers_TIMERS_vidSetPrescale+0, 0
;timers.c,45 :: 		TIMERS_vidResetTimer(u8TimerID);
	MOVF        FARG_TIMERS_vidInitTimer_u8TimerID+0, 0 
	MOVWF       FARG_TIMERS_vidResetTimer+0 
	CALL        _TIMERS_vidResetTimer+0, 0
;timers.c,46 :: 		}
L_end_TIMERS_vidInitTimer:
	RETURN      0
; end of _TIMERS_vidInitTimer

_TIMERS_vidUpdateInitialCount:

;timers.c,52 :: 		)
;timers.c,54 :: 		u64InitialCount = FULL_COUNT - (u64TargetTime / (CYCLE_PERIOD * (double)u16Prescaler[u8TimerID][prescale][1]));
	MOVLW       18
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_TIMERS_vidUpdateInitialCount_u8TimerID+0, 0 
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
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       143
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _Double2Longword+0, 0
	MOVF        R0, 0 
	MOVWF       _u64InitialCount+0 
	MOVF        R1, 0 
	MOVWF       _u64InitialCount+1 
	MOVF        R2, 0 
	MOVWF       _u64InitialCount+2 
	MOVF        R3, 0 
	MOVWF       _u64InitialCount+3 
;timers.c,55 :: 		}
L_end_TIMERS_vidUpdateInitialCount:
	RETURN      0
; end of _TIMERS_vidUpdateInitialCount

_TIMERS_vidResetTimer:

;timers.c,58 :: 		TIMERS_vidResetTimer(uint8 u8TimerID)
;timers.c,60 :: 		switch (u8TimerID)
	GOTO        L_TIMERS_vidResetTimer6
;timers.c,62 :: 		case TIMER0:
L_TIMERS_vidResetTimer8:
;timers.c,63 :: 		FILL_TMR_REGS(TIMER0,u64InitialCount);
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
;timers.c,64 :: 		CLR_TMR_INT_FLAG(TIMER0);
	BCF         INTCON+0, 2 
;timers.c,65 :: 		break;
	GOTO        L_TIMERS_vidResetTimer7
;timers.c,66 :: 		case TIMER1:
L_TIMERS_vidResetTimer9:
;timers.c,67 :: 		FILL_TMR_REGS(TIMER1,u64InitialCount);
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
;timers.c,68 :: 		CLR_TMR_INT_FLAG(TIMER1);
	BCF         INTCON+0, 0 
;timers.c,69 :: 		break;
	GOTO        L_TIMERS_vidResetTimer7
;timers.c,70 :: 		case TIMER3:
L_TIMERS_vidResetTimer10:
;timers.c,71 :: 		FILL_TMR_REGS(TIMER3,u64InitialCount);
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
;timers.c,72 :: 		CLR_TMR_INT_FLAG(TIMER3);
	BCF         INTCON+0, 1 
;timers.c,73 :: 		break;
	GOTO        L_TIMERS_vidResetTimer7
;timers.c,74 :: 		case TIMER2:
L_TIMERS_vidResetTimer11:
;timers.c,76 :: 		TMR2    =   GET_TIME_REG_LOW(u64InitialCount);
	MOVLW       255
	ANDWF       _u64InitialCount+0, 0 
	MOVWF       TMR2+0 
;timers.c,78 :: 		CLR_TMR_INT_FLAG(TIMER2);
	BCF         INTCON+0, 1 
;timers.c,79 :: 		break;
	GOTO        L_TIMERS_vidResetTimer7
;timers.c,80 :: 		}
L_TIMERS_vidResetTimer6:
	MOVF        FARG_TIMERS_vidResetTimer_u8TimerID+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidResetTimer8
	MOVF        FARG_TIMERS_vidResetTimer_u8TimerID+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidResetTimer9
	MOVF        FARG_TIMERS_vidResetTimer_u8TimerID+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidResetTimer10
	MOVF        FARG_TIMERS_vidResetTimer_u8TimerID+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMERS_vidResetTimer11
L_TIMERS_vidResetTimer7:
;timers.c,81 :: 		}
L_end_TIMERS_vidResetTimer:
	RETURN      0
; end of _TIMERS_vidResetTimer
