#include "uwave_display.h"

uint8 u8SecondsUnits = 0;
uint8 u8SecondsTens  = 0;
uint8 u8MinutesUnits = 0;
uint8 u8MinutesTens  = 0;

static void
vidGetTimeDigits(HeatingTimeRef timeoutRef)
{
    u8SecondsUnits = (timeoutRef->u8Seconds) % 10;
    u8SecondsTens  = (timeoutRef->u8Seconds) / 10;
    u8MinutesUnits = (timeoutRef->u8Minutes) % 10;
    u8MinutesTens  = (timeoutRef->u8Minutes) / 10;
}

void
UWAVE_DISPLAY_vidUpdateTimeDisplay(HeatingTimeRef timeoutRef)
{
    static uint8 u8CurrentCursor = 0;

    vidGetTimeDigits(timeoutRef);
    
    switch (u8CurrentCursor++)
    {
        case 0:
            SEGMENT7_vidDisplayDigit(MASK_SECONDS_UNITS, u8SecondsUnits);
        break;
        case 1:
            SEGMENT7_vidDisplayDigit(MASK_SECONDS_TENS, u8SecondsTens);
        break;
        case 2:
            SEGMENT7_vidDisplayDigit(MASK_MINUTES_UNITS, u8MinutesUnits);
        break;
        case 3:
            SEGMENT7_vidDisplayDigit(MASK_MINUTES_TENS, u8MinutesTens);
        break;
        default:
            u8CurrentCursor = 0;
    }

}

void
UWAVE_DISPLAY_vidDisplayEnd(void)
{
    static char u8CurrentCursor = 0;
    
    switch (u8CurrentCursor++)
    {
        case 0:
            SEGMENT7_vidDisplayFigure(MASK_MINUTES_UNITS, UWAVE_DISPLAY_E);
        break;
        case 1:
            SEGMENT7_vidDisplayFigure(MASK_SECONDS_TENS, UWAVE_DISPLAY_N);
        break;
        case 2:
            SEGMENT7_vidDisplayFigure(MASK_SECONDS_UNITS, UWAVE_DISPLAY_D);
        break;
        default:
            u8CurrentCursor = 0;
    }
}