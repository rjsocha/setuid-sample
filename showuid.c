#include <stdio.h>
#include <unistd.h>

int main(void) {
	printf("My ID is A:%d/%d\n",getuid(),geteuid());
	setuid(0);
	printf("My ID is B:%d/%d\n",getuid(),geteuid());
	return 0;
}
