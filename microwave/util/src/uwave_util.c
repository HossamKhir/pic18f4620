#include "uwave_util.h"

void
UWAVE_UTIL_vidUpdateTime(HeatingTimeRef timeout)
{
    timeout->u8Seconds = timeout->u16TimeDisplay % 100;
    timeout->u8Minutes = timeout->u16TimeDisplay / 100;
}

void
UWAVE_UTIL_vidSetTime(HeatingTimeRef timeout, uint16 u16Time)
{
    timeout->u16TimeDisplay = u16Time % 10000;
    UWAVE_UTIL_vidUpdateTime(timeout);
}


uint8
UWAVE_UTIL_u8DecrementTime(HeatingTimeRef timeoutRef)
{
    if (timeoutRef->u8Seconds == 0)
    {
        if (timeoutRef->u8Minutes > 0)
        {
            timeoutRef->u8Minutes -= 1;
            timeoutRef->u8Seconds = 59;
        }
        else
        {
            return 1;
        }
    }
    else
    {
        timeoutRef->u8Seconds -= 1;
    }
    return 0;
}
