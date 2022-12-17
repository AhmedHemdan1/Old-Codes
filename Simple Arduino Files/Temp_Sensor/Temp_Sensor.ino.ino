int val;
int tempPin = A1;

void setup()
{
  Serial.begin(9600);
}

void loop()
{
  val=analogRead(tempPin);
  float mv=(val/1024.0)*5000;
  float cel=mv/10;
  float fahr=(cel/9)*5+32;

  Serial.print("TEMP. = ");
  Serial.print(cel);
  Serial.print(" c");
  Serial.println();
  delay(1000);
}
