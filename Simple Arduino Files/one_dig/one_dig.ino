//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/

//****************************************************
//Name :Mohannad Rawashdeh .
//Date "24/8/2012 12:00pm
// Description: This code used to Drive One seven segment directley 
//from arduino board , using pin D2-D9 
// Programmed for http://www.Genotronex.webs.com
                
//****************************************************************

int i=100;
void setup() {
   // Define Pins
        pinMode(2, OUTPUT); //expression about g
        pinMode(3, OUTPUT); //expression about f
        pinMode(4, OUTPUT); //expression about a
        pinMode(5, OUTPUT); //expression about b
        pinMode(6, OUTPUT); //expression about e 
        pinMode(7, OUTPUT); //expression about d
        pinMode(8, OUTPUT); //expression about c
        pinMode(9, OUTPUT);  ////expression about dot   
}  
        void one(){
         digitalWrite(2,HIGH);
         digitalWrite(3,HIGH);
         digitalWrite(4,HIGH);
         digitalWrite(5,LOW);
         digitalWrite(6,HIGH);
         digitalWrite(7,HIGH);
         digitalWrite(8,LOW);
         digitalWrite(9,HIGH);
        }
        //------------------------------------------------
        void two(){
         digitalWrite(2,LOW);
         digitalWrite(3,HIGH);
         digitalWrite(4,LOW);
         digitalWrite(5,LOW);
         digitalWrite(6,LOW);
         digitalWrite(7,LOW);
         digitalWrite(8,HIGH);
         digitalWrite(9,HIGH);
        }
        //--------------------------------------------------
        void zero(){
          digitalWrite(2,HIGH);
         digitalWrite(3,LOW);
         digitalWrite(4,LOW);
         digitalWrite(5,LOW);
         digitalWrite(6,LOW);
         digitalWrite(7,LOW);
         digitalWrite(8,LOW);
         digitalWrite(9,HIGH);
        }
        //---------------------------------------------------
        void clr(){
         digitalWrite(2,HIGH);
         digitalWrite(3,HIGH);
         digitalWrite(4,HIGH);
         digitalWrite(5,HIGH);
         digitalWrite(6,HIGH);
         digitalWrite(7,HIGH);
         digitalWrite(8,HIGH);
         digitalWrite(9,HIGH);
        }
        //----------------------------------------------------
         void three(){
         digitalWrite(2,LOW);
         digitalWrite(3,HIGH);
         digitalWrite(4,LOW);
         digitalWrite(5,LOW);
         digitalWrite(6,HIGH);
         digitalWrite(7,LOW);
         digitalWrite(8,LOW);
         digitalWrite(9,HIGH);
        }
         //---------------------------------------------------
        void four(){
         digitalWrite(2,LOW);
         digitalWrite(3,LOW);
         digitalWrite(4,HIGH);
         digitalWrite(5,LOW);
         digitalWrite(6,HIGH);
         digitalWrite(7,HIGH);
         digitalWrite(8,LOW);
         digitalWrite(9,HIGH);
        }
         //---------------------------------------------------
        void five(){
         digitalWrite(2,LOW);
         digitalWrite(3,LOW);
         digitalWrite(4,LOW);
         digitalWrite(5,HIGH);
         digitalWrite(6,HIGH);
         digitalWrite(7,LOW);
         digitalWrite(8,LOW);
         digitalWrite(9,HIGH);
        }
        //----------------------------------------------------
        void six(){
         digitalWrite(2,LOW);
         digitalWrite(3,LOW);
         digitalWrite(4,LOW);
         digitalWrite(5,HIGH);
         digitalWrite(6,LOW);
         digitalWrite(7,LOW);
         digitalWrite(8,LOW);
         digitalWrite(9,HIGH);
        }
        //----------------------------------------------------
        void seven(){
         digitalWrite(2,HIGH);
         digitalWrite(3,HIGH);
         digitalWrite(4,LOW);
         digitalWrite(5,LOW);
         digitalWrite(6,HIGH);
         digitalWrite(7,HIGH);
         digitalWrite(8,LOW);
         digitalWrite(9,HIGH);
        }
        //----------------------------------------------------
        void eight(){
         digitalWrite(2,LOW);
         digitalWrite(3,LOW);
         digitalWrite(4,LOW);
         digitalWrite(5,LOW);
         digitalWrite(6,LOW);
         digitalWrite(7,LOW);
         digitalWrite(8,LOW);
         digitalWrite(9,HIGH);
        }
        //----------------------------------------------------
        void nine(){
         digitalWrite(2,LOW);
         digitalWrite(3,LOW);
         digitalWrite(4,LOW);
         digitalWrite(5,LOW);
         digitalWrite(6,HIGH);
         digitalWrite(7,LOW);
         digitalWrite(8,LOW);
         digitalWrite(9,HIGH);
        }
        //----------------------------------------------------
         
        //****************************************************
        void loop(){
          zero(); delay(i);clr();
          one();  delay(i);clr();
          two();  delay(i);clr();
          three();delay(i);clr();
          four(); delay(i);clr();
          five(); delay(i);clr();
          six();  delay(i);clr();
          seven();delay(i);clr();
          eight();delay(i);clr();
          nine(); delay(i);clr();
        }
          
              
       
        
        

