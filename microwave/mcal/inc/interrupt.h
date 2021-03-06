#ifndef _INTERRUPT_H_
#define _INTERRUPT_H_

#include "data_types.h"
#include "macros.h"
#include "uwave_util.h"

#define INTERRUPT_REG_EN_GLOBAL         (INTCON)
#define INTERRUPT_REG_EN_TMR0           (INTCON)
#define INTERRUPT_REG_EN_INT0           (INTCON)
#define INTERRUPT_REG_EN_RB             (INTCON)
#define INTERRUPT_REG_EN_RBPU           (INTCON2)
#define INTERRUPT_REG_EN_INT1           (INTCON3)
#define INTERRUPT_REG_EN_INT2           (INTCON3)
#define INTERRUPT_REG_EN_TMR1_TMR2      (PIE1)
#define INTERRUPT_REG_EN_CCP1           (PIE1)
#define INTERRUPT_REG_EN_SSP            (PIE1)
#define INTERRUPT_REG_EN_TX_RX          (PIE1)
#define INTERRUPT_REG_EN_ADC            (PIE1)
#define INTERRUPT_REG_EN_PSP            (PIE1)
#define INTERRUPT_REG_EN_CCP2           (PIE2)
#define INTERRUPT_REG_EN_TMR3           (PIE2)
#define INTERRUPT_REG_EN_HL_VOL_DET     (PIE2)
#define INTERRUPT_REG_EN_BUS_COL        (PIE2)
#define INTERRUPT_REG_EN_EEPROM         (PIE2)
#define INTERRUPT_REG_EN_COMPARATOR     (PIE2)
#define INTERRUPT_REG_EN_OSC_FAIL       (PIE2)

#define INTERRUPT_REG_FLAG_TMR0         (INTCON)
#define INTERRUPT_REG_FLAG_INT0         (INTCON)
#define INTERRUPT_REG_FLAG_RB           (INTCON)
#define INTERRUPT_REG_FLAG_INT1         (INTCON3)
#define INTERRUPT_REG_FLAG_INT2         (INTCON3)
#define INTERRUPT_REG_FLAG_TMR1_TMR2    (PIR1)
#define INTERRUPT_REG_FLAG_CCP1         (PIR1)
#define INTERRUPT_REG_FLAG_SSP          (PIR1)
#define INTERRUPT_REG_FLAG_TX_RX        (PIR1)
#define INTERRUPT_REG_FLAG_ADC          (PIR1)
#define INTERRUPT_REG_FLAG_PSP          (PIR1)
#define INTERRUPT_REG_FLAG_CCP2         (PIR2)
#define INTERRUPT_REG_FLAG_TMR3         (PIR2)
#define INTERRUPT_REG_FLAG_HL_VOL_DET   (PIR2)
#define INTERRUPT_REG_FLAG_BUS_COL      (PIR2)
#define INTERRUPT_REG_FLAG_EEPROM       (PIR2)
#define INTERRUPT_REG_FLAG_COMPARATOR   (PIR2)
#define INTERRUPT_REG_FLAG_OSC_FAIL     (PIR2)

#define INTERRUPT_REG_PR_TMR0           (INTCON2)
#define INTERRUPT_REG_PR_RB             (INTCON2)
#define INTERRUPT_REG_PR_INT1           (INTCON3)
#define INTERRUPT_REG_PR_INT2           (INTCON3)
#define INTERRUPT_REG_PR_TMR1_TMR2      (IPR1)
#define INTERRUPT_REG_PR_CCP1           (IPR1)
#define INTERRUPT_REG_PR_SSP            (IPR1)
#define INTERRUPT_REG_PR_TX_RX          (IPR1)
#define INTERRUPT_REG_PR_ADC            (IPR1)
#define INTERRUPT_REG_PR_PSP            (IPR1)
#define INTERRUPT_REG_PR_CCP2           (IPR2)
#define INTERRUPT_REG_PR_TMR3           (IPR2)
#define INTERRUPT_REG_PR_HL_VOL_DET     (IPR2)
#define INTERRUPT_REG_PR_BUS_COL        (IPR2)
#define INTERRUPT_REG_PR_EEPROM         (IPR2)
#define INTERRUPT_REG_PR_COMPARATOR     (IPR2)
#define INTERRUPT_REG_PR_OSC_FAIL       (IPR2)

#define INTERRUPT_REG_INT_EDGE          (INTCON2)
#define INTERRUPT_REG_INT_DIR           (TRISB)

#define RST_CTRL_REG                    (RCON)

#define INTERRUPT_RBPU_BIT  (7)

#define INTERRUPT_ENABLE_GLOBAL()               SET_BIT(INTERRUPT_REG_EN_GLOBAL,IntEn_GIE_PSP_OSCF)
#define INTERRUPT_ENABLE_PERIPHERAL()           SET_BIT(INTERRUPT_REG_EN_GLOBAL,IntEn_PEIE_ADC_CM)
#define INTERRUPT_ENABLE_PRIORITY()             SET_BIT(RST_CTRL_REG,IntEn_GIE_PSP_OSCF)

#define INTERRUPT_CLR_FLAG(CTRL_REG,FLAG_BIT)   CLR_BIT(CTRL_REG,FLAG_BIT)
#define INTERRUPT_ENABLE_SRC(CTRL_REG,EN_BIT)   SET_BIT(CTRL_REG,EN_BIT)
#define INTERRUPT_DISABLE_SRC(CTRL_REG,EN_BIT)  CLR_BIT(CTRL_REG,EN_BIT)

#define INTERRUPT_INT_EDGE_RISING(SRC)          SET_BIT(INTERRUPT_REG_INT_EDGE,SRC)
#define INTERRUPT_INT_EDGE_FALLING(SRC)         CLR_BIT(INTERRUPT_REG_INT_EDGE,SRC)

#define INTERRUPT_INT0_ACTIVATE()               SET_BIT(INTERRUPT_REG_INT_DIR,0)
#define INTERRUPT_INT0_DEACTIVATE()             CLR_BIT(INTERRUPT_REG_INT_DIR,0)

#define INTERRUPT_INT1_ACTIVATE()               SET_BIT(INTERRUPT_REG_INT_DIR,1)
#define INTERRUPT_INT1_DEACTIVATE()             CLR_BIT(INTERRUPT_REG_INT_DIR,1)

#define INTERRUPT_INT2_ACTIVATE()               SET_BIT(INTERRUPT_REG_INT_DIR,2)
#define INTERRUPT_INT2_DEACTIVATE()             CLR_BIT(INTERRUPT_REG_INT_DIR,2)

extern uint8 u8OverflowFlag;
extern uint32 u64InitialCount;

void INTERRUPT_vidInit(void);
void INTERRUPT_vidSetPriority(enInterruptPriority,enPriority);

#endif /* _INTERRUPT_H_ */