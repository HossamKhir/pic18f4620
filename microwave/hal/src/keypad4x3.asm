
_KEYPAD4X3_vidInit:

;keypad4x3.c,51 :: 		uint8 u8ColumnsMask)
;keypad4x3.c,53 :: 		ADCON1 |= 0X0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;keypad4x3.c,55 :: 		u16DirectionRowsRef    = u16RowsDirectionRef;
	MOVF        FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+0, 0 
	MOVWF       _u16DirectionRowsRef+0 
	MOVF        FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+1, 0 
	MOVWF       _u16DirectionRowsRef+1 
;keypad4x3.c,56 :: 		u16DirectionColumnsRef = u16ColumnsDirectionRef;
	MOVF        FARG_KEYPAD4X3_vidInit_u16ColumnsDirectionRef+0, 0 
	MOVWF       _u16DirectionColumnsRef+0 
	MOVF        FARG_KEYPAD4X3_vidInit_u16ColumnsDirectionRef+1, 0 
	MOVWF       _u16DirectionColumnsRef+1 
;keypad4x3.c,57 :: 		u16DataRowsRef         = u16RowsDataRef;
	MOVF        FARG_KEYPAD4X3_vidInit_u16RowsDataRef+0, 0 
	MOVWF       _u16DataRowsRef+0 
	MOVF        FARG_KEYPAD4X3_vidInit_u16RowsDataRef+1, 0 
	MOVWF       _u16DataRowsRef+1 
;keypad4x3.c,58 :: 		u16DataColumnsRef      = u16ColumnsDataRef;
	MOVF        FARG_KEYPAD4X3_vidInit_u16ColumnsDataRef+0, 0 
	MOVWF       _u16DataColumnsRef+0 
	MOVF        FARG_KEYPAD4X3_vidInit_u16ColumnsDataRef+1, 0 
	MOVWF       _u16DataColumnsRef+1 
;keypad4x3.c,60 :: 		u8MaskRows    = u8RowsMask;
	MOVF        FARG_KEYPAD4X3_vidInit_u8RowsMask+0, 0 
	MOVWF       _u8MaskRows+0 
;keypad4x3.c,61 :: 		u8MaskColumns = u8ColumnsMask;
	MOVF        FARG_KEYPAD4X3_vidInit_u8ColumnsMask+0, 0 
	MOVWF       _u8MaskColumns+0 
;keypad4x3.c,63 :: 		KEYPAD4X3_ACTIVATE();
	MOVFF       FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+0, FSR0
	MOVFF       FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+1, FSR0H
	MOVFF       FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+0, FSR1
	MOVFF       FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+1, FSR1H
	MOVF        FARG_KEYPAD4X3_vidInit_u8RowsMask+0, 0 
	IORWF       POSTINC0+0, 1 
	MOVFF       _u16DataColumnsRef+0, FSR0
	MOVFF       _u16DataColumnsRef+1, FSR0H
	MOVFF       _u16DataColumnsRef+0, FSR1
	MOVFF       _u16DataColumnsRef+1, FSR1H
	MOVF        _u8MaskColumns+0, 0 
	IORWF       POSTINC0+0, 1 
	MOVFF       _u16DataRowsRef+0, FSR0
	MOVFF       _u16DataRowsRef+1, FSR0H
	MOVFF       _u16DataRowsRef+0, FSR1
	MOVFF       _u16DataRowsRef+1, FSR1H
	MOVF        _u8MaskRows+0, 0 
	IORWF       POSTINC0+0, 1 
	MOVFF       _u16DirectionRowsRef+0, FSR0
	MOVFF       _u16DirectionRowsRef+1, FSR0H
	MOVFF       _u16DirectionRowsRef+0, FSR1
	MOVFF       _u16DirectionRowsRef+1, FSR1H
	MOVF        _u8MaskRows+0, 0 
	IORWF       POSTINC0+0, 1 
	COMF        _u8MaskColumns+0, 0 
	MOVWF       R0 
	MOVFF       _u16DirectionColumnsRef+0, FSR0
	MOVFF       _u16DirectionColumnsRef+1, FSR0H
	MOVFF       _u16DirectionColumnsRef+0, FSR1
	MOVFF       _u16DirectionColumnsRef+1, FSR1H
	MOVF        R0, 0 
	ANDWF       POSTINC0+0, 1 
;keypad4x3.c,64 :: 		}
L_end_KEYPAD4X3_vidInit:
	RETURN      0
; end of _KEYPAD4X3_vidInit

_KEYPAD4X3_u8GetKeyPressed:

;keypad4x3.c,67 :: 		KEYPAD4X3_u8GetKeyPressed(void)
;keypad4x3.c,70 :: 		uint8 u8Key = '\0';
	CLRF        KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0 
	CLRF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0 
	CLRF        KEYPAD4X3_u8GetKeyPressed_u8RowRead_L0+0 
;keypad4x3.c,74 :: 		KEYPAD4X3_ACTIVATE();
	MOVFF       _u16DirectionRowsRef+0, FSR0
	MOVFF       _u16DirectionRowsRef+1, FSR0H
	MOVFF       _u16DirectionRowsRef+0, FSR1
	MOVFF       _u16DirectionRowsRef+1, FSR1H
	MOVF        _u8MaskRows+0, 0 
	IORWF       POSTINC0+0, 1 
	MOVFF       _u16DataColumnsRef+0, FSR0
	MOVFF       _u16DataColumnsRef+1, FSR0H
	MOVFF       _u16DataColumnsRef+0, FSR1
	MOVFF       _u16DataColumnsRef+1, FSR1H
	MOVF        _u8MaskColumns+0, 0 
	IORWF       POSTINC0+0, 1 
	MOVFF       _u16DataRowsRef+0, FSR0
	MOVFF       _u16DataRowsRef+1, FSR0H
	MOVFF       _u16DataRowsRef+0, FSR1
	MOVFF       _u16DataRowsRef+1, FSR1H
	MOVF        _u8MaskRows+0, 0 
	IORWF       POSTINC0+0, 1 
	MOVFF       _u16DirectionRowsRef+0, FSR0
	MOVFF       _u16DirectionRowsRef+1, FSR0H
	MOVFF       _u16DirectionRowsRef+0, FSR1
	MOVFF       _u16DirectionRowsRef+1, FSR1H
	MOVF        _u8MaskRows+0, 0 
	IORWF       POSTINC0+0, 1 
	COMF        _u8MaskColumns+0, 0 
	MOVWF       R0 
	MOVFF       _u16DirectionColumnsRef+0, FSR0
	MOVFF       _u16DirectionColumnsRef+1, FSR0H
	MOVFF       _u16DirectionColumnsRef+0, FSR1
	MOVFF       _u16DirectionColumnsRef+1, FSR1H
	MOVF        R0, 0 
	ANDWF       POSTINC0+0, 1 
;keypad4x3.c,76 :: 		SET_BITS(KEYPAD_DATA_COLUMNS, KEYPAD_COLUMNS);
	MOVFF       _u16DataColumnsRef+0, FSR0
	MOVFF       _u16DataColumnsRef+1, FSR0H
	MOVFF       _u16DataColumnsRef+0, FSR1
	MOVFF       _u16DataColumnsRef+1, FSR1H
	MOVF        _u8MaskColumns+0, 0 
	IORWF       POSTINC0+0, 1 
;keypad4x3.c,78 :: 		for (u8Column = 0; u8Column < 3; u8Column += 1)
	CLRF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0 
L_KEYPAD4X3_u8GetKeyPressed0:
	MOVLW       3
	SUBWF       KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed1
;keypad4x3.c,80 :: 		CLR_BIT(KEYPAD_DATA_COLUMNS, u8Column);
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__KEYPAD4X3_u8GetKeyPressed27:
	BZ          L__KEYPAD4X3_u8GetKeyPressed28
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__KEYPAD4X3_u8GetKeyPressed27
L__KEYPAD4X3_u8GetKeyPressed28:
	COMF        R0, 1 
	MOVFF       _u16DataColumnsRef+0, FSR0
	MOVFF       _u16DataColumnsRef+1, FSR0H
	MOVFF       _u16DataColumnsRef+0, FSR1
	MOVFF       _u16DataColumnsRef+1, FSR1H
	MOVF        R0, 0 
	ANDWF       POSTINC0+0, 1 
;keypad4x3.c,82 :: 		u8RowRead = GET_VAL_REG(KEYPAD_DATA_ROWS, KEYPAD_ROWS);
	MOVFF       _u16DataRowsRef+0, FSR0
	MOVFF       _u16DataRowsRef+1, FSR0H
	MOVF        _u8MaskRows+0, 0 
	ANDWF       POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       KEYPAD4X3_u8GetKeyPressed_u8RowRead_L0+0 
;keypad4x3.c,84 :: 		if (u8RowRead != KEYPAD_ROWS)
	MOVF        R1, 0 
	XORWF       _u8MaskRows+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed3
;keypad4x3.c,86 :: 		break;
	GOTO        L_KEYPAD4X3_u8GetKeyPressed1
;keypad4x3.c,87 :: 		}
L_KEYPAD4X3_u8GetKeyPressed3:
;keypad4x3.c,90 :: 		SET_BIT(KEYPAD_DATA_COLUMNS, u8Column);
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__KEYPAD4X3_u8GetKeyPressed29:
	BZ          L__KEYPAD4X3_u8GetKeyPressed30
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__KEYPAD4X3_u8GetKeyPressed29
L__KEYPAD4X3_u8GetKeyPressed30:
	MOVFF       _u16DataColumnsRef+0, FSR0
	MOVFF       _u16DataColumnsRef+1, FSR0H
	MOVFF       _u16DataColumnsRef+0, FSR1
	MOVFF       _u16DataColumnsRef+1, FSR1H
	MOVF        R0, 0 
	IORWF       POSTINC0+0, 1 
;keypad4x3.c,78 :: 		for (u8Column = 0; u8Column < 3; u8Column += 1)
	INCF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 1 
;keypad4x3.c,92 :: 		}
	GOTO        L_KEYPAD4X3_u8GetKeyPressed0
L_KEYPAD4X3_u8GetKeyPressed1:
;keypad4x3.c,94 :: 		KEYPAD4X3_DEACTIVATE();
	COMF        _u8MaskRows+0, 0 
	MOVWF       R0 
	MOVFF       _u16DirectionRowsRef+0, FSR0
	MOVFF       _u16DirectionRowsRef+1, FSR0H
	MOVFF       _u16DirectionRowsRef+0, FSR1
	MOVFF       _u16DirectionRowsRef+1, FSR1H
	MOVF        R0, 0 
	ANDWF       POSTINC0+0, 1 
	COMF        _u8MaskColumns+0, 0 
	MOVWF       R0 
	MOVFF       _u16DataColumnsRef+0, FSR0
	MOVFF       _u16DataColumnsRef+1, FSR0H
	MOVFF       _u16DataColumnsRef+0, FSR1
	MOVFF       _u16DataColumnsRef+1, FSR1H
	MOVF        R0, 0 
	ANDWF       POSTINC0+0, 1 
	COMF        _u8MaskRows+0, 0 
	MOVWF       R0 
	MOVFF       _u16DataRowsRef+0, FSR0
	MOVFF       _u16DataRowsRef+1, FSR0H
	MOVFF       _u16DataRowsRef+0, FSR1
	MOVFF       _u16DataRowsRef+1, FSR1H
	MOVF        R0, 0 
	ANDWF       POSTINC0+0, 1 
	COMF        _u8MaskRows+0, 0 
	MOVWF       R0 
	MOVFF       _u16DirectionRowsRef+0, FSR0
	MOVFF       _u16DirectionRowsRef+1, FSR0H
	MOVFF       _u16DirectionRowsRef+0, FSR1
	MOVFF       _u16DirectionRowsRef+1, FSR1H
	MOVF        R0, 0 
	ANDWF       POSTINC0+0, 1 
	MOVFF       _u16DirectionColumnsRef+0, FSR0
	MOVFF       _u16DirectionColumnsRef+1, FSR0H
	MOVFF       _u16DirectionColumnsRef+0, FSR1
	MOVFF       _u16DirectionColumnsRef+1, FSR1H
	MOVF        _u8MaskColumns+0, 0 
	IORWF       POSTINC0+0, 1 
;keypad4x3.c,96 :: 		if (u8Column != 3)
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed5
;keypad4x3.c,98 :: 		switch(u8RowRead)
	GOTO        L_KEYPAD4X3_u8GetKeyPressed6
;keypad4x3.c,100 :: 		case 0x0E:
L_KEYPAD4X3_u8GetKeyPressed8:
;keypad4x3.c,101 :: 		u8Key = u8Keymap[0][u8Column];
	MOVLW       _u8Keymap+0
	ADDWF       KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_u8Keymap+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_u8Keymap+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0
;keypad4x3.c,102 :: 		break;
	GOTO        L_KEYPAD4X3_u8GetKeyPressed7
;keypad4x3.c,103 :: 		case 0x0D:
L_KEYPAD4X3_u8GetKeyPressed9:
;keypad4x3.c,104 :: 		u8Key = u8Keymap[1][u8Column];
	MOVLW       _u8Keymap+3
	ADDWF       KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_u8Keymap+3)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_u8Keymap+3)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0
;keypad4x3.c,105 :: 		break;
	GOTO        L_KEYPAD4X3_u8GetKeyPressed7
;keypad4x3.c,106 :: 		case 0x0B:
L_KEYPAD4X3_u8GetKeyPressed10:
;keypad4x3.c,107 :: 		u8Key = u8Keymap[2][u8Column];
	MOVLW       _u8Keymap+6
	ADDWF       KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_u8Keymap+6)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_u8Keymap+6)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0
;keypad4x3.c,108 :: 		break;
	GOTO        L_KEYPAD4X3_u8GetKeyPressed7
;keypad4x3.c,109 :: 		case 0x07:
L_KEYPAD4X3_u8GetKeyPressed11:
;keypad4x3.c,110 :: 		u8Key = u8Keymap[3][u8Column];
	MOVLW       _u8Keymap+9
	ADDWF       KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_u8Keymap+9)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_u8Keymap+9)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0
;keypad4x3.c,111 :: 		break;
	GOTO        L_KEYPAD4X3_u8GetKeyPressed7
;keypad4x3.c,112 :: 		default:
L_KEYPAD4X3_u8GetKeyPressed12:
;keypad4x3.c,113 :: 		u8Key = u8Key;
;keypad4x3.c,114 :: 		}
	GOTO        L_KEYPAD4X3_u8GetKeyPressed7
L_KEYPAD4X3_u8GetKeyPressed6:
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8RowRead_L0+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed8
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8RowRead_L0+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed9
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8RowRead_L0+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed10
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8RowRead_L0+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed11
	GOTO        L_KEYPAD4X3_u8GetKeyPressed12
L_KEYPAD4X3_u8GetKeyPressed7:
;keypad4x3.c,115 :: 		}
L_KEYPAD4X3_u8GetKeyPressed5:
;keypad4x3.c,117 :: 		if ((u8Pressed) && (u8Pressed != u8Key))
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Pressed_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed15
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Pressed_L0+0, 0 
	XORWF       KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed15
L__KEYPAD4X3_u8GetKeyPressed24:
;keypad4x3.c,120 :: 		u8Column = u8Pressed;
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Pressed_L0+0, 0 
	MOVWF       KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0 
;keypad4x3.c,121 :: 		u8Pressed = u8Key;
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0, 0 
	MOVWF       KEYPAD4X3_u8GetKeyPressed_u8Pressed_L0+0 
;keypad4x3.c,122 :: 		u8Key = u8Column;
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	MOVWF       KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0 
;keypad4x3.c,123 :: 		}
	GOTO        L_KEYPAD4X3_u8GetKeyPressed16
L_KEYPAD4X3_u8GetKeyPressed15:
;keypad4x3.c,124 :: 		else if ((!u8Pressed) && u8Key)
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Pressed_L0+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed19
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed19
L__KEYPAD4X3_u8GetKeyPressed23:
;keypad4x3.c,127 :: 		u8Pressed = u8Key;
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0, 0 
	MOVWF       KEYPAD4X3_u8GetKeyPressed_u8Pressed_L0+0 
;keypad4x3.c,128 :: 		return '\0';
	CLRF        R0 
	GOTO        L_end_KEYPAD4X3_u8GetKeyPressed
;keypad4x3.c,129 :: 		}
L_KEYPAD4X3_u8GetKeyPressed19:
;keypad4x3.c,130 :: 		else if (u8Pressed == u8Key)
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Pressed_L0+0, 0 
	XORWF       KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed21
;keypad4x3.c,133 :: 		return '\0';
	CLRF        R0 
	GOTO        L_end_KEYPAD4X3_u8GetKeyPressed
;keypad4x3.c,134 :: 		}
L_KEYPAD4X3_u8GetKeyPressed21:
;keypad4x3.c,138 :: 		return u8Key;
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0, 0 
	MOVWF       R0 
	GOTO        L_end_KEYPAD4X3_u8GetKeyPressed
;keypad4x3.c,139 :: 		}
L_KEYPAD4X3_u8GetKeyPressed16:
;keypad4x3.c,140 :: 		}
L_end_KEYPAD4X3_u8GetKeyPressed:
	RETURN      0
; end of _KEYPAD4X3_u8GetKeyPressed
