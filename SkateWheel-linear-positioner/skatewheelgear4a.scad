
toMetric = 25.4; 

SWwidth= ( 13/16 ) * toMetric;
SWradius=  (1 + 15/16 )/2 * toMetric;

//SWradius=  (1/4 )/2 * toMetric;

SWhub=(1/4)/2 * toMetric;
hub=0;

RackSpacing=3 * toMetric;
Racklength=4 * 12 * toMetric;

Teeth=10;
Angle=360 / Teeth;

Radius = (RackSpacing / 2) / sin(Angle/2) ;

module SkateWheel()
{

 difference(){
 circle(r=SWradius, h=SWwidth, $fn=50);

 if(hub){
 //translate([0,0,-0.5])
   circle(r=SWhub, h=SWwidth + 1, $fn=20);
 }
 }

}


module Rack()
{
 n = 5;
 for (i = [-n:n])
 {
  translate([0,i *RackSpacing,0 ])
  SkateWheel();
 }
}




module Gear(){

circle(r=SWhub, h=SWwidth + 1, $fn=20);


 n = 60;
 ARange=(360 / 2) / n;

 for (i = [-n:n])
 {
  rotate([0,0,i * ARange])

  translate([Radius * 1.0  , -i * ARange / ((360 / Teeth)/RackSpacing) ,0 ])

  Rack();

 }

}




module ImportGear(){

 for (i = [0:6])
 {

   rotate([0,0,i * (360 / Teeth) ])
  import(file = "skatewheelgear2c-60deg-0.8.dxf");

 }
}

module Final(){
difference(){
// translate([0,0,0.5])
circle(r=Radius * 1.2 , h=SWwidth - 1, $fn=200);
//ImportGear();
Gear();

}
}


Gear();
//Final();


