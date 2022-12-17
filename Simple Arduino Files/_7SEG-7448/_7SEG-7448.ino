int inputs[4] = {12,11,10,9}; // A,B,C,D inputs
byte BCD[16][4] ={
{0,0,0,0},
{1,0,0,0},
{0,1,0,0},
{1,1,0,0},
{0,0,1,0},
{1,0,1,0},
{0,1,1,0},
{1,1,1,0},
{0,0,0,1},
{1,0,0,1},
{0,1,0,1},
{1,1,0,1},
{0,0,1,1},
{1,0,1,1},
{0,1,1,1},
{1,1,1,1}}; //BCD code
int number = 5; //which number in BCD code do you want to send

void setup() {
for(int a = 0; a < 4; a++){
pinMode(inputs[a], OUTPUT);} //set outputs
}

void loop() {

for(int c = 0; c < 4; c++){
digitalWrite(inputs[c], BCD[number][c]);
}
}
