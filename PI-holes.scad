///////////////////////////////////////////////


//smooth curves
$fs=0.5;

//fundamental measurements, these are things we can't change
//button_r = 7;
//bolt_r = 1.5;

//how big we want the case
width=100;
length=80;
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



projection() build_bolts_Pi_Bplus();
  //build_platform();

module build_platform()
{
    

    difference()
    {
        
        blank_panel();
        
        //build_bolts();
        build_bolts_Pi_Bplus();
        build_bolts_solo();

    }


}


module build_bolts_solo()
{
 bolt_r = 1.8 / 2;
 screw_l = 61; //mm
 screw_wf = 41;
 screw_wb = 41;

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

module build_bolts_Pi_Bplus()
{
 bolt_r = 2.75/2;
 screw_l = 49; //mm
 screw_wf = 58;
 screw_wb = 58;

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
