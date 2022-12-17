#define TIM2_CCMR1 (*((unsigned volatile long*)0x40000018))
void main ()
{
RCC_AHB1ENR |= (1<<0);    //enables port A
RCC_APB1ENR |= (1<<0);    //enables Timer 2
GPIOA_MODER |= (1<<1);
GPIOA_MODER &= ~(1<<0);   // (10)==>set bit 0 on port A as an alternative function bit.
GPIOA_AFRL |=(1<<0);      // set the alternative function to F1 (TIM1,TIM2)
TIM2_CR1 |=(1<<7);        //set ARPE==>1(TIMx_ARR register is buffered))
TIM2_CR1 &=~( (1<<5)|(1<<6) ); // edge aligned mode CMS==>00(counts up or down only)
TIM2_CR1 &=~(1<<4); 	  // DIR==>0(up counter)
TIM2_CCER |=(1<<0);       // enables Channel 1
TIM2_CCMR1 |= (1<<5)|(1<<6); //set channel1 to PWM mode 1==>(110)
TIM2_CCMR1 |=(1<<3);      //preload enable (means the CCR1 cannot be modified except at each update event), it must be enabled for the PWM to work.

//PWM freq = fclk/psc/ARR = 16Mhz/(15+1)/1000 =1Khz
//PWM Duty = CCR1 / ARR = 250/1000=0.25=25%
TIM2_PSC=15;             //the prescaler =15+1=16
TIM2_ARR=1000; 	         // the auto reload register
Tim2_CCR1=300;           //the number in channel 1 that will be compared with counter (50% duty cycle)
TIM2_EGR |= (1<<0);      //UG (update generation is enabled==>it re-initialize the counter and generates an update of the registers
TIM2_CR1 |= (1<<0);      //CEN==>1(enable the counter)
}