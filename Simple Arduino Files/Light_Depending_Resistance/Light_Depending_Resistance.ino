int sensorPin =A7;
int sensorValue=0;

void setup() {
  pinMode(2,OUTPUT);
  Serial.begin(9600);
}

void loop() {
  sensorValue=analogRead(sensorPin);
  Serial.println(sensorValue);
  if(sensorValue<700){
    digitalWrite(2,HIGH);
  }
  else{
    digitalWrite(2,LOW);
  }
  delay(100);
}
