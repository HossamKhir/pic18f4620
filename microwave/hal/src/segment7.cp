#line 1 "E:/embedded_diploma/projects/pic/microwave/hal/src/segment7.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"





void SEGMENT7_vidInit(unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned char);
void SEGMENT7_vidDisplayDigit(unsigned char, unsigned char);
#line 3 "E:/embedded_diploma/projects/pic/microwave/hal/src/segment7.c"
unsigned short *ptr_u16DirectionDisplayData;
unsigned short *ptr_u16DirectionDisplaySelect;

unsigned short *ptr_u16RegisterDisplayData;
unsigned short *ptr_u16RegisterDisplaySelect;






void
SEGMENT7_vidInit(unsigned short* ptr_u16RegisterSegmentDataDirection,
 unsigned short* ptr_u16RegisterSegmentSelectDirection,
 unsigned short* ptr_u16RegisterSegmentData,
 unsigned short* ptr_u16RegisterSegmentSelect,
 unsigned char u8SelectionMask)
{
 ptr_u16DirectionDisplayData = ptr_u16RegisterSegmentDataDirection;
 ptr_u16DirectionDisplaySelect = ptr_u16RegisterSegmentSelectDirection;

 ptr_u16RegisterDisplayData = ptr_u16RegisterSegmentData;
 ptr_u16RegisterDisplaySelect = ptr_u16RegisterSegmentSelect;

  (*ptr_u16DirectionDisplayData)  &=  (~(0b011111111)) ;
  (*ptr_u16DirectionDisplaySelect)  &= u8SelectionMask;
}

void
SEGMENT7_vidDisplayDigit(unsigned char u8DisplaySelected,
 unsigned char u8Digit)
{
  (*ptr_u16RegisterDisplaySelect)  = u8DisplaySelected;
  (*ptr_u16RegisterDisplayData)  = u8Digit;
}
