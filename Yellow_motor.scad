///////////////////////////////////////////////


//smooth curves
$fs=0.5;

//fundamental measurements, these are things we can't change
//button_r = 7;
//bolt_r = 1.5;

//how big we want the case
width=150;
length=370;
height=2;


//screen_width = 145;
//screen_height = 45;
//screen_length = 225;

//tablet_width = 175;
//tablet_height = 45;
//tablet_length = 265;

//some adjustable parameters
//thickness = 3.175; // 1/8 inch acrylic - material thickness
spacing = 15;

curve1=20;
curve2=20;
curve3=20;

 //For Uno
 A_len = 68.6;
 A_wid = 53.3;


projection() 
  Yellow_motor_mount();

module Arduino_platform()
{
    

   difference()
    {
        
       // blank_panel();
        
       // build_bolts();
        Arduino_board();
        Arduino_bolts();
    }

  // translate([70,0,0])


}


module Yellow_motor_mount()
{
 l=64.5;
 w=22.3;
 screw_space=17.5;
 w2=w/2;
 sh=31.8;

so= (w / 2 ) -(screw_space/2);

 difference()
    {
   cube([l,w,1],center=false);
  
   translate([12.2,w2 ,0])
      cylinder(r=14/2,3,center=true); 
  
  

   translate([sh + 0.7,so ,0])
      cylinder(r=3.2/2,3,center=true); 
   translate([sh + 0.7,w-so ,0])
      cylinder(r=3.2/2,3,center=true); 

   translate([sh-8,w2 ,0])
      cylinder(r=4/2,3,center=true); 

   translate([sh + 11,w2 -2.5 ,-2])
      cube([2.5,5,4],center=false);

  // translate([14,A_wid - so ,0])
   //     cylinder(r=bolt_r,h=height*1.5,center=true);
  }
}



module Arduino_board()
{
 cube([A_len,A_wid,1],center=false);

}

module Arduino_bolts()
{


 so =2.5; //Screw offset
 bolt_r = 3.2/2;

 
   translate([14,A_wid - so ,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);

   translate([14+1.3,so ,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);

   translate([14+1.3+50.8,so + 15.2 ,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);

    translate([14+1.3+50.8,so + 15.2 + 27.9 ,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);
}

