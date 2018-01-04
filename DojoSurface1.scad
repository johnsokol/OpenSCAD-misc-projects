///////////////////////////////////////////////
//simple case to show boolean method of creating parts for laser/cnc cutting
//Matt Venn 2013, releases under an open source license.
//mattvenn.net

//smooth curves
$fs=0.5;

//fundamental measurements, these are things we can't change
button_r = 7;
bolt_r = 1.5;

//how big we want the case
width=195;
length=335;
height=40;


screen_width = 145;
screen_height = 45;
screen_length = 225;

tablet_width = 175;
tablet_height = 45;
tablet_length = 265;

//some adjustable parameters
thickness = 3.175; // 1/8 inch acrylic - material thickness
spacing = 15;

curve1=20;
curve2=20;
curve3=20;

///////////////////////////////////////////////
//show where the bits of the case are
//build_front();
//build_back();
//build_side_l();
//build_side_r();
//build_buttons();
//build_bolts();

//to make dxfs, uncomment these
//projection() build_front();
//projection() build_back();
//projection() rotate([0,90,0]) build_side_l();

//projection() 
  tablet_mount();


///////////////////////////////////////////////
//the models: these are built at the 0,0,0 point and are all centered


module tablet_mount()
{
build_Layer1();
translate([width + 10,0,0])
build_Layer2();
translate([(width + 10) * 2,0,0])
build_Layer2();

translate([(width + 10) * 3,0,0])
build_Layer3();
}


module short_side()
{
   slot_length = length / 5;
   cube([height-2*thickness,length,thickness],center=true); 
   translate([0,length/2-slot_length/2,0])
       cube([height+0.1,slot_length,thickness],center=true);
   translate([0,-length/2+slot_length/2,0])
       cube([height+0.1,slot_length,thickness],center=true);
}

module front_or_back()
{
    mink_r = thickness/2;
    minkowski()
    {
        //have to take into account the radius of the cylinder, so subtract from width and length
        cube([width-mink_r*2,length-mink_r*2,thickness],center=true);
        cylinder(r=thickness/2,h=0.01);
    }
}

///////////////////////////////////////////////
//the models moved to the correct position, and with intersecting parts cut out of them using difference()

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

module blank_screen()
{


    mink_r = curve2/2;
    minkowski()
    {
        //have to take into account the radius of the cylinder, so subtract from width and length
        cube([screen_width-mink_r*2,screen_length-mink_r*2,height],center=true);
        cylinder(r=curve2/2,h=0.01);
    }
}

module blank_tablet()
{
    mink_r = curve3/2;
    minkowski()
    {
        //have to take into account the radius of the cylinder, so subtract from width and length
        cube([tablet_width-mink_r*2,tablet_length-mink_r*2,height * 0.7],center=true);
        cylinder(r=curve3/2,h=0.01);
    }
}

module Camera_hole()
{

//    translate([-screen_width/2+15/2,-length/2+spacing/2,0])
    translate([-screen_width/2-15/2,0,0])
        cylinder(r=6,h=height*1.5,center=true);
}

module build_powerplug()
{
    translate([+width/2-55,-tablet_length/2-14,0])
    cube([15,31,height * 0.7],center=true);
}


module build_Layer1()
{
    

    difference()
    {
       // translate([0,0,-height/2+thickness/2+20])
        blank_panel();
        //build_bolts();
       // blank_tablet();
        blank_screen();
        Camera_hole();

    }

}

module build_Layer2()
{
    

    difference()
    {
        //translate([0,0,-height/2+thickness/2+20])
        blank_panel();
        blank_tablet();
        build_bolts();
        build_powerplug();

    }

}

module build_Layer3()
{
    

    difference()
    {
        //translate([0,0,-height/2+thickness/2+20])
        blank_panel();
        blank_tablet();
        build_bolts();
        build_bolts(bolt_r = 3);
        build_powerplug();

    }

}
module build_front()
{
    difference()
    {
        translate([0,0,height/2-thickness/2])
            front_or_back();
        build_side_r();
        build_side_l();
        build_buttons();
        build_bolts();
    }
}
module build_back()
{
    difference()
    {
        translate([0,0,-height/2+thickness/2])
            front_or_back();
        build_side_r();
        build_side_l();
        build_bolts();
    }
}

module build_side_r()
{
    color("grey")
        translate([+width/2-spacing,0,0])
            rotate([0,90,0])
                short_side();
}

module build_side_l()
{
    color("grey")
        translate([-width/2+spacing,0,0])
            rotate([0,90,0])
                short_side();
}

///////////////////////////////////////////////
//so simple and we're never going to cut these parts, that we combine the build and model in one module
module build_buttons()
{
    color("blue")
    {
        translate([-width/6,0,height/2])
            cylinder(r=10,h=20,center=true);
        translate([+width/6,0,height/2])
            cylinder(r=10,h=20,center=true);
    }
}

module build_bolts(bolt_r = 1.5)
{
    translate([-width/2+spacing/2,-length/2+spacing/2,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);
    translate([+width/2-spacing/2,-length/2+spacing/2,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);
    translate([-width/2+spacing/2,+length/2-spacing/2,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);
    translate([+width/2-spacing/2,+length/2-spacing/2,0])
        cylinder(r=bolt_r,h=height*1.5,center=true);
}