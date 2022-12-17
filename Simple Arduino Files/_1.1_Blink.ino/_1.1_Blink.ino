void setup() {
  pinMode(3,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
}

void loop() {
  digitalWrite(3,HIGH);
  digitalWrite(5,LOW);
  digitalWrite(6,LOW);
  delay(1000);
  digitalWrite(3,LOW);
  digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  delay(1000);
  digitalWrite(3,LOW);
  digitalWrite(5,LOW);
  digitalWrite(6,HIGH);
  delay(1000);
  digitalWrite(3,LOW);
  digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  delay(1000);
}
