#ifndef _INTERRUPT_H_
#define _INTERRUPT_H_

#include "data_types.h"
#include "macros.h"

#define INTERRUPT_REG_GLOBAL_EN         (INTCON)
#define INTERRUPT_REG_TMR0_EN_FLAG      (INTCON)
#define INTERRUPT_REG_INT0_EN_FLAG      (INTCON)
#define INTERRUPT_REG_RB_EN_FLAG        (INTCON)

#define INTERRUPT_REG_INT_EDGE          (INTCON2)
#define INTERRUPT_REG_PRIORITY_TMR0_RB  (INTCON2)
#define INTERRUPT_REG_RBPU_EN           (INTCON2)

#define INTERRUPT_REG_INT1_EN_FLAG_PR   (INTCON3)
#define INTERRUPT_REG_INT2_EN_FLAG_PR   (INTCON3)

#define INTERRUPT_REG_INT_DIR           (TRISB)
#define RST_CTRL_REG                    (RCON)

#define INTERRUPT_RBPU_BIT  (7)

#define INTERRUPT_ENABLE_GLOBAL()               SET_BIT(INTERRUPT_REG_GLOBAL_EN,IntEn_GIE)
#define INTERRUPT_ENABLE_PERIPHERAL()           SET_BIT(INTERRUPT_REG_GLOBAL_EN,IntEn_PEIE)
#define INTERRUPT_ENABLE_PRIORITY()             SET_BIT(RST_CTRL_REG,IntEn_GIE)

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

void INTERRUPT_vidInit(void);
void INTERRUPT_vidSetPriority(enInterruptPriority,enPriority);

#endif /* _INTERRUPT_H_ */