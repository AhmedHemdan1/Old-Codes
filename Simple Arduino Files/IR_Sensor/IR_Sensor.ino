const int sensor=A0;
  int led=3;
void setup() {
  pinMode(led,OUTPUT);
  pinMode(sensor,INPUT);
}

void loop() {
  if(digitalRead(sensor)==HIGH)
  {
    digitalWrite(led,HIGH);
  }
  else
  {
    digitalWrite(led,LOW);
  }
  delay(100);
}
