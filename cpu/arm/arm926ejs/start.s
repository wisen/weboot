/*
 *  __we_start_boot - Startup Code for ARM926EJS CPU-core
 *  author:wisen.wang.ah@gmail.com
 *  Aug 5,2011
 */


 .global __we_start_boot
 __we_start_boot:
 	b reset
	.include "reserv_area.inc"
	.include "mem_layout.inc"
	ldr	pc, __undefined
	ldr	pc, __swi
	ldr	pc, __prefetch_abort
	ldr	pc, __data_abort
	ldr	pc, __not_used
	ldr	pc, __irq
	ldr	pc, __fiq

__undefined:
	.word undefined
__swi:
	.word swi
__prefetch_abort:
	.word prefetch_abort
__data_abort:
	.word data_abort
__not_used:
	.word not_used
__irq:
	.word irq
__fiq:
	.word fiq

undefined:
	bl do_undefined
swi:
	bl do_swi
prefetch_abort:
	bl do_prefetch_abort
data_abort:
	bl do_data_abort
not_used:
	bl do_not_used
irq:
	bl do_irq
fiq:
	bl do_fiq

reset:
	/*
	 * set the cpu to SVC32 mode
	 */
	mrs	r0,cpsr
	bic	r0,r0,#0x1f
	orr	r0,r0,#0xd3
	msr	cpsr,r0

	/*disable or enable interrupt*/
	/*disable or enable mmu*/
	/*setup stack*/

	ldr	sp, =(STACK_END_ADDR - 4)
	b	main
	nop
	nop

