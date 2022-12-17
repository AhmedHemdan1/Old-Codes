#include <LiquidCrystal.h>
LiquidCrystal lcd(5,4,3,2,1,0);
int val;
int tempPin = A1;
int buzzer = 13;
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
  lcd.print(" C ");
  delay(500);
  
  float sensor_volt;
  float RS_gas;
  float ratio;
  float sensorValue = analogRead(gas_sensor);
  sensor_volt = sensorValue * (5.0 / 1023.0);
  RS_gas = ((5.0 * 10.0) / sensor_volt) - 10.0;
  ratio = RS_gas / R0;

  double ppm_log = (log10(ratio) - b) / m;
  double ppm = pow(10, ppm_log);

  if ((ppm >= 100)||(cel>=80)) {
    digitalWrite(buzzer, HIGH);
    lcd.setCursor(0,0);
    lcd.print(" ALARM!! FIRE!! ");
  }
  delay(10);
}
