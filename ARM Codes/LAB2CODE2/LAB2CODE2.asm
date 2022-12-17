_main:
;LAB2CODE2.c,2 :: 		void main() {
;LAB2CODE2.c,3 :: 		RCC_AHB1ENR|=(1<<3);
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;LAB2CODE2.c,4 :: 		GPIOD_MODER=0x55555555;
MOV	R1, #1431655765
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
;LAB2CODE2.c,5 :: 		RCC_APB1ENR|=(1<<0);
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;LAB2CODE2.c,6 :: 		Tim2_CR1|=(1<<7);
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;LAB2CODE2.c,7 :: 		Tim2_CR1&=~(1<<5)|(1<<6);
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #32
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;LAB2CODE2.c,8 :: 		Tim2_CR1&=~(1<<4);
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #16
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;LAB2CODE2.c,9 :: 		Tim2_PSC=15999;
MOVW	R1, #15999
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;LAB2CODE2.c,10 :: 		Tim2_ARR=10000;
MOVW	R1, #10000
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;LAB2CODE2.c,11 :: 		while(1){
L_main0:
;LAB2CODE2.c,12 :: 		GPIOD_ODR=0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LAB2CODE2.c,13 :: 		Dms(1000);
MOVW	R0, #1000
SXTH	R0, R0
BL	_Dms+0
;LAB2CODE2.c,14 :: 		GPIOD_ODR=0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LAB2CODE2.c,15 :: 		Dms(1000);
MOVW	R0, #1000
SXTH	R0, R0
BL	_Dms+0
;LAB2CODE2.c,16 :: 		}
IT	AL
BAL	L_main0
;LAB2CODE2.c,17 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Dms:
;LAB2CODE2.c,18 :: 		void Dms(int ms){
; ms start address is: 0 (R0)
; ms end address is: 0 (R0)
; ms start address is: 0 (R0)
;LAB2CODE2.c,19 :: 		Tim2_EGR|=(1<<0);
MOVW	R1, #lo_addr(TIM2_EGR+0)
MOVT	R1, #hi_addr(TIM2_EGR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1
MOVW	R1, #lo_addr(TIM2_EGR+0)
MOVT	R1, #hi_addr(TIM2_EGR+0)
STR	R2, [R1, #0]
;LAB2CODE2.c,20 :: 		Tim2_CR1|=(1<<0);
MOVW	R1, #lo_addr(TIM2_CR1+0)
MOVT	R1, #hi_addr(TIM2_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1
MOVW	R1, #lo_addr(TIM2_CR1+0)
MOVT	R1, #hi_addr(TIM2_CR1+0)
STR	R2, [R1, #0]
; ms end address is: 0 (R0)
;LAB2CODE2.c,21 :: 		while(Tim2_CNT<ms);
L_Dms2:
; ms start address is: 0 (R0)
MOVW	R1, #lo_addr(TIM2_CNT+0)
MOVT	R1, #hi_addr(TIM2_CNT+0)
LDR	R1, [R1, #0]
CMP	R1, R0
IT	CS
BCS	L_Dms3
; ms end address is: 0 (R0)
IT	AL
BAL	L_Dms2
L_Dms3:
;LAB2CODE2.c,22 :: 		Tim2_CR1&=~(1<<0);
MOVW	R1, #lo_addr(TIM2_CR1+0)
MOVT	R1, #hi_addr(TIM2_CR1+0)
LDR	R2, [R1, #0]
MVN	R1, #1
ANDS	R2, R1
MOVW	R1, #lo_addr(TIM2_CR1+0)
MOVT	R1, #hi_addr(TIM2_CR1+0)
STR	R2, [R1, #0]
;LAB2CODE2.c,23 :: 		}
L_end_Dms:
BX	LR
; end of _Dms
