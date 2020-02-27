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

    vidGetTimeDigits(timeoutRef);

    SEGMENT7_vidDisplayDigit(MASK_SECONDS_UNITS, u8SecondsUnits);
    Delay_us(1250);
    SEGMENT7_vidDisplayDigit(MASK_SECONDS_TENS, u8SecondsTens);
    Delay_us(1250);
    SEGMENT7_vidDisplayDigit(MASK_MINUTES_UNITS, u8MinutesUnits);
    Delay_us(1250);
    SEGMENT7_vidDisplayDigit(MASK_MINUTES_TENS, u8MinutesTens);
    Delay_us(1250);
}