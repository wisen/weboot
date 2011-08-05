#ifndef ___INTERRUPT_HH___
#define ___INTERRUPT_HH___

void do_undefined(void);
void do_swi(void);
void do_prefetch_abort(void);
void do_data_abort(void);
void do_not_used(void);
void do_irq(void);
void do_fiq(void);

#endif