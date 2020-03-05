
_INTERRUPT_vidInit:

;interrupt.c,4 :: 		INTERRUPT_vidInit(void)
;interrupt.c,6 :: 		INTERRUPT_ENABLE_GLOBAL();
	BSF         INTCON+0, 7 
;interrupt.c,7 :: 		INTERRUPT_ENABLE_PERIPHERAL();
	BSF         INTCON+0, 6 
;interrupt.c,8 :: 		INTERRUPT_ENABLE_PRIORITY();
	BSF         RCON+0, 7 
;interrupt.c,9 :: 		}
L_end_INTERRUPT_vidInit:
	RETURN      0
; end of _INTERRUPT_vidInit

_INTERRUPT_vidSetPriority:

;interrupt.c,13 :: 		enPriority priority)
;interrupt.c,15 :: 		switch(interruptSource)
	GOTO        L_INTERRUPT_vidSetPriority0
;interrupt.c,17 :: 		case IntPr_RB_TMR1_CCP2:
L_INTERRUPT_vidSetPriority2:
;interrupt.c,18 :: 		INTERRUPT_REG_PR_RB.RBIP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority15
	BCF         INTCON2+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority16
L__INTERRUPT_vidSetPriority15:
	BSF         INTCON2+0, 0 
L__INTERRUPT_vidSetPriority16:
;interrupt.c,19 :: 		INTERRUPT_REG_PR_CCP2.CCP2IP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority17
	BCF         IPR2+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority18
L__INTERRUPT_vidSetPriority17:
	BSF         IPR2+0, 0 
L__INTERRUPT_vidSetPriority18:
;interrupt.c,20 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,21 :: 		case IntPr_TMR2_TMR3:
L_INTERRUPT_vidSetPriority3:
;interrupt.c,22 :: 		INTERRUPT_REG_PR_TMR3.TMR3IP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority19
	BCF         IPR2+0, 1 
	GOTO        L__INTERRUPT_vidSetPriority20
L__INTERRUPT_vidSetPriority19:
	BSF         IPR2+0, 1 
L__INTERRUPT_vidSetPriority20:
;interrupt.c,23 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,24 :: 		case IntPr_TMR0_CCP1_HLVD:
L_INTERRUPT_vidSetPriority4:
;interrupt.c,25 :: 		INTERRUPT_REG_PR_TMR0.TMR0IP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority21
	BCF         INTCON2+0, 2 
	GOTO        L__INTERRUPT_vidSetPriority22
L__INTERRUPT_vidSetPriority21:
	BSF         INTCON2+0, 2 
L__INTERRUPT_vidSetPriority22:
;interrupt.c,26 :: 		INTERRUPT_REG_PR_HL_VOL_DET.HLVDIP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority23
	BCF         IPR2+0, 2 
	GOTO        L__INTERRUPT_vidSetPriority24
L__INTERRUPT_vidSetPriority23:
	BSF         IPR2+0, 2 
L__INTERRUPT_vidSetPriority24:
;interrupt.c,27 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,28 :: 		case IntPr_SSP_BCL:
L_INTERRUPT_vidSetPriority5:
;interrupt.c,29 :: 		INTERRUPT_REG_PR_SSP.SSPIP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority25
	BCF         IPR1+0, 3 
	GOTO        L__INTERRUPT_vidSetPriority26
L__INTERRUPT_vidSetPriority25:
	BSF         IPR1+0, 3 
L__INTERRUPT_vidSetPriority26:
;interrupt.c,30 :: 		INTERRUPT_REG_PR_BUS_COL.BCLIP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority27
	BCF         IPR2+0, 3 
	GOTO        L__INTERRUPT_vidSetPriority28
L__INTERRUPT_vidSetPriority27:
	BSF         IPR2+0, 3 
L__INTERRUPT_vidSetPriority28:
;interrupt.c,31 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,32 :: 		case IntPr_TX_EE:
L_INTERRUPT_vidSetPriority6:
;interrupt.c,33 :: 		INTERRUPT_REG_PR_TX_RX.TXIP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority29
	BCF         IPR1+0, 4 
	GOTO        L__INTERRUPT_vidSetPriority30
L__INTERRUPT_vidSetPriority29:
	BSF         IPR1+0, 4 
L__INTERRUPT_vidSetPriority30:
;interrupt.c,34 :: 		INTERRUPT_REG_PR_EEPROM.EEIP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority31
	BCF         IPR2+0, 4 
	GOTO        L__INTERRUPT_vidSetPriority32
L__INTERRUPT_vidSetPriority31:
	BSF         IPR2+0, 4 
L__INTERRUPT_vidSetPriority32:
;interrupt.c,35 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,36 :: 		case IntPr_RX:
L_INTERRUPT_vidSetPriority7:
;interrupt.c,37 :: 		INTERRUPT_REG_PR_TX_RX.RCIP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority33
	BCF         IPR1+0, 5 
	GOTO        L__INTERRUPT_vidSetPriority34
L__INTERRUPT_vidSetPriority33:
	BSF         IPR1+0, 5 
L__INTERRUPT_vidSetPriority34:
;interrupt.c,38 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,39 :: 		case IntPr_INT1_ADC_CM:
L_INTERRUPT_vidSetPriority8:
;interrupt.c,40 :: 		INTERRUPT_REG_PR_INT1.INT1IP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority35
	BCF         INTCON3+0, 6 
	GOTO        L__INTERRUPT_vidSetPriority36
L__INTERRUPT_vidSetPriority35:
	BSF         INTCON3+0, 6 
L__INTERRUPT_vidSetPriority36:
;interrupt.c,41 :: 		INTERRUPT_REG_PR_COMPARATOR.CMIP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority37
	BCF         IPR2+0, 6 
	GOTO        L__INTERRUPT_vidSetPriority38
L__INTERRUPT_vidSetPriority37:
	BSF         IPR2+0, 6 
L__INTERRUPT_vidSetPriority38:
;interrupt.c,42 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,43 :: 		case IntPr_INT2_PSP_OSCF:
L_INTERRUPT_vidSetPriority9:
;interrupt.c,44 :: 		INTERRUPT_REG_PR_INT2.INT2IP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority39
	BCF         INTCON3+0, 7 
	GOTO        L__INTERRUPT_vidSetPriority40
L__INTERRUPT_vidSetPriority39:
	BSF         INTCON3+0, 7 
L__INTERRUPT_vidSetPriority40:
;interrupt.c,45 :: 		INTERRUPT_REG_PR_OSC_FAIL.OSCFIP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority41
	BCF         IPR2+0, 7 
	GOTO        L__INTERRUPT_vidSetPriority42
L__INTERRUPT_vidSetPriority41:
	BSF         IPR2+0, 7 
L__INTERRUPT_vidSetPriority42:
;interrupt.c,46 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,47 :: 		}
L_INTERRUPT_vidSetPriority0:
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority2
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority3
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority4
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority5
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority6
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority7
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority8
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority9
L_INTERRUPT_vidSetPriority1:
;interrupt.c,48 :: 		}
L_end_INTERRUPT_vidSetPriority:
	RETURN      0
; end of _INTERRUPT_vidSetPriority

_ISR_PriorityLow:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;interrupt.c,50 :: 		void ISR_PriorityLow() iv 0x0018 ics ICS_AUTO
;interrupt.c,54 :: 		if (GET_BIT(UWAVE_SENSOR_DOOR_FLAG,FLAG_DOOR))
	MOVF        INTCON3+0, 0 
	MOVWF       R1 
	BTFSS       R1, 0 
	GOTO        L_ISR_PriorityLow10
;interrupt.c,56 :: 		u8DoorClosed ^= 1;
	BTG         _u8DoorClosed+0, 0 
;interrupt.c,57 :: 		}
L_ISR_PriorityLow10:
;interrupt.c,58 :: 		if (GET_BIT(UWAVE_SENSOR_WEIGHT_FLAG,FLAG_WEIGHT))
	MOVF        INTCON3+0, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	BCF         R1, 7 
	BTFSS       R1, 0 
	GOTO        L_ISR_PriorityLow11
;interrupt.c,60 :: 		u8WeightFound &= 1;
	MOVLW       1
	ANDWF       _u8WeightFound+0, 1 
;interrupt.c,61 :: 		}
L_ISR_PriorityLow11:
;interrupt.c,63 :: 		}
L_end_ISR_PriorityLow:
L__ISR_PriorityLow44:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _ISR_PriorityLow

_ISR_PriorityHigh:

;interrupt.c,65 :: 		void ISR_PriorityHigh() iv 0x0008 ics ICS_AUTO
;interrupt.c,69 :: 		if (GET_BIT(INTERRUPT_REG_FLAG_TMR0,IntFlag_TMR0_CCP1_HLVD))
	MOVF        INTCON+0, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	BCF         R1, 7 
	BTFSS       R1, 0 
	GOTO        L_ISR_PriorityHigh12
;interrupt.c,71 :: 		INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_TMR0,IntFlag_TMR0_CCP1_HLVD);
	BCF         INTCON+0, 2 
;interrupt.c,72 :: 		FILL_TMR_REGS(TIMER0,u64InitialCount);
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
;interrupt.c,73 :: 		CLR_TMR_INT_FLAG(TIMER0);
	BCF         INTCON+0, 2 
;interrupt.c,74 :: 		u8OverflowFlag += 1;
	INCF        _u8OverflowFlag+0, 1 
;interrupt.c,75 :: 		}
L_ISR_PriorityHigh12:
;interrupt.c,77 :: 		}
L_end_ISR_PriorityHigh:
L__ISR_PriorityHigh46:
	RETFIE      1
; end of _ISR_PriorityHigh

interrupt____?ag:

L_end_interrupt___?ag:
	RETURN      0
; end of interrupt____?ag
