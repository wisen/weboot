#ifndef __COMMAND_H____
#define __COMMAND_H____

struct command {
	char *name;
	int (*func)(int,char **);
};

#define CMD(name) { #name, cmd_##name },

#endif
