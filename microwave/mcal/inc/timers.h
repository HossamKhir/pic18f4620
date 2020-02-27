#ifndef _TIMERS_H_
#define _TIMERS_H_


#include "data_types.h"
#include "macros.h"

#define TIMER0  0
#define TIMER1  1
#define TIMER2  2
#define TIMER3  3

#define TTIMER0CON  T0CON
#define TTIMER1CON  T1CON
#define TTIMER2CON  T2CON
#define TTIMER3CON  T3CON

#define TMRTIMER0IF TMR0IF
#define TMRTIMER1IF TMR1IF
#define TMRTIMER2IF TMR2IF
#define TMRTIMER3IF TMR3IF

#define TMRTIMER0L  TMR0L
#define TMRTIMER1L  TMR1L
#define TMRTIMER3L  TMR3L

#define TMRTIMER0H  TMR0H
#define TMRTIMER1H  TMR1H
#define TMRTIMER3H  TMR3H

#define TMRTIMER0ON TMR0ON
#define TMRTIMER1ON TMR1ON
#define TMRTIMER2ON TMR2ON
#define TMRTIMER3ON TMR3ON

// time units
#define USECOND 1
#define MSECOND 1000
#define SECOND  1000000

#define FOSC            8000000UL
#define CYCLE_PERIOD    ((1.0/(FOSC/4.0))*SECOND)
#define FULL_COUNT      (0xFFFF+1)

#define GET_TIME_IN_USEC(TIME_GIVEN,TIME_UNIT)  ((TIME_GIVEN)*(TIME_UNIT))
#define GET_TIME_REG_LOW(VAL)                   ((VAL)&0xFF)
#define GET_TIME_REG_HIGH(VAL)                  (GET_TIME_REG_LOW((VAL)>>8))
#define GET_TMR_CTRL_REG(TIMER_ID)              (T##TIMER_ID##CON)
#define CLR_TMR_INT_FLAG(TIMER_ID)             (INTCON.TMR##TIMER_ID##IF=0)
#define START_TMR(TIMER_ID)                     (T##TIMER_ID##CON.TMR##TIMER_ID##ON=1)
#define FILL_TMR_REGS(TIMER_ID,COUNT)   { \
                                            TMR##TIMER_ID##L=GET_TIME_REG_LOW((COUNT)); \
                                            TMR##TIMER_ID##H=GET_TIME_REG_HIGH((COUNT));\
                                        }

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


#endif /* _TIMERS_H_ */
