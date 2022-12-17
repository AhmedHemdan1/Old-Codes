#line 1 "C:/Users/pc9/Desktop/AHMEDHEMDAN/LAB3ASSIGN/LAB3ASSIGN.c"

void main ()
{
RCC_AHB1ENR |= (1<<3);
RCC_APB1ENR |= (1<<2);
GPIOD_MODER |= (1<<25);
GPIOD_MODER &= ~(1<<24);
GPIOD_AFRH |=(1<<17);
TIM4_CR1 |=(1<<7);
TIM4_CR1 &=~( (1<<5)|(1<<6) );
TIM4_CR1 &=~(1<<4);
TIM4_CCER |=(1<<0);
 (*((unsigned volatile long*)0x40000818))  |= (1<<5)|(1<<6);
 (*((unsigned volatile long*)0x40000818))  |=(1<<3);



TIM4_PSC=15;
TIM4_ARR=10;
Tim4_CCR1=8;
TIM4_EGR |= (1<<0);
TIM4_CR1 |= (1<<0);
}
