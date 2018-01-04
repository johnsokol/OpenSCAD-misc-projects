
toMetric = 25.4; 

SWwidth= ( 13/16 ) * toMetric;
SWradius=  (1 + 15/16 )/2 * toMetric;
SWhub=(1/4)/2 * toMetric;
hub=0;

RackSpacing=3 * toMetric;
Racklength=4 * 12 * toMetric;

module SkateWheel()
{

 difference(){
 cylinder(r=SWradius, h=SWwidth, $fn=200);

 if(hub){
 translate([0,0,-0.5])
   cylinder(r=SWhub, h=SWwidth + 1, $fn=200);
 }
 }

}


module Rack()
{
 n = 3;
 for (i = [-n:n])
 {
  translate([0,i *RackSpacing,0 ])
  SkateWheel();
 }
}




module Gear(){

cylinder(r=SWhub, h=SWwidth + 1, $fn=200);



 n = 30;
 ARange=(460 / 2) / n;

 for (i = [-n:n])
 {


  rotate([0,0,i * ARange])

  translate([RackSpacing, -i * ARange / (60/RackSpacing) ,0 ])

  Rack();

 }




}

Gear();








