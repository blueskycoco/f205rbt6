#include <stdint.h>
#include <stdbool.h>
#include <stm32f2xx.h>
#include <stdio.h>

extern void SWO_Enable( void );

int main(void)
{
	SWO_Enable();
	printf("in main\n");
	
	while(1)
	{
		printf("stm32f205rbt6 \n");
	}
}
