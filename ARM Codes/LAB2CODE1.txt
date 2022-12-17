void main() {
   RCC_AHB1ENR|=(1<<3);
   GPIOD_MODER&=~(1<<0)|(1<<1);
   GPIOD_MODER|=(1<<2);
   while(1){
      if(GPIOD_IDR&(1<<0)){
         GPIOD_ODR|=(1<<1);
      }
      else{
         GPIOD_ODR&=~(1<<1);
      }
   }
}