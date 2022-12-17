_main:
;LAB2CODE1.c,1 :: 		void main() {
;LAB2CODE1.c,2 :: 		RCC_AHB1ENR|=(1<<3);
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;LAB2CODE1.c,3 :: 		GPIOD_MODER&=~(1<<0)|(1<<1);
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
;LAB2CODE1.c,4 :: 		GPIOD_MODER|=(1<<2);
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
;LAB2CODE1.c,5 :: 		while(1){
L_main0:
;LAB2CODE1.c,6 :: 		if(GPIOD_IDR&(1<<0)){
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	EQ
BEQ	L_main2
;LAB2CODE1.c,7 :: 		GPIOD_ODR|=(1<<1);
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LAB2CODE1.c,8 :: 		}
IT	AL
BAL	L_main3
L_main2:
;LAB2CODE1.c,10 :: 		GPIOD_ODR&=~(1<<1);
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #2
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LAB2CODE1.c,11 :: 		}
L_main3:
;LAB2CODE1.c,12 :: 		}
IT	AL
BAL	L_main0
;LAB2CODE1.c,13 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
