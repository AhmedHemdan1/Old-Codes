int red1=10;
int yellow1=9;
int green1=8;

int red2=13;
int yellow2=12;
int green2=11;

void setup() {
  pinMode(red1,OUTPUT);
  pinMode(yellow1,OUTPUT);
  pinMode(green1,OUTPUT);
  
  pinMode(red2,OUTPUT);
  pinMode(yellow2,OUTPUT);
  pinMode(green2,OUTPUT);
}

void loop() {
  changeLights();
  delay(20);
}

void changeLights(){
  digitalWrite(green1,LOW);
  digitalWrite(red2,LOW);
  digitalWrite(yellow1,HIGH);
  digitalWrite(yellow2,HIGH);
  delay(1000);

  digitalWrite(yellow1,LOW);
  digitalWrite(yellow2,LOW);
  digitalWrite(red1,HIGH);
  digitalWrite(green2,HIGH);
  delay(7000);

  digitalWrite(green2,LOW);
  digitalWrite(red1,LOW);
  digitalWrite(yellow1,HIGH);
  digitalWrite(yellow2,HIGH);
  delay(1000);

  digitalWrite(yellow1,LOW);
  digitalWrite(yellow2,LOW);
  digitalWrite(green1,HIGH);
  digitalWrite(red2,HIGH);
  delay(7000);
}

