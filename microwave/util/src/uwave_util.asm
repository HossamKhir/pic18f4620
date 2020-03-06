
_UWAVE_UTIL_u8DecrementTime:

;uwave_util.c,48 :: 		UWAVE_UTIL_u8DecrementTime(uint16Ref u16TimeRef)
;uwave_util.c,50 :: 		if (DEREF(u16TimeRef))
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u16TimeRef+0, FSR0
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u16TimeRef+1, FSR0H
	MOVF        POSTINC0+0, 0 
	IORWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_u8DecrementTime0
;uwave_util.c,52 :: 		DEREF(u16TimeRef) -= (DEREF(u16TimeRef) % 100)? 1 : 41;
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u16TimeRef+0, FSR0
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u16TimeRef+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_u8DecrementTime1
	MOVLW       1
	MOVWF       R0 
	GOTO        L_UWAVE_UTIL_u8DecrementTime2
L_UWAVE_UTIL_u8DecrementTime1:
	MOVLW       41
	MOVWF       R0 
L_UWAVE_UTIL_u8DecrementTime2:
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u16TimeRef+0, FSR0
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u16TimeRef+1, FSR0H
	MOVF        R0, 0 
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	SUBWFB      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u16TimeRef+0, FSR1
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u16TimeRef+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;uwave_util.c,53 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_UWAVE_UTIL_u8DecrementTime
;uwave_util.c,54 :: 		}
L_UWAVE_UTIL_u8DecrementTime0:
;uwave_util.c,55 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;uwave_util.c,56 :: 		}
L_end_UWAVE_UTIL_u8DecrementTime:
	RETURN      0
; end of _UWAVE_UTIL_u8DecrementTime

_UWAVE_UTIL_vidScheduler:

;uwave_util.c,60 :: 		UWAVE_UTIL_vidScheduler(void)
;uwave_util.c,62 :: 		uint8 u8Key = '\0';
	CLRF        UWAVE_UTIL_vidScheduler_u8Key_L0+0 
;uwave_util.c,63 :: 		while(1)
L_UWAVE_UTIL_vidScheduler3:
;uwave_util.c,65 :: 		if (u8OverflowFlag)
	MOVF        _u8OverflowFlag+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler5
;uwave_util.c,67 :: 		u8Key = UWAVE_KEYPAD_GET_KEY();
	CALL        _KEYPAD4X3_u8GetKeyPressed+0, 0
	MOVF        R0, 0 
	MOVWF       UWAVE_UTIL_vidScheduler_u8Key_L0+0 
;uwave_util.c,70 :: 		UWAVE_SENSORS_ACTIVATE();
	BSF         TRISB+0, 1 
	BSF         TRISB+0, 2 
;uwave_util.c,72 :: 		switch (currentState)
	GOTO        L_UWAVE_UTIL_vidScheduler6
;uwave_util.c,74 :: 		case STATE_IDLE:
L_UWAVE_UTIL_vidScheduler8:
;uwave_util.c,75 :: 		switch (u8Key)
	GOTO        L_UWAVE_UTIL_vidScheduler9
;uwave_util.c,77 :: 		case 's':   // start
L_UWAVE_UTIL_vidScheduler11:
;uwave_util.c,78 :: 		if (u8DoorClosed && u8WeightFound && u16HeatingTime)
	MOVF        _u8DoorClosed+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler14
	MOVF        _u8WeightFound+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler14
	MOVF        _u16HeatingTime+0, 0 
	IORWF       _u16HeatingTime+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler14
L__UWAVE_UTIL_vidScheduler43:
;uwave_util.c,80 :: 		currentState = STATE_HEAT;
	MOVLW       1
	MOVWF       _currentState+0 
;uwave_util.c,81 :: 		u8HeatingEndFlag = 0;
	CLRF        _u8HeatingEndFlag+0 
;uwave_util.c,82 :: 		UWAVE_MOTOR_START();
	BSF         T2CON+0, 2 
;uwave_util.c,83 :: 		UWAVE_HEATER_ON();
	BSF         PORTC+0, 5 
;uwave_util.c,84 :: 		LAMP_ON();
	BSF         PORTB+0, 7 
;uwave_util.c,85 :: 		}
	GOTO        L_UWAVE_UTIL_vidScheduler15
L_UWAVE_UTIL_vidScheduler14:
;uwave_util.c,89 :: 		}
L_UWAVE_UTIL_vidScheduler15:
;uwave_util.c,90 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler10
;uwave_util.c,91 :: 		case 'h':   // halt
L_UWAVE_UTIL_vidScheduler16:
;uwave_util.c,92 :: 		u8HeatingEndFlag = 0;   // remove flag for display
	CLRF        _u8HeatingEndFlag+0 
;uwave_util.c,93 :: 		u16HeatingTime = 0;
	CLRF        _u16HeatingTime+0 
	CLRF        _u16HeatingTime+1 
;uwave_util.c,94 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler10
;uwave_util.c,95 :: 		case '0':
L_UWAVE_UTIL_vidScheduler17:
;uwave_util.c,96 :: 		case '1':
L_UWAVE_UTIL_vidScheduler18:
;uwave_util.c,97 :: 		case '2':
L_UWAVE_UTIL_vidScheduler19:
;uwave_util.c,98 :: 		case '3':
L_UWAVE_UTIL_vidScheduler20:
;uwave_util.c,99 :: 		case '4':
L_UWAVE_UTIL_vidScheduler21:
;uwave_util.c,100 :: 		case '5':
L_UWAVE_UTIL_vidScheduler22:
;uwave_util.c,101 :: 		case '6':
L_UWAVE_UTIL_vidScheduler23:
;uwave_util.c,102 :: 		case '7':
L_UWAVE_UTIL_vidScheduler24:
;uwave_util.c,103 :: 		case '8':
L_UWAVE_UTIL_vidScheduler25:
;uwave_util.c,104 :: 		case '9':   // a digit
L_UWAVE_UTIL_vidScheduler26:
;uwave_util.c,105 :: 		u8HeatingEndFlag = 0;   // remove flag for display
	CLRF        _u8HeatingEndFlag+0 
;uwave_util.c,106 :: 		u16HeatingTime = (u16HeatingTime * 10) + (u8Key - '0');
	MOVF        _u16HeatingTime+0, 0 
	MOVWF       R0 
	MOVF        _u16HeatingTime+1, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       48
	SUBWF       UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       0
	SUBWFB      R3, 1 
	MOVF        R2, 0 
	ADDWF       R0, 0 
	MOVWF       _u16HeatingTime+0 
	MOVF        R3, 0 
	ADDWFC      R1, 0 
	MOVWF       _u16HeatingTime+1 
;uwave_util.c,107 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler10
;uwave_util.c,108 :: 		}
L_UWAVE_UTIL_vidScheduler9:
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       115
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler11
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       104
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler16
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       48
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler17
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler18
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler19
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler20
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       52
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler21
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler22
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler23
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       55
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler24
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler25
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       57
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler26
L_UWAVE_UTIL_vidScheduler10:
;uwave_util.c,109 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler7
;uwave_util.c,110 :: 		case STATE_HEAT:
L_UWAVE_UTIL_vidScheduler27:
;uwave_util.c,111 :: 		if (u8OverflowFlag >= 3)
	MOVLW       3
	SUBWF       _u8OverflowFlag+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_UWAVE_UTIL_vidScheduler28
;uwave_util.c,113 :: 		u8OverflowFlag = 0; // reset counter
	CLRF        _u8OverflowFlag+0 
;uwave_util.c,115 :: 		if(UWAVE_UTIL_u8DecrementTime(REF(u16HeatingTime)))
	MOVLW       _u16HeatingTime+0
	MOVWF       FARG_UWAVE_UTIL_u8DecrementTime_u16TimeRef+0 
	MOVLW       hi_addr(_u16HeatingTime+0)
	MOVWF       FARG_UWAVE_UTIL_u8DecrementTime_u16TimeRef+1 
	CALL        _UWAVE_UTIL_u8DecrementTime+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler29
;uwave_util.c,117 :: 		UWAVE_HEATER_OFF();
	BCF         PORTC+0, 5 
;uwave_util.c,118 :: 		UWAVE_MOTOR_HALT();
	BCF         T2CON+0, 2 
;uwave_util.c,119 :: 		LAMP_OFF();
	MOVLW       127
	ANDWF       PORTB+0, 1 
;uwave_util.c,120 :: 		u8HeatingEndFlag = 1;
	MOVLW       1
	MOVWF       _u8HeatingEndFlag+0 
;uwave_util.c,121 :: 		}
	GOTO        L_UWAVE_UTIL_vidScheduler30
L_UWAVE_UTIL_vidScheduler29:
;uwave_util.c,125 :: 		}
L_UWAVE_UTIL_vidScheduler30:
;uwave_util.c,126 :: 		}
L_UWAVE_UTIL_vidScheduler28:
;uwave_util.c,127 :: 		switch (u8Key)
	GOTO        L_UWAVE_UTIL_vidScheduler31
;uwave_util.c,129 :: 		case 's':   // start
L_UWAVE_UTIL_vidScheduler33:
;uwave_util.c,131 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler32
;uwave_util.c,132 :: 		case 'h':   // halt
L_UWAVE_UTIL_vidScheduler34:
;uwave_util.c,133 :: 		currentState = STATE_IDLE;
	CLRF        _currentState+0 
;uwave_util.c,134 :: 		UWAVE_MOTOR_HALT();
	BCF         T2CON+0, 2 
;uwave_util.c,135 :: 		UWAVE_HEATER_OFF();
	BCF         PORTC+0, 5 
;uwave_util.c,136 :: 		LAMP_OFF();
	MOVLW       127
	ANDWF       PORTB+0, 1 
;uwave_util.c,137 :: 		break;  // there are no effects for numbers
	GOTO        L_UWAVE_UTIL_vidScheduler32
;uwave_util.c,138 :: 		}
L_UWAVE_UTIL_vidScheduler31:
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       115
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler33
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	XORLW       104
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler34
L_UWAVE_UTIL_vidScheduler32:
;uwave_util.c,139 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler7
;uwave_util.c,140 :: 		}
L_UWAVE_UTIL_vidScheduler6:
	MOVF        _currentState+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler8
	MOVF        _currentState+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler27
L_UWAVE_UTIL_vidScheduler7:
;uwave_util.c,141 :: 		}
L_UWAVE_UTIL_vidScheduler5:
;uwave_util.c,143 :: 		if ((currentState == STATE_HEAT) && !(u8DoorClosed && u8WeightFound))
	MOVF        _currentState+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler39
	MOVF        _u8DoorClosed+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler36
	MOVF        _u8WeightFound+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler36
	MOVLW       1
	MOVWF       R0 
	GOTO        L_UWAVE_UTIL_vidScheduler35
L_UWAVE_UTIL_vidScheduler36:
	CLRF        R0 
L_UWAVE_UTIL_vidScheduler35:
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler39
L__UWAVE_UTIL_vidScheduler42:
;uwave_util.c,146 :: 		currentState = STATE_IDLE;
	CLRF        _currentState+0 
;uwave_util.c,147 :: 		UWAVE_MOTOR_HALT();
	BCF         T2CON+0, 2 
;uwave_util.c,148 :: 		UWAVE_HEATER_OFF();
	BCF         PORTC+0, 5 
;uwave_util.c,149 :: 		LAMP_OFF();
	MOVLW       127
	ANDWF       PORTB+0, 1 
;uwave_util.c,150 :: 		}
L_UWAVE_UTIL_vidScheduler39:
;uwave_util.c,152 :: 		if (u8HeatingEndFlag)
	MOVF        _u8HeatingEndFlag+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler40
;uwave_util.c,154 :: 		UWAVE_DISPLAY_vidDisplayEnd();
	CALL        _UWAVE_DISPLAY_vidDisplayEnd+0, 0
;uwave_util.c,155 :: 		}
	GOTO        L_UWAVE_UTIL_vidScheduler41
L_UWAVE_UTIL_vidScheduler40:
;uwave_util.c,158 :: 		UWAVE_DISPLAY_vidUpdateTimeDisplay(u16HeatingTime);
	MOVF        _u16HeatingTime+0, 0 
	MOVWF       FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay+0 
	MOVF        _u16HeatingTime+1, 0 
	MOVWF       FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay+1 
	CALL        _UWAVE_DISPLAY_vidUpdateTimeDisplay+0, 0
;uwave_util.c,159 :: 		}
L_UWAVE_UTIL_vidScheduler41:
;uwave_util.c,160 :: 		}
	GOTO        L_UWAVE_UTIL_vidScheduler3
;uwave_util.c,162 :: 		}
L_end_UWAVE_UTIL_vidScheduler:
	RETURN      0
; end of _UWAVE_UTIL_vidScheduler
