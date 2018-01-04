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
  Arduino_platform();

module Arduino_platform()
{
    

   difference()
    {
        
       // blank_panel();
        
       // build_bolts();
        Arduino_board();
        Arduino_bolts();
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


module build_bolts(bolt_r = 8.5/2)
{

 screw_l = 330; //mm
 screw_wf = 110;
 screw_wb = 95;

    //translate([-width/2+spacing/2,-length/2+spacing/2,0])
   translate([screw_wf /2 ,-screw_l /2,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);

   translate([-screw_wf /2 ,-screw_l /2,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);

   translate([screw_wb /2 ,screw_l /2,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);

   translate([-screw_wb /2 ,screw_l /2,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);
}


module blank_panel()
{

    mink_r = curve1/2;
    color("Blue")
    minkowski()
    {
        //have to take into account the radius of the cylinder, so subtract from width and length

        cube([width-mink_r*2,length-mink_r*2,thickness],center=true);
        cylinder(r=curve1/2,h=0.01);
    }
}
