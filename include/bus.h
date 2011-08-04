#ifndef ___BUS_H______
#define ___BUS_H______

typedef int (*initcall_t)(void);

#define driver_init(fn) \
	static driver_##fn##_function \
	__attribute__((__section__(".driver.init.func"))) = fn

#endif
