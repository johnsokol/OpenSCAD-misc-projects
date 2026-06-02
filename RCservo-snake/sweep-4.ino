/* Sweep
 by BARRAGAN <http://barraganstudio.com>
 This example code is in the public domain.

 modified 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Sweep
*/

#include <Servo.h>

//Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards
Servo myservoA; 
Servo myservoB; 
Servo myservoC; 
Servo myservoD; 

//int pos = 0;    // variable to store the servo position

int phase = 0;


void setup() {
  myservoB.attach(9);  // attaches the servo on pin 9 to the servo object
 myservoA.attach(10);
  myservoD.attach(7);
   myservoC.attach(8);

     
}

#define pi2r  0.01745329251
int amplitude = 20;
#define pos(x) (sin(( x % 360)* pi2r ) * amplitude + 90)

void loop() {

 phase += 1;  
 if ( phase > 360) phase = 0;

    // in steps of 1 degree
    myservoA.write(pos(phase + 0)); 
    myservoB.write(pos(phase + 120));           
    myservoC.write(pos(phase + 270)); 
    myservoD.write(pos(phase + 0));

    delay(4);                       // waits 15ms for the servo to reach the position
 

}

