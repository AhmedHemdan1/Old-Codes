_main:
;MyProject.c,2 :: 		void main ()
;MyProject.c,4 :: 		RCC_AHB1ENR |= (1<<0);    //enables port A
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;MyProject.c,5 :: 		RCC_APB1ENR |= (1<<0);    //enables Timer 2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;MyProject.c,6 :: 		GPIOA_MODER |= (1<<1);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
;MyProject.c,7 :: 		GPIOA_MODER &= ~(1<<0);   // (10)==>set bit 0 on port A as an alternative function bit.
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
;MyProject.c,8 :: 		GPIOA_AFRL |=(1<<0);      // set the alternative function to F1 (TIM1,TIM2)
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;MyProject.c,9 :: 		TIM2_CR1 |=(1<<7);        //set ARPE==>1(TIMx_ARR register is buffered))
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;MyProject.c,10 :: 		TIM2_CR1 &=~( (1<<5)|(1<<6) ); // edge aligned mode CMS==>00(counts up or down only)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #96
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;MyProject.c,11 :: 		TIM2_CR1 &=~(1<<4); 	  // DIR==>0(up counter)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #16
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;MyProject.c,12 :: 		TIM2_CCER |=(1<<0);       // enables Channel 1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;MyProject.c,13 :: 		TIM2_CCMR1 |= (1<<5)|(1<<6); //set channel1 to PWM mode 1==>(110)
MOVW	R0, 1073741848
MOVT	R0, 16384
LDR	R0, [R0, #0]
ORR	R1, R0, #96
MOVW	R0, 1073741848
MOVT	R0, 16384
STR	R1, [R0, #0]
;MyProject.c,14 :: 		TIM2_CCMR1 |=(1<<3);      //preload enable (means the CCR1 cannot be modified except at each update event), it must be enabled for the PWM to work.
MOVW	R0, 1073741848
MOVT	R0, 16384
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, 1073741848
MOVT	R0, 16384
STR	R1, [R0, #0]
;MyProject.c,18 :: 		TIM2_PSC=15;             //the prescaler =15+1=16
MOVS	R1, #15
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;MyProject.c,19 :: 		TIM2_ARR=1000; 	         // the auto reload register
MOVW	R1, #1000
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;MyProject.c,20 :: 		Tim2_CCR1=300;           //the number in channel 1 that will be compared with counter (50% duty cycle)
MOVW	R1, #300
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
STR	R1, [R0, #0]
;MyProject.c,21 :: 		TIM2_EGR |= (1<<0);      //UG (update generation is enabled==>it re-initialize the counter and generates an update of the registers
MOVW	R0, #lo_addr(TIM2_EGR+0)
MOVT	R0, #hi_addr(TIM2_EGR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_EGR+0)
MOVT	R0, #hi_addr(TIM2_EGR+0)
STR	R1, [R0, #0]
;MyProject.c,22 :: 		TIM2_CR1 |= (1<<0);      //CEN==>1(enable the counter)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;MyProject.c,23 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
