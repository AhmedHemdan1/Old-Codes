void Dms(int ms){                 // void: No return && the 1000ms delay will be stored later in the integer variable ms
   Tim5_EGR|=(1<<0);              // Re-initilize the counter (start the counter from 0) in UG bit (Update Generation) in EGR (Event Generation Register)
   Tim5_CR1|=(1<<0);              // Enable CEN (Counter Enable)
   while(Tim5_CNT<ms);            // Stay inside "while" if the CNT (Counter Value) is less than 1000ms even the condition is false
   Tim5_CR1&=~(1<<0);             // Disable CEN (Let the timer do not count)
}
void main() {
   RCC_AHB1ENR|=(1<<3);            // Enable GPIODEN (Enable port D)
   GPIOD_MODER=0x55555554;         // Identify that pin 0 is input and the rest is output
   RCC_APB1ENR|=(1<<3);            // Enable TIM5EN (Enable Timer 5)
   Tim5_CR1|=(1<<7);               // Buffer the ARPE (Auto-Reload Preload Enable) (If ARR is changed during operation, Timer changes its operation after performing its old reset)
   Tim5_CR1&=~(1<<5)|(1<<6);       // Set Edge-Aligned Mode in CMS (Enable counting the timer up or down)
   Tim5_CR1&=~(1<<4);              // Use counter as upcounter in DIR (Enable counting the timer up)
   Tim5_PSC=15999;                 // Set counter clock frequency at 1KHz (CK_CNT = f_CK_PSC / (PSC[15:0] + 1)) in PSC (Prescaler Register)
   Tim5_ARR=10000;                 // Set max. time required to reset the timer in ms in ARR (Auto-Reload Register)
   while(1){
      if (GPIOD_IDR & (1<<0)) {    // if the pushbutton of pin 0 is pressed in the IDR (Input Data Register)
         GPIOD_ODR=0xFF00;         // Turn-on leds of port D high in the ODR (Output Data Register)
         Dms(1000);                // Set the 1000ms delay in the timer
         GPIOD_ODR=0x0000;         // Turn-off leds of port D high in the ODR
         Dms(1000);
      }
   }
}