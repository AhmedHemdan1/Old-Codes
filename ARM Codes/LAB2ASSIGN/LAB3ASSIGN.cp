#line 1 "C:/Users/pc9/Desktop/LAB3ASSIGN1/LAB3ASSIGN.c"
void Dms(int ms){
 Tim5_EGR|=(1<<0);
 Tim5_CR1|=(1<<0);
 while(Tim5_CNT<ms);
 Tim5_CR1&=~(1<<0);
}
void main() {
 RCC_AHB1ENR|=(1<<3);
 GPIOD_MODER=0x55555554;
 RCC_APB1ENR|=(1<<3);
 Tim5_CR1|=(1<<7);
 Tim5_CR1&=~(1<<5)|(1<<6);
 Tim5_CR1&=~(1<<4);
 Tim5_PSC=15999;
 Tim5_ARR=10000;
 while(1){
 if (GPIOD_IDR & (1<<0)) {
 GPIOD_ODR=0xFF00;
 Dms(1000);
 GPIOD_ODR=0x0000;
 Dms(1000);
 }
 }
}
