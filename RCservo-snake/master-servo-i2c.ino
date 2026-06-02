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
byte x = 0;



void setup() {
  Wire.begin(); // join i2c bus (address optional for master)
  Serial.begin(115200);           // start serial for output
    Serial.println ("Master Started");  
  myservoB.attach(9);  // attaches the servo on pin 9 to the servo object
 myservoA.attach(10);
  myservoD.attach(7);
   myservoC.attach(8);

     
}


// Wire Master Writer
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Writes data to an I2C/TWI slave device
// Refer to the "Wire Slave Receiver" example for use with this

// Created 29 March 2006

// This example code is in the public domain.


void Sendi2cInt(int x) {
  Wire.beginTransmission(8); // transmit to device #8
 // Wire.write("x is ");        // sends five bytes
  Wire.write(x & 0xff);              // sends one byte
  Wire.write((x >> 8) & 0xff);              // sends one byte
  Wire.endTransmission();    // stop transmitting

}

#define pi2r  0.01745329251
int amplitude = 20;
#define pos(x) (sin(( x % 360)* pi2r ) * amplitude + 90)

void loop() {

 phase += 5;  
 if ( phase > 360) phase = 0;
    Sendi2cInt(phase);
    // in steps of 1 degree
    myservoA.write(pos(phase + 0)); 
    myservoB.write(pos(phase + 60));           
    myservoC.write(pos(phase + 120)); 
    myservoD.write(pos(phase + 270));

    delay(40);                       // waits 15ms for the servo to reach the position
 

}





