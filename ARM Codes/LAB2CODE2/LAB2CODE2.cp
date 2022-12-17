#line 1 "C:/Users/pc9/Desktop/LAB2CODE2/LAB2CODE2.c"
void Dms(int ms);
void main() {
 RCC_AHB1ENR|=(1<<3);
 GPIOD_MODER=0x55555555;
 RCC_APB1ENR|=(1<<0);
 Tim2_CR1|=(1<<7);
 Tim2_CR1&=~(1<<5)|(1<<6);
 Tim2_CR1&=~(1<<4);
 Tim2_PSC=15999;
 Tim2_ARR=10000;
 while(1){
 GPIOD_ODR=0xFFFF;
 Dms(1000);
 GPIOD_ODR=0x0000;
 Dms(1000);
 }
}
void Dms(int ms){
 Tim2_EGR|=(1<<0);
 Tim2_CR1|=(1<<0);
 while(Tim2_CNT<ms);
 Tim2_CR1&=~(1<<0);
}
