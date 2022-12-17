_main:
;LAB3ASSIGN.c,2 :: 		void main ()
;LAB3ASSIGN.c,4 :: 		RCC_AHB1ENR |= (1<<3);    //enables port D
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,5 :: 		RCC_APB1ENR |= (1<<2);    //enables Timer 4
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,6 :: 		GPIOD_MODER |= (1<<25);
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #33554432
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,7 :: 		GPIOD_MODER &= ~(1<<24);  // (10)==>set bit 12 on port D as an alternative function bit.
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #16777216
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,8 :: 		GPIOD_AFRH |=(1<<17);      // set the alternative function to AF2
MOVW	R0, #lo_addr(GPIOD_AFRH+0)
MOVT	R0, #hi_addr(GPIOD_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(GPIOD_AFRH+0)
MOVT	R0, #hi_addr(GPIOD_AFRH+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,9 :: 		TIM4_CR1 |=(1<<7);        //set ARPE==>1(TIMx_ARR register is buffered))
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,10 :: 		TIM4_CR1 &=~( (1<<5)|(1<<6) ); // edge aligned mode CMS==>00(counts up or down only)
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #96
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,11 :: 		TIM4_CR1 &=~(1<<4);       // DIR==>0(up counter)
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #16
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,12 :: 		TIM4_CCER |=(1<<0);      // enables TIM4_CH1 (output pin of channel 1 for timer 4)
MOVW	R0, #lo_addr(TIM4_CCER+0)
MOVT	R0, #hi_addr(TIM4_CCER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM4_CCER+0)
MOVT	R0, #hi_addr(TIM4_CCER+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,13 :: 		TIM4_CCMR1 |= (1<<5)|(1<<6);  //set channel1 to PWM mode 1==>(110)
MOVW	R0, 1073743896
MOVT	R0, 16384
LDR	R0, [R0, #0]
ORR	R1, R0, #96
MOVW	R0, 1073743896
MOVT	R0, 16384
STR	R1, [R0, #0]
;LAB3ASSIGN.c,14 :: 		TIM4_CCMR1 |=(1<<3);      //preload enable (means the CCR1 cannot be modified except at each update event), it must be enabled for the PWM to work.
MOVW	R0, 1073743896
MOVT	R0, 16384
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, 1073743896
MOVT	R0, 16384
STR	R1, [R0, #0]
;LAB3ASSIGN.c,18 :: 		TIM4_PSC=15;             //the prescaler =15+1=16
MOVS	R1, #15
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,19 :: 		TIM4_ARR=10;             // the auto reload register
MOVS	R1, #10
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,20 :: 		Tim4_CCR1=8;             //the number in channel 1 that will be compared with counter (80% duty cycle)
MOVS	R1, #8
MOVW	R0, #lo_addr(TIM4_CCR1+0)
MOVT	R0, #hi_addr(TIM4_CCR1+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,21 :: 		TIM4_EGR |= (1<<0);      //UG (update generation is enabled==>it re-initialize the counter and generates an update of the registers
MOVW	R0, #lo_addr(TIM4_EGR+0)
MOVT	R0, #hi_addr(TIM4_EGR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM4_EGR+0)
MOVT	R0, #hi_addr(TIM4_EGR+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,22 :: 		TIM4_CR1 |= (1<<0);      //CEN==>1(enable the counter)
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,23 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
