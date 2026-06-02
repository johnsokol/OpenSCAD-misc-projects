/* Sweep
 by BARRAGAN <http://barraganstudio.com>
 This example code is in the public domain.

 modified 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Sweep
*/

#include <Servo.h>
#include <Wire.h>


//Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards
Servo myservoA; 
Servo myservoB; 
Servo myservoC; 
Servo myservoD; 

//int pos = 0;    // variable to store the servo position

int phase = 0;



void setup() {
  Wire.begin(8);                // join i2c bus with address #8
  Wire.onReceive(receiveEvent); // register event
  Serial.begin(115200);           // start serial for output
  Serial.println ("Slave Started");  
  myservoB.attach(9);  // attaches the servo on pin 9 to the servo object
  myservoA.attach(10);
  myservoD.attach(7);
  myservoC.attach(8);

     
}


// Wire Slave Receiver
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Receives data as an I2C/TWI slave device
// Refer to the "Wire Master Writer" example for use with this

// Created 29 March 2006

// This example code is in the public domain.


// function that executes whenever data is received from master
// this function is registered as an event, see setup()
void receiveEvent(int howMany) {

  
// while (1 < Wire.available()) { // loop through all but the last
//   byte c = Wire.read(); // receive byte as a character
//   Serial.print(c);         // print the character
//  }

if(howMany != 2){
  Serial.print("recieved  ");
    Serial.print(howMany);
      Serial.println(" bytes");
}
  
 byte xl = Wire.read();    // receive byte as an integer
 byte xh = Wire.read();    // receive byte as an integer
 phase =  xl | (xh << 8);    // receive byte as an integer

#ifdef noprint
 Serial.print (xl);         // print the integer
 Serial.print (":");
 Serial.print (xh);         // print the integer
 Serial.print ("-");

#endif 
 Serial.println(phase);

}


#define pi2r  0.01745329251
int amplitude = 20;
#define pos(x) (sin(( x % 360)* pi2r ) * amplitude + 90)

void loop() {
static int ophase;


// phase += 1;  
 if ( phase > 360) phase = 0;

 
 if ( phase != ophase){
   ophase = phase;
   
    // in steps of 1 degree
    myservoA.write(pos(phase + 0)); 
    myservoB.write(pos(phase + 60));           
    myservoC.write(pos(phase + 120)); 
    myservoD.write(pos(phase + 270));
 }
    delay(4);                       // waits 15ms for the servo to reach the position
 

}




