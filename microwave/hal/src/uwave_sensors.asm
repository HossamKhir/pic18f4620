
_UWAVE_SENSORS_vidInit:

;uwave_sensors.c,10 :: 		UWAVE_SENSORS_vidInit(void)
;uwave_sensors.c,12 :: 		u8DoorClosed=0x00;
	CLRF        uwave_sensors_u8DoorClosed+0 
;uwave_sensors.c,13 :: 		u8WeightFound=0x00;
	CLRF        uwave_sensors_u8WeightFound+0 
;uwave_sensors.c,14 :: 		}
L_end_UWAVE_SENSORS_vidInit:
	RETURN      0
; end of _UWAVE_SENSORS_vidInit
