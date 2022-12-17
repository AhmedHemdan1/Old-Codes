_main:
;LAB4CODE2.c,1 :: 		void main()
;LAB4CODE2.c,3 :: 		RCC_AHB1ENR|=(1<<3);               //Enable port D
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,4 :: 		GPIOD_MODER=0x55555555;            //Set all port D pins as outputs
MOV	R1, #1431655765
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,5 :: 		RCC_AHB1ENR|=(1<<0);               //Enable port A
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,6 :: 		GPIOA_MODER &=~((1<<0)|(1<<1)|(1<<2)|(1<<3));     //Set port A pin 0 as output
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,7 :: 		RCC_AHB1ENR|=(1<<2);               //Enable port C
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,8 :: 		GPIOD_MODER=0x55555555;            //Set all port D pins as outputs
MOV	R1, #1431655765
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,10 :: 		RCC_APB2ENR |=(1<<14);              //Enable system configuration controller clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16384
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,12 :: 		SYSCFG_EXTICR1&=~((1<<0)|(1<<1)|(1<<2)|(1<<3));  //Set EXTI0=0000'PA0 is set as external interrupt input
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,13 :: 		EXTI_RTSR|=(1<<0);                               //Set TR0=1' rising trigger is enabled for EXTI0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,14 :: 		EXTI_FTSR&=~(1<<0);                              //Set TR0=0' falling trigger is disabled for EXTI0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,15 :: 		EXTI_IMR|=(1<<0);                                //Set NR0=1' interrupt request from EXTI0 is unmasked
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,26 :: 		NVIC_ISER0=1<<6;
MOVW	R1, #64
MOVW	R0, #lo_addr(NVIC_ISER0+0)
MOVT	R0, #hi_addr(NVIC_ISER0+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,27 :: 		while(1);
L_main0:
IT	AL
BAL	L_main0
;LAB4CODE2.c,33 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_external_interrupt:
;LAB4CODE2.c,35 :: 		void external_interrupt() iv 22                   //for timer 2, 44 is the word number in decimal and divided by 4
;LAB4CODE2.c,37 :: 		EXTI_PR|=(1<<0);                                  //Clear the pending interrupt register after executing the interrupt code
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,38 :: 		GPIOD_ODR=0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,39 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_external_interrupt6:
SUBS	R7, R7, #1
BNE	L_external_interrupt6
NOP
NOP
NOP
NOP
;LAB4CODE2.c,40 :: 		GPIOD_ODR=0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LAB4CODE2.c,41 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_external_interrupt8:
SUBS	R7, R7, #1
BNE	L_external_interrupt8
NOP
NOP
;LAB4CODE2.c,42 :: 		}
L_end_external_interrupt:
BX	LR
; end of _external_interrupt
