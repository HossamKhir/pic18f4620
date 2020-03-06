/*
 ============================================================================
 Name        : uwave_util.c
 Author      : Hossam Khairullah
 Version     : 1.0
 Copyright   : 
 Description : 
 ============================================================================
*/

/******************************************************************************/
/*****************************INCLUDES*****************************************/
/******************************************************************************/
#include "uwave_util.h"

/******************************************************************************/
/*****************************TYPES********************************************/
/******************************************************************************/


/******************************************************************************/
/*****************************DEFINES******************************************/
/******************************************************************************/

/******************************************************************************/
/*****************************MACROS*******************************************/
/******************************************************************************/

/******************************************************************************/
/*****************************GLOBALS******************************************/
/******************************************************************************/
uint8 u8OverflowFlag    = 0;
uint8 u8HeatingEndFlag  = 0;
uint8 u8WeightFound     = 0;
uint8 u8DoorClosed      = 1;
uint16 u16HeatingTime   = 90;

enStateMachine currentState = STATE_IDLE;

/******************************************************************************/
/*****************************PROTOTYPES***************************************/
/******************************************************************************/

/******************************************************************************/
/*****************************DEFINITIONS**************************************/
/******************************************************************************/
uint8
UWAVE_UTIL_u8DecrementTime(uint16Ref u16TimeRef)
{
    if (DEREF(u16TimeRef))
    {
        DEREF(u16TimeRef) -= (DEREF(u16TimeRef) % 100)? 1 : 41;
        return 0;
    }
    return 1;
}

// where the magic happens
void
UWAVE_UTIL_vidScheduler(void)
{
    uint8 u8Key = '\0';
    while(1)
    {
        if (u8OverflowFlag)
        {
            u8Key = UWAVE_KEYPAD_GET_KEY();

            // precautional call to activate sensors
            UWAVE_SENSORS_ACTIVATE();

            switch (currentState)
            {
                case STATE_IDLE:
                    switch (u8Key)
                    {
                        case 's':   // start
                            if (u8DoorClosed && u8WeightFound && u16HeatingTime)
                            {
                                currentState = STATE_HEAT;
                                u8HeatingEndFlag = 0;
                                UWAVE_MOTOR_START();
                                UWAVE_HEATER_ON();
                                LAMP_ON();
                            }
                            else
                            {
                                // FIXME: delete this else unless needed
                            }
                        break;
                        case 'h':   // halt
                            u8HeatingEndFlag = 0;   // remove flag for display
                            u16HeatingTime = 0;
                        break;
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':   // a digit
                            u8HeatingEndFlag = 0;   // remove flag for display
                            u16HeatingTime = (u16HeatingTime * 10) + (u8Key - '0');
                        break;
                    }
                break;
                case STATE_HEAT:
                    if (u8OverflowFlag >= 3)
                    {
                        u8OverflowFlag = 0; // reset counter
                        // decrement time
                        if(UWAVE_UTIL_u8DecrementTime(REF(u16HeatingTime)))
                        {
                            UWAVE_HEATER_OFF();
                            UWAVE_MOTOR_HALT();
                            LAMP_OFF();
                            u8HeatingEndFlag = 1;
                        }
                        else
                        {
                            // FIXME: delete this else unless needed
                        }
                    }
                    switch (u8Key)
                    {
                        case 's':   // start
                            // FIXME: there is no effect for pressing start while heating
                        break;
                        case 'h':   // halt
                            currentState = STATE_IDLE;
                            UWAVE_MOTOR_HALT();
                            UWAVE_HEATER_OFF();
                            LAMP_OFF();
                        break;  // there are no effects for numbers
                    }
                break;
            }
        }

        if ((currentState == STATE_HEAT) && !(u8DoorClosed && u8WeightFound))
        {
            // door is opened or weight is not present (probably a circuit issue)
            currentState = STATE_IDLE;
            UWAVE_MOTOR_HALT();
            UWAVE_HEATER_OFF();
            LAMP_OFF();
        }

        if (u8HeatingEndFlag)
        {
            UWAVE_DISPLAY_vidDisplayEnd();
        }
        else 
        {
            UWAVE_DISPLAY_vidUpdateTimeDisplay(u16HeatingTime);
        }
    }

}