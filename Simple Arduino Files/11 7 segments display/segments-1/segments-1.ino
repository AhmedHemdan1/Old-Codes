// =================================================================
// Title     :  7 segment displays
// Author    :  Eng. Mohamed Sayed Yousef  -  Mansoura, Egypt
//              https://www.facebook.com/mohamedyousef.net
// Date      :  10/7/2015
// Hardware  :  Arduino Uno v3 + 74HC595 + common cathode 7 segments 
// =================================================================

const byte DATA_PIN = 0;        // Serial output to shift register (14)
const byte LATCH_PIN = 7;       // Shift register latch pin (12)
const byte CLOCK_PIN =  8;      // Shift register clock pin (11)

//Sequence of numbers
byte numbers[] = {B11111100,   // 0
                  B01100000,   // 1
                  B11011010,   // 2
                  B11110010,   // 3
                  B01100110,   // 4
                  B10110110,   // 5
                  B10111110,   // 6
                  B11100000,   // 7
                  B11111110,   // 8
                  B11110110};  // 9
               
void setup() {
  //Set pins as outputs
  pinMode(DATA_PIN, OUTPUT);
  pinMode(LATCH_PIN, OUTPUT);  
  pinMode(CLOCK_PIN, OUTPUT);
}


void loop() {  
  for(int i=0; i < sizeof(numbers) ; i++){
    digitalWrite(LATCH_PIN, LOW);
    shiftOut(DATA_PIN, CLOCK_PIN, LSBFIRST, numbers[i]);
    digitalWrite(LATCH_PIN, HIGH);
    delay(1000);
  }
}


