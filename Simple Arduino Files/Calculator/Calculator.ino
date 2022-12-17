#include <LiquidCrystal.h>
#include <Keypad.h>

LiquidCrystal lcd(5,4,3,2,1,0);
const byte ROWS = 4;
const byte COLS = 4;
char Keys[ROWS][COLS] = {
  {'1','2','3','+'},
  {'4','5','6','-'},
  {'7','8','9','*'},
  {'%','0','=','/'}
};
byte rowPins[ROWS] =  {13,12,11,10};
byte colPins[COLS] =  {9, 8, 7, 6};
Keypad myKeypad = Keypad( makeKeymap(Keys), rowPins, colPins, ROWS, COLS); 

boolean valOnePresent=false;
boolean next=false;
boolean final=false;
String num1,num2;
int ans;
char op;

void setup() {
  lcd.begin(16,2);
}

void loop() {
  char key=myKeypad.getKey();

  if(key!=NO_KEY&&(key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9'||key=='0')){
    if(valOnePresent!=true){
      num1=num1+key;
      int numLength=num1.length();
      lcd.setCursor(15-numLength,0);
      lcd.print(num1);
    }
    else{
      num2=num2+key;
      int numLength=num2.length();
      lcd.setCursor(15-numLength,1);
      lcd.print(num2);
      final=true;
    }
  }
  else if(valOnePresent==false&&key!=NO_KEY&&(key=='/'||key=='*'||key=='+'||key=='-'||key=='%')){
    if (valOnePresent==false){
      valOnePresent=true;
      op=key;
      lcd.setCursor(15,0);
      lcd.print(op);
    }
  }
  else if(final==true&&key!=NO_KEY&&key=='='){
    if(op=='+'){
      ans=num1.toInt()+num2.toInt();
    }
    if(op=='-'){
      ans=num1.toInt()-num2.toInt();
    }
    if(op=='*'){
      ans=num1.toInt()*num2.toInt();
    }
    if(op=='%'){
      ans=num1.toInt()%num2.toInt();
    }
    lcd.clear();
    lcd.setCursor(15,0);
    lcd.autoscroll();
    lcd.print(ans);
    lcd.noAutoscroll();
  }
}
