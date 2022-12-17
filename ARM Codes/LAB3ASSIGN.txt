#define TIM4_CCMR1 (*((unsigned volatile long*)0x40000818))
void main ()
{
RCC_AHB1ENR |= (1<<3);    //enables port D
RCC_APB1ENR |= (1<<2);    //enables Timer 4
GPIOD_MODER |= (1<<25);
GPIOD_MODER &= ~(1<<24);  // (10)==>set bit 12 on port D as an alternative function bit.
GPIOD_AFRH |=(1<<17);      // set the alternative function to AF2
TIM4_CR1 |=(1<<7);        //set ARPE==>1(TIMx_ARR register is buffered))
TIM4_CR1 &=~( (1<<5)|(1<<6) ); // edge aligned mode CMS==>00(counts up or down only)
TIM4_CR1 &=~(1<<4);       // DIR==>0(up counter)
TIM4_CCER |=(1<<0);      // enables TIM4_CH1 (output pin of channel 1 for timer 4)
TIM4_CCMR1 |= (1<<5)|(1<<6);  //set channel1 to PWM mode 1==>(110)
TIM4_CCMR1 |=(1<<3);      //preload enable (means the CCR1 cannot be modified except at each update event), it must be enabled for the PWM to work.

//PWM freq = fclk/(1+PSC)/ARR = 16Mhz/(1+15)/10 =100Khz
//PWM Duty = CCR1 / ARR = 8/10=0.8=80%
TIM4_PSC=15;             //the prescaler =15+1=16
TIM4_ARR=10;             // the auto reload register
Tim4_CCR1=8;             //the number in channel 1 that will be compared with counter (80% duty cycle)
TIM4_EGR |= (1<<0);      //UG (update generation is enabled==>it re-initialize the counter and generates an update of the registers
TIM4_CR1 |= (1<<0);      //CEN==>1(enable the counter)
}