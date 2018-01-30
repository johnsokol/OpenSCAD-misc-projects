///////////////////////////////////////////////


//smooth curves
$fs=0.5;

//fundamental measurements, these are things we can't change
//button_r = 7;
//bolt_r = 1.5;

//how big we want the case
width=86;
length=86;
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

curve1=3;
curve2=20;
curve3=20;

 //For Roboterra Uno
 A_len = 86;
 A_wid = 86;
 
 difference()
{
blank_panel();
build_bolts();
}
//  Arduino_platform();

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
    square([A_len,A_wid],center=false);

}
module Arduino_bolts()
{


 so =2.5; //Screw offset
 bolt_r = 3.2/2;

 
   translate([14,A_wid - so ,0])
        circle(r=bolt_r,center=true);

   translate([14+1.3,so ,0])
        circle(r=bolt_r,center=true);

   translate([14+1.3+50.8,so + 15.2 ,0])
        circle(r=bolt_r,center=true);

    translate([14+1.3+50.8,so + 15.2 + 27.9 ,0])
        circle(r=bolt_r,center=true);
}


module build_bolts(bolt_r = 3.4/2)
{

 screw_l = 80; //mm
 screw_wf = 80;
 screw_wb = 80;

    //translate([-width/2+spacing/2,-length/2+spacing/2,0])
   translate([screw_wf /2 ,-screw_l /2,0])
        circle(r=bolt_r, center=true);

   translate([-screw_wf /2 ,-screw_l /2,0])
        circle(r=bolt_r, center=true);

   translate([screw_wb /2 ,screw_l /2,0])
        circle(r=bolt_r, center=true);

   translate([-screw_wb /2 ,screw_l /2,0])
        circle(r=bolt_r, center=true);
}


module blank_panel()
{

    mink_r = curve1/2;
    color("white")
    minkowski()
    {
        //have to take into account the radius of the cylinder, so subtract from width and length

        square([width-mink_r*2,length-mink_r*2],center=true);
        //color("red")
        circle(r=curve1/2);
    }
}
