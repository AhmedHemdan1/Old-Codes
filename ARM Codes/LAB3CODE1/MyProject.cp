#line 1 "C:/Users/pc9/Desktop/LAB3CODE1/MyProject.c"

void main ()
{
RCC_AHB1ENR |= (1<<0);
RCC_APB1ENR |= (1<<0);
GPIOA_MODER |= (1<<1);
GPIOA_MODER &= ~(1<<0);
GPIOA_AFRL |=(1<<0);
TIM2_CR1 |=(1<<7);
TIM2_CR1 &=~( (1<<5)|(1<<6) );
TIM2_CR1 &=~(1<<4);
TIM2_CCER |=(1<<0);
 (*((unsigned volatile long*)0x40000018))  |= (1<<5)|(1<<6);
 (*((unsigned volatile long*)0x40000018))  |=(1<<3);



TIM2_PSC=15;
TIM2_ARR=1000;
Tim2_CCR1=300;
TIM2_EGR |= (1<<0);
TIM2_CR1 |= (1<<0);
}
