int ledPin=5;
int butApin=9;
int butBpin=8;

void setup(){
  pinMode(ledPin,OUTPUT);
  pinMode(butApin,INPUT_PULLUP);
  pinMode(butBpin,INPUT_PULLUP);
}
void loop(){
  if(digitalRead(butApin)==LOW){
    digitalWrite(ledPin,HIGH);
  }
  if(digitalRead(butBpin)==LOW){
    digitalWrite(ledPin,LOW);
  }
}


