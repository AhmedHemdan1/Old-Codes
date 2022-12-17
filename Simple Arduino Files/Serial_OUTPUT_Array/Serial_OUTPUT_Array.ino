String state;

void setup() {
  pinMode(13,OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if(Serial.available()>0)
  {
    state=Serial.readString();
  }
  if(state=="on")
  {
    digitalWrite(13,HIGH);
  }
  else if(state=="off")
  {
    digitalWrite(13,LOW);
  }
}
