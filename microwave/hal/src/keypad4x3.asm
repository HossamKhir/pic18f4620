
_KEYPAD4X3_vidInit:

;keypad4x3.c,34 :: 		uint8 u8ColumnsMask)
;keypad4x3.c,36 :: 		ADCON1 |= 0X0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;keypad4x3.c,38 :: 		u16DirectionRowsRef    = u16RowsDirectionRef;
	MOVF        FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+0, 0 
	MOVWF       _u16DirectionRowsRef+0 
	MOVF        FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+1, 0 
	MOVWF       _u16DirectionRowsRef+1 
;keypad4x3.c,39 :: 		u16DirectionColumnsRef = u16ColumnsDirectionRef;
	MOVF        FARG_KEYPAD4X3_vidInit_u16ColumnsDirectionRef+0, 0 
	MOVWF       _u16DirectionColumnsRef+0 
	MOVF        FARG_KEYPAD4X3_vidInit_u16ColumnsDirectionRef+1, 0 
	MOVWF       _u16DirectionColumnsRef+1 
;keypad4x3.c,40 :: 		u16DataRowsRef         = u16RowsDataRef;
	MOVF        FARG_KEYPAD4X3_vidInit_u16RowsDataRef+0, 0 
	MOVWF       _u16DataRowsRef+0 
	MOVF        FARG_KEYPAD4X3_vidInit_u16RowsDataRef+1, 0 
	MOVWF       _u16DataRowsRef+1 
;keypad4x3.c,41 :: 		u16DataColumnsRef      = u16ColumnsDataRef;
	MOVF        FARG_KEYPAD4X3_vidInit_u16ColumnsDataRef+0, 0 
	MOVWF       _u16DataColumnsRef+0 
	MOVF        FARG_KEYPAD4X3_vidInit_u16ColumnsDataRef+1, 0 
	MOVWF       _u16DataColumnsRef+1 
;keypad4x3.c,43 :: 		u8MaskRows    = u8RowsMask;
	MOVF        FARG_KEYPAD4X3_vidInit_u8RowsMask+0, 0 
	MOVWF       _u8MaskRows+0 
;keypad4x3.c,44 :: 		u8MaskColumns = u8ColumnsMask;
	MOVF        FARG_KEYPAD4X3_vidInit_u8ColumnsMask+0, 0 
	MOVWF       _u8MaskColumns+0 
;keypad4x3.c,46 :: 		SET_BITS(KEYPAD_DIRECTION_ROWS, KEYPAD_ROWS);
	MOVFF       FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+0, FSR0
	MOVFF       FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+1, FSR0H
	MOVFF       FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+0, FSR1
	MOVFF       FARG_KEYPAD4X3_vidInit_u16RowsDirectionRef+1, FSR1H
	MOVF        FARG_KEYPAD4X3_vidInit_u8RowsMask+0, 0 
	IORWF       POSTINC0+0, 1 
;keypad4x3.c,47 :: 		SET_BITS(KEYPAD_DATA_COLUMNS, KEYPAD_COLUMNS);
	MOVFF       _u16DataColumnsRef+0, FSR0
	MOVFF       _u16DataColumnsRef+1, FSR0H
	MOVFF       _u16DataColumnsRef+0, FSR1
	MOVFF       _u16DataColumnsRef+1, FSR1H
	MOVF        _u8MaskColumns+0, 0 
	IORWF       POSTINC0+0, 1 
;keypad4x3.c,48 :: 		SET_BITS(KEYPAD_DATA_ROWS, KEYPAD_ROWS);
	MOVFF       _u16DataRowsRef+0, FSR0
	MOVFF       _u16DataRowsRef+1, FSR0H
	MOVFF       _u16DataRowsRef+0, FSR1
	MOVFF       _u16DataRowsRef+1, FSR1H
	MOVF        _u8MaskRows+0, 0 
	IORWF       POSTINC0+0, 1 
;keypad4x3.c,49 :: 		SET_BITS(KEYPAD_DIRECTION_ROWS, KEYPAD_ROWS);
	MOVFF       _u16DirectionRowsRef+0, FSR0
	MOVFF       _u16DirectionRowsRef+1, FSR0H
	MOVFF       _u16DirectionRowsRef+0, FSR1
	MOVFF       _u16DirectionRowsRef+1, FSR1H
	MOVF        _u8MaskRows+0, 0 
	IORWF       POSTINC0+0, 1 
;keypad4x3.c,50 :: 		CLR_BITS(KEYPAD_DIRECTION_COLUMNS, KEYPAD_COLUMNS);
	COMF        _u8MaskColumns+0, 0 
	MOVWF       R0 
	MOVFF       _u16DirectionColumnsRef+0, FSR0
	MOVFF       _u16DirectionColumnsRef+1, FSR0H
	MOVFF       _u16DirectionColumnsRef+0, FSR1
	MOVFF       _u16DirectionColumnsRef+1, FSR1H
	MOVF        R0, 0 
	ANDWF       POSTINC0+0, 1 
;keypad4x3.c,51 :: 		}
L_end_KEYPAD4X3_vidInit:
	RETURN      0
; end of _KEYPAD4X3_vidInit

_KEYPAD4X3_u8GetKeyPressed:

;keypad4x3.c,54 :: 		KEYPAD4X3_u8GetKeyPressed(void)
;keypad4x3.c,56 :: 		uint8 u8Key = '\0';
	CLRF        KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0 
	CLRF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0 
	CLRF        KEYPAD4X3_u8GetKeyPressed_u8RowRead_L0+0 
;keypad4x3.c,60 :: 		SET_BITS(KEYPAD_DATA_COLUMNS, KEYPAD_COLUMNS);
	MOVFF       _u16DataColumnsRef+0, FSR0
	MOVFF       _u16DataColumnsRef+1, FSR0H
	MOVFF       _u16DataColumnsRef+0, FSR1
	MOVFF       _u16DataColumnsRef+1, FSR1H
	MOVF        _u8MaskColumns+0, 0 
	IORWF       POSTINC0+0, 1 
;keypad4x3.c,62 :: 		for (u8Column = 0; u8Column < 3; u8Column += 1)
	CLRF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0 
L_KEYPAD4X3_u8GetKeyPressed0:
	MOVLW       3
	SUBWF       KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed1
;keypad4x3.c,64 :: 		CLR_BIT(KEYPAD_DATA_COLUMNS, u8Column);
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__KEYPAD4X3_u8GetKeyPressed15:
	BZ          L__KEYPAD4X3_u8GetKeyPressed16
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__KEYPAD4X3_u8GetKeyPressed15
L__KEYPAD4X3_u8GetKeyPressed16:
	COMF        R0, 1 
	MOVFF       _u16DataColumnsRef+0, FSR0
	MOVFF       _u16DataColumnsRef+1, FSR0H
	MOVFF       _u16DataColumnsRef+0, FSR1
	MOVFF       _u16DataColumnsRef+1, FSR1H
	MOVF        R0, 0 
	ANDWF       POSTINC0+0, 1 
;keypad4x3.c,66 :: 		u8RowRead = GET_VAL_REG(KEYPAD_DATA_ROWS, KEYPAD_ROWS);
	MOVFF       _u16DataRowsRef+0, FSR0
	MOVFF       _u16DataRowsRef+1, FSR0H
	MOVF        _u8MaskRows+0, 0 
	ANDWF       POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       KEYPAD4X3_u8GetKeyPressed_u8RowRead_L0+0 
;keypad4x3.c,68 :: 		if (u8RowRead != KEYPAD_ROWS)
	MOVF        R1, 0 
	XORWF       _u8MaskRows+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed3
;keypad4x3.c,70 :: 		break;
	GOTO        L_KEYPAD4X3_u8GetKeyPressed1
;keypad4x3.c,71 :: 		}
L_KEYPAD4X3_u8GetKeyPressed3:
;keypad4x3.c,74 :: 		SET_BIT(KEYPAD_DATA_COLUMNS, u8Column);
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__KEYPAD4X3_u8GetKeyPressed17:
	BZ          L__KEYPAD4X3_u8GetKeyPressed18
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__KEYPAD4X3_u8GetKeyPressed17
L__KEYPAD4X3_u8GetKeyPressed18:
	MOVFF       _u16DataColumnsRef+0, FSR0
	MOVFF       _u16DataColumnsRef+1, FSR0H
	MOVFF       _u16DataColumnsRef+0, FSR1
	MOVFF       _u16DataColumnsRef+1, FSR1H
	MOVF        R0, 0 
	IORWF       POSTINC0+0, 1 
;keypad4x3.c,62 :: 		for (u8Column = 0; u8Column < 3; u8Column += 1)
	INCF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 1 
;keypad4x3.c,76 :: 		}
	GOTO        L_KEYPAD4X3_u8GetKeyPressed0
L_KEYPAD4X3_u8GetKeyPressed1:
;keypad4x3.c,78 :: 		if (u8Column != 3)
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Column_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_KEYPAD4X3_u8GetKeyPressed5
;keypad4x3.c,80 :: 		switch(u8RowRead)
	GOTO        L_KEYPAD4X3_u8GetKeyPressed6
;keypad4x3.c,82 :: 		case 0x0E:
L_KEYPAD4X3_u8GetKeyPressed8:
;keypad4x3.c,83 :: 		u8Key = u8Keymap[0][u8Column];
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
;keypad4x3.c,84 :: 		break;
	GOTO        L_KEYPAD4X3_u8GetKeyPressed7
;keypad4x3.c,85 :: 		case 0x0D:
L_KEYPAD4X3_u8GetKeyPressed9:
;keypad4x3.c,86 :: 		u8Key = u8Keymap[1][u8Column];
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
;keypad4x3.c,87 :: 		break;
	GOTO        L_KEYPAD4X3_u8GetKeyPressed7
;keypad4x3.c,88 :: 		case 0x0B:
L_KEYPAD4X3_u8GetKeyPressed10:
;keypad4x3.c,89 :: 		u8Key = u8Keymap[2][u8Column];
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
;keypad4x3.c,90 :: 		break;
	GOTO        L_KEYPAD4X3_u8GetKeyPressed7
;keypad4x3.c,91 :: 		case 0x07:
L_KEYPAD4X3_u8GetKeyPressed11:
;keypad4x3.c,92 :: 		u8Key = u8Keymap[3][u8Column];
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
;keypad4x3.c,93 :: 		break;
	GOTO        L_KEYPAD4X3_u8GetKeyPressed7
;keypad4x3.c,94 :: 		default:
L_KEYPAD4X3_u8GetKeyPressed12:
;keypad4x3.c,95 :: 		u8Key = u8Key;
;keypad4x3.c,96 :: 		}
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
;keypad4x3.c,97 :: 		}
L_KEYPAD4X3_u8GetKeyPressed5:
;keypad4x3.c,99 :: 		return u8Key;
	MOVF        KEYPAD4X3_u8GetKeyPressed_u8Key_L0+0, 0 
	MOVWF       R0 
;keypad4x3.c,100 :: 		}
L_end_KEYPAD4X3_u8GetKeyPressed:
	RETURN      0
; end of _KEYPAD4X3_u8GetKeyPressed
