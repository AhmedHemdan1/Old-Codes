#line 1 "C:/Users/pc9/Desktop/AHMEDHEMDAN/LAB4CODE2/LAB4CODE2.c"
void main()
{
RCC_AHB1ENR|=(1<<3);
GPIOD_MODER=0x55555555;
RCC_AHB1ENR|=(1<<0);
GPIOA_MODER &=~((1<<0)|(1<<1)|(1<<2)|(1<<3));
RCC_AHB1ENR|=(1<<2);
GPIOD_MODER=0x55555555;

RCC_APB2ENR |=(1<<14);

SYSCFG_EXTICR1&=~((1<<0)|(1<<1)|(1<<2)|(1<<3));
EXTI_RTSR|=(1<<0);
EXTI_FTSR&=~(1<<0);
EXTI_IMR|=(1<<0);
#line 26 "C:/Users/pc9/Desktop/AHMEDHEMDAN/LAB4CODE2/LAB4CODE2.c"
NVIC_ISER0=1<<6;
while(1);
GPIOC_ODR=0xFFFF;
Delay_ms(200);
GPIOC_ODR=0x0000;
Delay_ms(200);
GPIOC_ODR=0xFFFF;
}

void external_interrupt() iv 22
{
EXTI_PR|=(1<<0);
GPIOD_ODR=0xFFFF;
Delay_ms(1000);
GPIOD_ODR=0x0000;
Delay_ms(200);
}
