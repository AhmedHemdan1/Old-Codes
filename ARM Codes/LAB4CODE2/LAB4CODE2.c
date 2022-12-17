void main()
{
RCC_AHB1ENR|=(1<<3);               //Enable port D
GPIOD_MODER=0x55555555;            //Set all port D pins as outputs
RCC_AHB1ENR|=(1<<0);               //Enable port A
GPIOA_MODER &=~((1<<0)|(1<<1)|(1<<2)|(1<<3));     //Set port A pin 0 as output
RCC_AHB1ENR|=(1<<2);               //Enable port C
GPIOD_MODER=0x55555555;            //Set all port D pins as outputs

RCC_APB2ENR |=(1<<14);              //Enable system configuration controller clock

SYSCFG_EXTICR1&=~((1<<0)|(1<<1)|(1<<2)|(1<<3));  //Set EXTI0=0000'PA0 is set as external interrupt input
EXTI_RTSR|=(1<<0);                               //Set TR0=1' rising trigger is enabled for EXTI0
EXTI_FTSR&=~(1<<0);                              //Set TR0=0' falling trigger is disabled for EXTI0
EXTI_IMR|=(1<<0);                                //Set NR0=1' interrupt request from EXTI0 is unmasked
/*Interrupt set enable registers
To enable IRQ number 100
100/32=3.125=3
0.125*32=4

NVIC_ISER3=1<<4   */

/*To enable IRQ number 6 which is the IRQ for EXTI0
6/32=0.1875=0
0.1875*32=6       */
NVIC_ISER0=1<<6;
while(1);
GPIOC_ODR=0xFFFF;
Delay_ms(200);
GPIOC_ODR=0x0000;
Delay_ms(200);
GPIOC_ODR=0xFFFF;
}

void external_interrupt() iv 22                   //for timer 2, 44 is the word number in decimal and divided by 4
{
EXTI_PR|=(1<<0);                                  //Clear the pending interrupt register after executing the interrupt code
GPIOD_ODR=0xFFFF;
Delay_ms(1000);
GPIOD_ODR=0x0000;
Delay_ms(200);
}