unsigned char brightness=0;

void setup() {
  pinMode(6,OUTPUT);
}

void loop() {
  analogWrite(6,brightness);
  brightness++;
  delay(60);
}
