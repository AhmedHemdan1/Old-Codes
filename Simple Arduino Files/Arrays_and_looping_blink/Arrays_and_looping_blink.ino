int leds[8]={13,12,11,10,9,8,7,6};

void setup() {
  for(int x=0;x<=7;++x)
  {
  pinMode(leds[x],OUTPUT);
  }
}

void loop() {
  for(int x=0;x<=7;++x)
  {
    digitalWrite(leds[x],HIGH);
    delay(1000);
    digitalWrite(leds[x],LOW);
  }
}
