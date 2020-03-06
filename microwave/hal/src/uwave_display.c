#include "uwave_display.h"

static uint8 u8SecondsUnits = 0;
static uint8 u8SecondsTens  = 0;
static uint8 u8MinutesUnits = 0;
static uint8 u8MinutesTens  = 0;

static uint8 u8CurrentCursor = 0;

#define UWAVE_DISPLAY_CURSOR_LIMIT(TIMEOUT) (((TIMEOUT)/1000)?3:((TIMEOUT)/100)?2:((TIMEOUT)/10)?1:0) 

static void
UWAVE_DISPLAY_vidGetTimeDigits(uint16 u16Time)
{
    u8MinutesTens   = u16Time / 1000;
    u8MinutesUnits  = (u16Time % 1000) / 100;
    u8SecondsTens   = (u16Time % 100) / 10;
    u8SecondsUnits  = (u16Time % 100) % 10;
}

void
UWAVE_DISPLAY_vidUpdateTimeDisplay(uint16 u16Time)
{

    UWAVE_DISPLAY_vidGetTimeDigits(u16Time);
    
    switch (u8CurrentCursor)
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
    }

    u8CurrentCursor = (u8CurrentCursor < UWAVE_DISPLAY_CURSOR_LIMIT(u16Time))? (u8CurrentCursor + 1) : 0;
}

void
UWAVE_DISPLAY_vidDisplayEnd(void)
{
    
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