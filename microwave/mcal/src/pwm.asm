
_PWM_vidInit:

;pwm.c,7 :: 		uint64 u64FreqUnit)
;pwm.c,9 :: 		PWM_SET_MODE(pwmmode);
	MOVLW       240
	ANDWF       CCP1CON+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       FARG_PWM_vidInit_pwmmode+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	IORWF       R1, 0 
	MOVWF       CCP1CON+0 
;pwm.c,12 :: 		u16DutyCycle = (uint16)((u16DutyCycle / 100.0) * (FOSC / (double)(PRE004 * POS01 * (u64PWMFreq * u64FreqUnit))));
	MOVF        FARG_PWM_vidInit_u16DutyCycle+0, 0 
	MOVWF       R0 
	CALL        _Byte2Double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__PWM_vidInit+0 
	MOVF        R1, 0 
	MOVWF       FLOC__PWM_vidInit+1 
	MOVF        R2, 0 
	MOVWF       FLOC__PWM_vidInit+2 
	MOVF        R3, 0 
	MOVWF       FLOC__PWM_vidInit+3 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Longword2Double+0, 0
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
	MOVLW       36
	MOVWF       R1 
	MOVLW       116
	MOVWF       R2 
	MOVLW       149
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        FLOC__PWM_vidInit+0, 0 
	MOVWF       R4 
	MOVF        FLOC__PWM_vidInit+1, 0 
	MOVWF       R5 
	MOVF        FLOC__PWM_vidInit+2, 0 
	MOVWF       R6 
	MOVF        FLOC__PWM_vidInit+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _Double2Byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM_vidInit_u16DutyCycle+0 
;pwm.c,13 :: 		PWM_SET_DUTY_CYCLE(u16DutyCycle);
	MOVF        R0, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	BCF         R1, 7 
	MOVLW       255
	ANDWF       R1, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       CCPR1L+0 
	MOVF        R0, 0 
	IORWF       CCP1CON+0, 1 
;pwm.c,15 :: 		TIMERS_vidInitTimer(TIMER2, PRE004, POS01, ((uint64)(1.0 / u64PWMFreq)), u64FreqUnit);
	MOVLW       2
	MOVWF       FARG_TIMERS_vidInitTimer+0 
	MOVLW       2
	MOVWF       FARG_TIMERS_vidInitTimer+0 
	CLRF        FARG_TIMERS_vidInitTimer+0 
	MOVF        FARG_PWM_vidInit_u64PWMFreq+0, 0 
	MOVWF       R0 
	MOVF        FARG_PWM_vidInit_u64PWMFreq+1, 0 
	MOVWF       R1 
	MOVF        FARG_PWM_vidInit_u64PWMFreq+2, 0 
	MOVWF       R2 
	MOVF        FARG_PWM_vidInit_u64PWMFreq+3, 0 
	MOVWF       R3 
	CALL        _Longword2Double+0, 0
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
	MOVLW       127
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	CALL        _Double2Longword+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_TIMERS_vidInitTimer+0 
	MOVF        R1, 0 
	MOVWF       FARG_TIMERS_vidInitTimer+1 
	MOVF        R2, 0 
	MOVWF       FARG_TIMERS_vidInitTimer+2 
	MOVF        R3, 0 
	MOVWF       FARG_TIMERS_vidInitTimer+3 
	MOVF        FARG_PWM_vidInit_u64FreqUnit+0, 0 
	MOVWF       FARG_TIMERS_vidInitTimer+0 
	MOVF        FARG_PWM_vidInit_u64FreqUnit+1, 0 
	MOVWF       FARG_TIMERS_vidInitTimer+1 
	MOVF        FARG_PWM_vidInit_u64FreqUnit+2, 0 
	MOVWF       FARG_TIMERS_vidInitTimer+2 
	MOVF        FARG_PWM_vidInit_u64FreqUnit+3, 0 
	MOVWF       FARG_TIMERS_vidInitTimer+3 
	CALL        _TIMERS_vidInitTimer+0, 0
;pwm.c,17 :: 		PWM_ACTIVATE();
	BCF         TRISC+0, 2 
;pwm.c,18 :: 		PWM_HALT();
	BCF         T2CON+0, 2 
;pwm.c,19 :: 		}
L_end_PWM_vidInit:
	RETURN      0
; end of _PWM_vidInit
