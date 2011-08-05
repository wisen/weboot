int main(void)
{
	mm_init();
	interrupt_init();

	test_prj_init();
	bus_init();


	tiny_shell();

	return 0;
}
