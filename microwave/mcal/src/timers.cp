#line 1 "E:/embedded_diploma/projects/pic/microwave/mcal/src/timers.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"



typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;
typedef unsigned long uint64;


typedef uint8* uint8Ref;
typedef uint16* uint16Ref;
typedef uint32* uint32Ref;
typedef uint64* uint64Ref;

typedef struct {
 uint8 u8Seconds;
 uint8 u8Minutes;
 uint16 u16TimeDisplay;
}HeatingTime;

typedef HeatingTime* HeatingTimeRef;
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 56 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
const enum enPrescale {
 P1,
 P2,
 P4,
 P8,
 P16,
 P32,
 P64,
 P128,
 P256
};

void TIMERS_vidInitTimer(uint8, const enum enPrescale, uint64, uint64);
void TIMERS_vidUpdateInitialCount(uint64 , uint8, static enum enPrescale);
void TIMERS_vidResetTimer(uint8 );
#line 3 "E:/embedded_diploma/projects/pic/microwave/mcal/src/timers.c"
uint64 u64InitialCount = 0;


const unsigned short u16Prescaler[4][9][2] = {

 {{0,0}, {0,2}, {1,4}, {2,8}, {3,16}, {4,32}, {5,64}, {6,128}, {7,256}},
 {{0,1}, {1,2}, {2,4}, {3,8}, {0,0}, {0,0}, {0,0}, {0,0}, {0,0}},
 {{0,1}, {0,0}, {1,4}, {0,0}, {2,16}, {0,0}, {0,0}, {0,0}, {0,0}},
 {{0,1}, {1,2}, {2,4}, {3,8}, {0,0}, {0,0}, {0,0}, {0,0}, {0,0}}
};


static void
TIMERS_vidSetPrescale(uint8 u8TimerID, static enum enPrescale prescale)
{
 switch (u8TimerID)
 {
 case  0 :
  ( T0CON )  |= (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
 break;
 case  1 :
  ( T1CON )  |= (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
 break;
 case  2 :
  ( T2CON )  |= (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
 break;
 case  3 :
  ( T3CON )  |= (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
 break;
 }
}

void
TIMERS_vidInitTimer(uint8 u8TimerID,
 const enum enPrescale prescale,
 uint64 u64TargetTime,
 uint64 u64TimeUnit
)
{
 u64TargetTime =  ((u64TargetTime)*(u64TimeUnit)) ;
 TIMERS_vidUpdateInitialCount(u64TargetTime, u8TimerID, prescale);
 TIMERS_vidSetPrescale(u8TimerID, prescale);
 TIMERS_vidResetTimer(u8TimerID);
}

void
TIMERS_vidUpdateInitialCount(uint64 u64TargetTime,
 uint8 u8TimerID,
 static enum enPrescale prescale
)
{
 u64InitialCount =  (0xFFFF+1)  - (u64TargetTime / ( ((1.0/( 8000000UL /4.0))* 1000000 )  * (double)u16Prescaler[u8TimerID][prescale][1]));
}

void
TIMERS_vidResetTimer(uint8 u8TimerID)
{
 switch (u8TimerID)
 {
 case  0 :
  { TMR0L = (((u64InitialCount))&0xFF) ; TMR0H = ( ((((u64InitialCount))>>8)&0xFF) ) ; } ;
  (INTCON. TMR0IF =0) ;
 break;
 case  1 :
  { TMR1L = (((u64InitialCount))&0xFF) ; TMR1H = ( ((((u64InitialCount))>>8)&0xFF) ) ; } ;
  (INTCON. TMR1IF =0) ;
 break;
 case  3 :
  { TMR3L = (((u64InitialCount))&0xFF) ; TMR3H = ( ((((u64InitialCount))>>8)&0xFF) ) ; } ;
  (INTCON. TMR3IF =0) ;
 break;
 case  2 :

 TMR2 =  ((u64InitialCount)&0xFF) ;

  (INTCON. TMR2IF =0) ;
 break;
 }
}
