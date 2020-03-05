
_UWAVE_SENSORS_vidInit:

;uwave_sensors.c,7 :: 		UWAVE_SENSORS_vidInit(void)
;uwave_sensors.c,9 :: 		ADCON1          |=  0X0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;uwave_sensors.c,11 :: 		u8DoorClosed    =   0x00;
	CLRF        _u8DoorClosed+0 
;uwave_sensors.c,12 :: 		u8WeightFound   =   0x00;
	CLRF        _u8WeightFound+0 
;uwave_sensors.c,14 :: 		INTERRUPT_vidInit();
	CALL        _INTERRUPT_vidInit+0, 0
;uwave_sensors.c,15 :: 		UWAVE_SENSOR_DOOR_ACTIVATE();
	BSF         TRISB+0, 1 
;uwave_sensors.c,16 :: 		UWAVE_SENSOR_WEIGHT_ACTIVATE();
	BSF         TRISB+0, 2 
;uwave_sensors.c,18 :: 		INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_INT1,IntFlag_RB_INT1_TMR1_CCP2);
	BCF         INTCON3+0, 0 
;uwave_sensors.c,19 :: 		INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_INT2,IntFlag_INT0_INT2_TMR2_TMR3);
	BCF         INTCON3+0, 1 
;uwave_sensors.c,21 :: 		INTERRUPT_vidSetPriority(IntPr_INT1_ADC_CM,Pr_Low);
	MOVLW       6
	MOVWF       FARG_INTERRUPT_vidSetPriority+0 
	CLRF        FARG_INTERRUPT_vidSetPriority+0 
	CALL        _INTERRUPT_vidSetPriority+0, 0
;uwave_sensors.c,22 :: 		INTERRUPT_vidSetPriority(IntPr_INT2_PSP_OSCF,Pr_Low);
	MOVLW       7
	MOVWF       FARG_INTERRUPT_vidSetPriority+0 
	CLRF        FARG_INTERRUPT_vidSetPriority+0 
	CALL        _INTERRUPT_vidSetPriority+0, 0
;uwave_sensors.c,24 :: 		INTERRUPT_INT_EDGE_FALLING(EdgeSelExtInt1);
	BCF         INTCON2+0, 5 
;uwave_sensors.c,25 :: 		INTERRUPT_INT_EDGE_FALLING(EdgeSelExtInt2);
	BCF         INTCON2+0, 4 
;uwave_sensors.c,27 :: 		UWAVE_SENSOR_ENABLE_DOOR();
	BSF         INTCON3+0, 3 
;uwave_sensors.c,28 :: 		UWAVE_SENSOR_ENABLE_WEIGHT();
	BSF         INTCON3+0, 4 
;uwave_sensors.c,29 :: 		}
L_end_UWAVE_SENSORS_vidInit:
	RETURN      0
; end of _UWAVE_SENSORS_vidInit
