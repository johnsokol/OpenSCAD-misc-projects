
toMetric = 25.4; 

SWwidth= ( 13/16 ) * toMetric;
SWradius=  (1 + 15/16 )/2 * toMetric;

//SWradius=  (1/4 )/2 * toMetric;

SWhub=(3/8)/2 * toMetric;

;

RackSpacing=3 * toMetric;
Racklength=4 * 12 * toMetric;


screw1=3.5; // mm which is 6-32 english screw, make sure we div2 for radius and nor diameter

WoodThickness = 5; // 5 mm  or around 1/5 of an inch. 



module SkateWheel(hub=0)
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

  translate([RackSpacing * 1.0  , -i * ARange / (60/RackSpacing) ,0 ])

  Rack();

 }

}




module ImportGear(){

 for (i = [0:6])
 {

   rotate([0,0,i * 60])
  import(file = "skatewheelgear2c-60deg.dxf");

 }
}

module Final(){
difference(){
// translate([0,0,0.5])
circle(r=110, h=SWwidth - 1, $fn=200);
ImportGear();
//Gear();

}
}


module PrintWheels(){

 for (i = [0:6]){
    translate([0,(SWradius*2 + 2) * i,0]){
       SkateWheel(hub=1);
      translate([SWradius * 1.7 +2,SWradius +1,0]){
       SkateWheel(hub=1);
        translate([SWradius * 1.7 +2,-SWradius +1,0])
       SkateWheel(hub=1);
      }
    }
 }

}


module PrintRack(){

 StartOffset= 1.5 * toMetric;
 RackHeight = 2.5 * toMetric;

 difference(){
 square ([RackHeight , 36 * toMetric]);

  translate([0, StartOffset ,0])
   for (i = [0:11]){
    translate([0.5 * toMetric, RackSpacing * i,0])
     circle(r=screw1/2, $fn=20);

 //translate([0.5 * toMetric, RackSpacing * i,0])
// SkateWheel();


    translate([RackHeight - 3* WoodThickness, RackSpacing * i - WoodThickness * 1.5,0])
     square ([WoodThickness ,WoodThickness]);

    translate([RackHeight - 3* WoodThickness, RackSpacing * i + 0.5 * WoodThickness ,0])
     square ([WoodThickness ,WoodThickness]);


    translate([RackHeight - 4* WoodThickness, RackSpacing * i - 1.5 * WoodThickness ,0])
     square ([WoodThickness ,3* WoodThickness]);


   }
 }
}



module PrintRacks(){
 rotate([0,0,90]){
   PrintRack();
    translate([2.7 * toMetric,0,0])
    PrintRack();
  }
}



module PrintMount1(){

  RackWidth = 1/4 * toMetric + 2 * WoodThickness;
  Length = RackWidth + 6 * WoodThickness;
  Width = 3 * WoodThickness;

  difference(){
     square ([Width ,Length]);

    translate([0 * WoodThickness,Length - WoodThickness ,0])
    square ([WoodThickness ,WoodThickness]);

    translate([0 * WoodThickness, 0 * WoodThickness ,0])
    square ([WoodThickness ,WoodThickness]);

    translate([2 * WoodThickness,0*  WoodThickness ,0])
    square ([WoodThickness ,WoodThickness]);

    translate([2 * WoodThickness, Length - WoodThickness ,0])
    square ([WoodThickness ,WoodThickness]);

// Show Rack in center
 //   translate([0 * WoodThickness,3 *  WoodThickness ,0])
 //   square ([Width ,RackWidth]);

    translate([1.5 * WoodThickness,2*  WoodThickness ,0])
    circle(r=screw1/2, $fn=20);

    translate([1.5 * WoodThickness,Length - 2*  WoodThickness ,0])
    circle(r=screw1/2, $fn=20);
 }

}

module PrintMount2(){
  RackWidth = 1/4 * toMetric + 2 * WoodThickness;
  Length = RackWidth + 6 * WoodThickness;
  Width = 4 * WoodThickness;

  difference(){
     square ([Width ,Length]);

    translate([Width -  WoodThickness,WoodThickness ,0])
    square ([ WoodThickness ,Length - 2 * WoodThickness]);

   // translate([ 0,4 * WoodThickness ,0])
   // square ([ 2 * WoodThickness ,1/4 * toMetric ]);

    translate([ 0 ,3 * WoodThickness ,0])
    square ([ 2 * WoodThickness ,WoodThickness]);
    translate([ 0 ,Length - 4 * WoodThickness ,0])
    square ([ 2 * WoodThickness ,WoodThickness]);

  }
}

module PrintMounts(){

PrintMount1();
    translate([ 0 ,50,0])

PrintMount2();
    translate([ 0 ,100,0])

PrintMount2();
}

//Gear();
//Final();

//PrintWheels();

//PrintRacks();

PrintMounts();


