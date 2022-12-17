#define echoPin 2
#define trigPin 7
#define LEDPin 3
#include <LiquidCrystal.h>
LiquidCrystal lcd(12,11,9,8,5,4);

int maxRange=200;
int minRange=0;
long duration,distance;

void setup() {
  lcd.begin(16,2);
  Serial.begin (9600);
  pinMode(trigPin,OUTPUT);
  pinMode(echoPin,INPUT);
  pinMode(LEDPin,OUTPUT);
  }

void loop() {
  digitalWrite(trigPin,LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin,HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin,LOW);
  duration = pulseIn(echoPin ,HIGH);
  distance=duration/58.2;
  if (distance>=maxRange || distance<=minRange)
  {
    Serial.println("-1");
    digitalWrite(LEDPin,HIGH);
    lcd.print("A thief !!!!!!!!!!!");
  }
  else{
    Serial.println(distance);
    digitalWrite(LEDPin,LOW);
  }
  delay(50);
}
