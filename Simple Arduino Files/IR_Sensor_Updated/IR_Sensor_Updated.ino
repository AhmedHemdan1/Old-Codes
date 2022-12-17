#include <LiquidCrystal.h>
LiquidCrystal lcd(12,11,5,4,3,2);
const int sensor=A0;
int en_A=10;
int in1=9;
int in2=8;

void setup() {
  lcd.begin(16,2);
  pinMode(sensor,INPUT);
  pinMode(en_A,OUTPUT);
  pinMode(in1,OUTPUT);
  pinMode(in2,OUTPUT);
}

void loop() {
  lcd.setCursor(1,0);
  if(digitalRead(sensor)==LOW)
  {
    lcd.print("Start The Motor");
    
  digitalWrite(in1,HIGH);
  digitalWrite(in2,LOW);
  analogWrite(en_A,255);
  delay(500);
  }
  else
  {
    lcd.print("Stop The Motor ");
    digitalWrite(in1,LOW);
    digitalWrite(in2,LOW);
  }
  delay(200);
}
