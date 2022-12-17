int en_A=10;
int in1=9;
int in2=8;

void setup() {
  pinMode(en_A,OUTPUT);
  pinMode(in1,OUTPUT);
  pinMode(in2,OUTPUT);
}

void demoOne()
{
  digitalWrite(in1,HIGH);
  digitalWrite(in2,LOW);
  analogWrite(en_A,200);
  delay(2000);

  digitalWrite(in1,LOW);
  digitalWrite(in2,HIGH);
  delay(2000);

  digitalWrite(in1,LOW);
  digitalWrite(in2,LOW);
}

void demoTwo()
{
  digitalWrite(in1,LOW);
  digitalWrite(in2,HIGH);
  
  for(int i=0;i<256;i++)
  {
    analogWrite(en_A,i);
    delay(20);
  }
  for(int i=255;i>=0;--i)
  {
    analogWrite(en_A,i);
    delay(20);
  }
  
  digitalWrite(in1,LOW);
  digitalWrite(in2,LOW);
}

void loop() {
  demoOne();
  delay(1000);
  demoTwo();
  delay(1000);
}
