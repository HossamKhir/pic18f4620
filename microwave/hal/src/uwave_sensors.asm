
_UWAVE_SENSORS_vidInit:

;uwave_sensors.c,10 :: 		UWAVE_SENSORS_vidInit(void)
;uwave_sensors.c,12 :: 		ADCON1          |=  0X0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;uwave_sensors.c,14 :: 		u8DoorClosed    =   0x00;
	CLRF        uwave_sensors_u8DoorClosed+0 
;uwave_sensors.c,15 :: 		u8WeightFound   =   0x00;
	CLRF        uwave_sensors_u8WeightFound+0 
;uwave_sensors.c,17 :: 		INTERRUPT_vidInit();
	CALL        _INTERRUPT_vidInit+0, 0
;uwave_sensors.c,18 :: 		UWAVE_SENSOR_DOOR_ACTIVATE();
	BSF         TRISB+0, 1 
;uwave_sensors.c,19 :: 		UWAVE_SENSOR_WEIGHT_ACTIVATE();
	BSF         TRISB+0, 2 
;uwave_sensors.c,21 :: 		INTERRUPT_CLR_FLAG(INTERRUPT_REG_INT1_EN_FLAG_PR,IntFlag_RB_INT1);
	BCF         INTCON3+0, 0 
;uwave_sensors.c,22 :: 		INTERRUPT_CLR_FLAG(INTERRUPT_REG_INT2_EN_FLAG_PR,IntFlag_INT0_INT2);
	BCF         INTCON3+0, 1 
;uwave_sensors.c,24 :: 		INTERRUPT_vidSetPriority(IntPr_INT1,Pr_Low);
	MOVLW       6
	MOVWF       FARG_INTERRUPT_vidSetPriority+0 
	CLRF        FARG_INTERRUPT_vidSetPriority+0 
	CALL        _INTERRUPT_vidSetPriority+0, 0
;uwave_sensors.c,25 :: 		INTERRUPT_vidSetPriority(IntPr_INT2,Pr_Low);
	MOVLW       7
	MOVWF       FARG_INTERRUPT_vidSetPriority+0 
	CLRF        FARG_INTERRUPT_vidSetPriority+0 
	CALL        _INTERRUPT_vidSetPriority+0, 0
;uwave_sensors.c,27 :: 		INTERRUPT_INT_EDGE_FALLING(EdgeSelExtInt1);
	BCF         INTCON2+0, 5 
;uwave_sensors.c,28 :: 		INTERRUPT_INT_EDGE_FALLING(EdgeSelExtInt2);
	BCF         INTCON2+0, 4 
;uwave_sensors.c,30 :: 		UWAVE_SENSOR_ENABLE_DOOR();
	BSF         INTCON3+0, 3 
;uwave_sensors.c,31 :: 		UWAVE_SENSOR_ENABLE_WEIGHT();
	BSF         INTCON3+0, 4 
;uwave_sensors.c,32 :: 		}
L_end_UWAVE_SENSORS_vidInit:
	RETURN      0
; end of _UWAVE_SENSORS_vidInit
