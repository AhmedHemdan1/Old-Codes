_Dms:
;LAB3ASSIGN.c,1 :: 		void Dms(int ms){                 // void: No return && the 1000ms delay will be stored later in the integer variable ms
; ms start address is: 0 (R0)
; ms end address is: 0 (R0)
; ms start address is: 0 (R0)
;LAB3ASSIGN.c,2 :: 		Tim5_EGR|=(1<<0);              // Re-initilize the counter (start the counter from 0) in UG bit (Update Generation) in EGR (Event Generation Register)
MOVW	R1, #lo_addr(TIM5_EGR+0)
MOVT	R1, #hi_addr(TIM5_EGR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1
MOVW	R1, #lo_addr(TIM5_EGR+0)
MOVT	R1, #hi_addr(TIM5_EGR+0)
STR	R2, [R1, #0]
;LAB3ASSIGN.c,3 :: 		Tim5_CR1|=(1<<0);              // Enable CEN (Counter Enable)
MOVW	R1, #lo_addr(TIM5_CR1+0)
MOVT	R1, #hi_addr(TIM5_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1
MOVW	R1, #lo_addr(TIM5_CR1+0)
MOVT	R1, #hi_addr(TIM5_CR1+0)
STR	R2, [R1, #0]
; ms end address is: 0 (R0)
;LAB3ASSIGN.c,4 :: 		while(Tim5_CNT<ms);            // Stay inside "while" if the CNT (Counter Value) is less than 1000ms even the condition is false
L_Dms0:
; ms start address is: 0 (R0)
MOVW	R1, #lo_addr(TIM5_CNT+0)
MOVT	R1, #hi_addr(TIM5_CNT+0)
LDR	R1, [R1, #0]
CMP	R1, R0
IT	CS
BCS	L_Dms1
; ms end address is: 0 (R0)
IT	AL
BAL	L_Dms0
L_Dms1:
;LAB3ASSIGN.c,5 :: 		Tim5_CR1&=~(1<<0);             // Disable CEN (Let the timer do not count)
MOVW	R1, #lo_addr(TIM5_CR1+0)
MOVT	R1, #hi_addr(TIM5_CR1+0)
LDR	R2, [R1, #0]
MVN	R1, #1
ANDS	R2, R1
MOVW	R1, #lo_addr(TIM5_CR1+0)
MOVT	R1, #hi_addr(TIM5_CR1+0)
STR	R2, [R1, #0]
;LAB3ASSIGN.c,6 :: 		}
L_end_Dms:
BX	LR
; end of _Dms
_main:
;LAB3ASSIGN.c,7 :: 		void main() {
;LAB3ASSIGN.c,8 :: 		RCC_AHB1ENR|=(1<<3);            // Enable GPIODEN (Enable port D)
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,9 :: 		GPIOD_MODER=0x55555554;         // Identify that pin 0 is input and the rest is output
MOVW	R1, #21844
MOVT	R1, #21845
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,10 :: 		RCC_APB1ENR|=(1<<3);            // Enable TIM5EN (Enable Timer 5)
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,11 :: 		Tim5_CR1|=(1<<7);               // Buffer the ARPE (Auto-Reload Preload Enable) (If ARR is changed during operation, Timer changes its operation after performing its old reset)
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,12 :: 		Tim5_CR1&=~(1<<5)|(1<<6);       // Set Edge-Aligned Mode in CMS (Enable counting the timer up or down)
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #32
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,13 :: 		Tim5_CR1&=~(1<<4);              // Use counter as upcounter in DIR (Enable counting the timer up)
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #16
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,14 :: 		Tim5_PSC=15999;                 // Set counter clock frequency at 1KHz (CK_CNT = f_CK_PSC / (PSC[15:0] + 1)) in PSC (Prescaler Register)
MOVW	R1, #15999
MOVW	R0, #lo_addr(TIM5_PSC+0)
MOVT	R0, #hi_addr(TIM5_PSC+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,15 :: 		Tim5_ARR=10000;                 // Set max. time required to reset the timer in ms in ARR (Auto-Reload Register)
MOVW	R1, #10000
MOVW	R0, #lo_addr(TIM5_ARR+0)
MOVT	R0, #hi_addr(TIM5_ARR+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,16 :: 		while(1){
L_main2:
;LAB3ASSIGN.c,17 :: 		if (GPIOD_IDR & (1<<0)) {    // if the pushbutton of pin 0 is pressed in the IDR (Input Data Register)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	EQ
BEQ	L_main4
;LAB3ASSIGN.c,18 :: 		GPIOD_ODR=0xFF00;         // Turn-on leds of port D high in the ODR (Output Data Register)
MOVW	R1, #65280
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,19 :: 		Dms(1000);                // Set the 1000ms delay in the timer
MOVW	R0, #1000
SXTH	R0, R0
BL	_Dms+0
;LAB3ASSIGN.c,20 :: 		GPIOD_ODR=0x0000;         // Turn-off leds of port D high in the ODR
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LAB3ASSIGN.c,21 :: 		Dms(1000);
MOVW	R0, #1000
SXTH	R0, R0
BL	_Dms+0
;LAB3ASSIGN.c,22 :: 		}
L_main4:
;LAB3ASSIGN.c,23 :: 		}
IT	AL
BAL	L_main2
;LAB3ASSIGN.c,24 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
