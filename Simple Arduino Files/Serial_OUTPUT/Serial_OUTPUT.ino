int state=0;

void setup() {
  pinMode(13,OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if(Serial.available()>0)
  {
    state=Serial.parseInt();
  }
  if(state==1)
  {
    digitalWrite(13,HIGH);
  }
  else if(state==0)
  {
    digitalWrite(13,LOW);
  }
}
