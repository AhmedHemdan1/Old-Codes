#include <LiquidCrystal.h>
#define OLED_RESET 11
LiquidCrystal lcd(5,4,3,2,1,0);
int val;
int tempPin = A1;
const int gasPin = A0;
int buzzer = 9;
int gas_sensor = A0;
float m = -0.318; //Slope
float b = 1.133; //Y-Intercept
float R0 = 10.370; //Sensor Resistance in the media

void setup()
{
  lcd.begin(16,2);
  pinMode(buzzer, OUTPUT);
  digitalWrite(buzzer, LOW);
  pinMode(gas_sensor, INPUT);
}

void loop()
{
  val=analogRead(tempPin);
  float mv=(val/1024.0)*5000;
  float cel=mv/10;
  float fahr=(cel/9)*5+32;

  lcd.setCursor(0,1);
  lcd.print("TEMP. = ");
  lcd.print(cel);
  lcd.print(" c ");
  delay(1000);
  
  float sensor_volt;
  float RS_gas;
  float ratio;
  float sensorValue = analogRead(gas_sensor);
  sensor_volt = sensorValue * (5.0 / 1023.0);
  RS_gas = ((5.0 * 10.0) / sensor_volt) - 10.0;
  ratio = RS_gas / R0;

  double ppm_log = (log10(ratio) - b) / m;
  double ppm = pow(10, ppm_log);
  double percentage = ppm / 10000;

  if (ppm >= 100) {
    digitalWrite(buzzer, HIGH);
    lcd.setCursor(0,0);
    lcd.print(" ALARM!! FIRE!! ");
  }
  else {
    digitalWrite(buzzer, LOW);
    lcd.setCursor(0,0);
    lcd.clear();
  }
  delay(500);
}
