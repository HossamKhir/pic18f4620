#ifndef _SEGMENT7_H_
#define _SEGMENT7_H_

#define MASK_DISPLAY_DATA_DIRECTION     (~(0b011111111))
      
void SEGMENT7_vidInit(unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned char);
void SEGMENT7_vidDisplayDigit(unsigned char, unsigned char);

#endif