int mot1=9;
int mot2=6;
int mot3=5;
int mot4=3;

int left=13;
int right=12;

int Left=0;
int Right=0;

void LEFT (void);
void RIGHT (void);
void STOP (void);

void setup() {
  pinMode(mot1,OUTPUT);
  pinMode(mot2;OUTPUT);
  pinMode(mot3;OUTPUT);
  pinMode(mot4;OUTPUT);
 
  pinMode(left;INPUT);
  pinMode(right;INPUT);

  digitalWrite(left,HIGH);
  digitalWrite(right,HIGH);
}

void loop() {
  analogWrite(mot1,255);
  analogWrite(mot2,0);
  analogWrite(mot3,255);
  analogWrite(mot4,0);
  
  while(1)
  {
    Left=digitalRead(left);
    Right=digitalWrite(right);

    if ((Left==0&&Right==1)==1)
    {
      LEFT();
    }
    else if((Right==0&&Left==1)==1)
    {
      RIGHT();
    }
  }
}
void LEFT(void)
{
  analogWrite(mot3,0);
  analogWrite(mot4,30);
}

