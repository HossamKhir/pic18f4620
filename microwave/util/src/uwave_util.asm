
_UWAVE_UTIL_u8DecrementTime:

;uwave_util.c,12 :: 		UWAVE_UTIL_u8DecrementTime(uint32Ref u32TimeRef)
;uwave_util.c,14 :: 		if (DEREF(u32TimeRef))
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u32TimeRef+0, FSR0
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u32TimeRef+1, FSR0H
	MOVF        POSTINC0+0, 0 
	IORWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_u8DecrementTime0
;uwave_util.c,16 :: 		DEREF(u32TimeRef) -= (DEREF(u32TimeRef) % 100)? 1 : 41;
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u32TimeRef+0, FSR0
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u32TimeRef+1, FSR0H
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
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u32TimeRef+0, FSR0
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u32TimeRef+1, FSR0H
	MOVF        R0, 0 
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	SUBWFB      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u32TimeRef+0, FSR1
	MOVFF       FARG_UWAVE_UTIL_u8DecrementTime_u32TimeRef+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;uwave_util.c,17 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_UWAVE_UTIL_u8DecrementTime
;uwave_util.c,18 :: 		}
L_UWAVE_UTIL_u8DecrementTime0:
;uwave_util.c,19 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;uwave_util.c,20 :: 		}
L_end_UWAVE_UTIL_u8DecrementTime:
	RETURN      0
; end of _UWAVE_UTIL_u8DecrementTime

_UWAVE_UTIL_vidScheduler:

;uwave_util.c,24 :: 		UWAVE_UTIL_vidScheduler(void)
;uwave_util.c,26 :: 		uint8 u8Key = '\0';
	CLRF        UWAVE_UTIL_vidScheduler_u8Key_L0+0 
;uwave_util.c,27 :: 		while(1)
L_UWAVE_UTIL_vidScheduler3:
;uwave_util.c,29 :: 		if (u8OverflowFlag)
	MOVF        _u8OverflowFlag+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler5
;uwave_util.c,31 :: 		u8Key = KEYPAD4X3_u8GetKeyPressed();
	CALL        _KEYPAD4X3_u8GetKeyPressed+0, 0
	MOVF        R0, 0 
	MOVWF       UWAVE_UTIL_vidScheduler_u8Key_L0+0 
;uwave_util.c,34 :: 		UWAVE_SENSORS_ACTIVATE();
	BSF         TRISB+0, 1 
	BSF         TRISB+0, 2 
;uwave_util.c,36 :: 		switch (currentState)
	GOTO        L_UWAVE_UTIL_vidScheduler6
;uwave_util.c,38 :: 		case STATE_IDLE:
L_UWAVE_UTIL_vidScheduler8:
;uwave_util.c,39 :: 		switch (u8Key)
	GOTO        L_UWAVE_UTIL_vidScheduler9
;uwave_util.c,41 :: 		case 's':   // start
L_UWAVE_UTIL_vidScheduler11:
;uwave_util.c,42 :: 		if (u8DoorClosed && u8WeightFound)
	MOVF        _u8DoorClosed+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler14
	MOVF        _u8WeightFound+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler14
L__UWAVE_UTIL_vidScheduler43:
;uwave_util.c,44 :: 		currentState = STATE_HEAT;
	MOVLW       1
	MOVWF       _currentState+0 
;uwave_util.c,45 :: 		u8HeatingEndFlag = 0;
	CLRF        _u8HeatingEndFlag+0 
;uwave_util.c,46 :: 		UWAVE_MOTOR_START();
	BSF         T2CON+0, 2 
;uwave_util.c,47 :: 		UWAVE_HEATER_ON();
	BSF         PORTC+0, 5 
;uwave_util.c,48 :: 		}
	GOTO        L_UWAVE_UTIL_vidScheduler15
L_UWAVE_UTIL_vidScheduler14:
;uwave_util.c,52 :: 		}
L_UWAVE_UTIL_vidScheduler15:
;uwave_util.c,53 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler10
;uwave_util.c,54 :: 		case 'h':   // halt
L_UWAVE_UTIL_vidScheduler16:
;uwave_util.c,55 :: 		u32HeatingTime = 0;
	CLRF        _u32HeatingTime+0 
	CLRF        _u32HeatingTime+1 
;uwave_util.c,56 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler10
;uwave_util.c,57 :: 		case '0':
L_UWAVE_UTIL_vidScheduler17:
;uwave_util.c,58 :: 		case '1':
L_UWAVE_UTIL_vidScheduler18:
;uwave_util.c,59 :: 		case '2':
L_UWAVE_UTIL_vidScheduler19:
;uwave_util.c,60 :: 		case '3':
L_UWAVE_UTIL_vidScheduler20:
;uwave_util.c,61 :: 		case '4':
L_UWAVE_UTIL_vidScheduler21:
;uwave_util.c,62 :: 		case '5':
L_UWAVE_UTIL_vidScheduler22:
;uwave_util.c,63 :: 		case '6':
L_UWAVE_UTIL_vidScheduler23:
;uwave_util.c,64 :: 		case '7':
L_UWAVE_UTIL_vidScheduler24:
;uwave_util.c,65 :: 		case '8':
L_UWAVE_UTIL_vidScheduler25:
;uwave_util.c,66 :: 		case '9':   // a digit
L_UWAVE_UTIL_vidScheduler26:
;uwave_util.c,67 :: 		u32HeatingTime = (u32HeatingTime * 10) + u8Key;
	MOVF        _u32HeatingTime+0, 0 
	MOVWF       R0 
	MOVF        _u32HeatingTime+1, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVF        UWAVE_UTIL_vidScheduler_u8Key_L0+0, 0 
	ADDWF       R0, 0 
	MOVWF       _u32HeatingTime+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       _u32HeatingTime+1 
;uwave_util.c,68 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler10
;uwave_util.c,69 :: 		}
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
;uwave_util.c,70 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler7
;uwave_util.c,71 :: 		case STATE_HEAT:
L_UWAVE_UTIL_vidScheduler27:
;uwave_util.c,74 :: 		if (u8OverflowFlag >= 3)
	MOVLW       3
	SUBWF       _u8OverflowFlag+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_UWAVE_UTIL_vidScheduler28
;uwave_util.c,77 :: 		u8OverflowFlag = 0; // reset counter
	CLRF        _u8OverflowFlag+0 
;uwave_util.c,79 :: 		if(UWAVE_UTIL_u8DecrementTime(REF(u32HeatingTime)))
	MOVLW       _u32HeatingTime+0
	MOVWF       FARG_UWAVE_UTIL_u8DecrementTime_u32TimeRef+0 
	MOVLW       hi_addr(_u32HeatingTime+0)
	MOVWF       FARG_UWAVE_UTIL_u8DecrementTime_u32TimeRef+1 
	CALL        _UWAVE_UTIL_u8DecrementTime+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler29
;uwave_util.c,81 :: 		UWAVE_HEATER_OFF();
	BCF         PORTC+0, 5 
;uwave_util.c,82 :: 		UWAVE_MOTOR_HALT();
	BCF         T2CON+0, 2 
;uwave_util.c,83 :: 		u8HeatingEndFlag = 1;
	MOVLW       1
	MOVWF       _u8HeatingEndFlag+0 
;uwave_util.c,84 :: 		}
	GOTO        L_UWAVE_UTIL_vidScheduler30
L_UWAVE_UTIL_vidScheduler29:
;uwave_util.c,88 :: 		}
L_UWAVE_UTIL_vidScheduler30:
;uwave_util.c,89 :: 		}
L_UWAVE_UTIL_vidScheduler28:
;uwave_util.c,91 :: 		switch (u8Key)
	GOTO        L_UWAVE_UTIL_vidScheduler31
;uwave_util.c,93 :: 		case 's':   // start
L_UWAVE_UTIL_vidScheduler33:
;uwave_util.c,95 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler32
;uwave_util.c,96 :: 		case 'h':   // halt
L_UWAVE_UTIL_vidScheduler34:
;uwave_util.c,97 :: 		currentState = STATE_IDLE;
	CLRF        _currentState+0 
;uwave_util.c,98 :: 		UWAVE_MOTOR_HALT();
	BCF         T2CON+0, 2 
;uwave_util.c,99 :: 		UWAVE_HEATER_OFF();
	BCF         PORTC+0, 5 
;uwave_util.c,100 :: 		break;  // there are no effects for numbers
	GOTO        L_UWAVE_UTIL_vidScheduler32
;uwave_util.c,101 :: 		}
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
;uwave_util.c,102 :: 		break;
	GOTO        L_UWAVE_UTIL_vidScheduler7
;uwave_util.c,103 :: 		}
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
;uwave_util.c,104 :: 		}
L_UWAVE_UTIL_vidScheduler5:
;uwave_util.c,106 :: 		if (currentState == STATE_HEAT && !(u8DoorClosed && u8WeightFound))
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
;uwave_util.c,109 :: 		currentState = STATE_IDLE;
	CLRF        _currentState+0 
;uwave_util.c,110 :: 		UWAVE_MOTOR_HALT();
	BCF         T2CON+0, 2 
;uwave_util.c,111 :: 		UWAVE_HEATER_ON();
	BSF         PORTC+0, 5 
;uwave_util.c,112 :: 		}
L_UWAVE_UTIL_vidScheduler39:
;uwave_util.c,114 :: 		if (u8HeatingEndFlag)
	MOVF        _u8HeatingEndFlag+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UWAVE_UTIL_vidScheduler40
;uwave_util.c,116 :: 		UWAVE_DISPLAY_vidDisplayEnd();
	CALL        _UWAVE_DISPLAY_vidDisplayEnd+0, 0
;uwave_util.c,117 :: 		}
	GOTO        L_UWAVE_UTIL_vidScheduler41
L_UWAVE_UTIL_vidScheduler40:
;uwave_util.c,120 :: 		UWAVE_DISPLAY_vidUpdateTimeDisplay(u32HeatingTime);
	MOVF        _u32HeatingTime+0, 0 
	MOVWF       FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay+0 
	MOVF        _u32HeatingTime+1, 0 
	MOVWF       FARG_UWAVE_DISPLAY_vidUpdateTimeDisplay+1 
	CALL        _UWAVE_DISPLAY_vidUpdateTimeDisplay+0, 0
;uwave_util.c,121 :: 		}
L_UWAVE_UTIL_vidScheduler41:
;uwave_util.c,122 :: 		}
	GOTO        L_UWAVE_UTIL_vidScheduler3
;uwave_util.c,124 :: 		}
L_end_UWAVE_UTIL_vidScheduler:
	RETURN      0
; end of _UWAVE_UTIL_vidScheduler
