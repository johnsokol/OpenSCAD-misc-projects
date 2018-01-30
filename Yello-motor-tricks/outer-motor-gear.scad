
$fs=0.5;
      // import(file = "gear2mmx63.dxf");

projection()
{ 
  plate1();
    
    
 //translate([0,30,0])
 
}


module plate1(){
    
    x=10.8;

difference() 
    {
              
    linear_extrude(height = 1, center = true) 
         import(file = "gear2mmx80.dxf");

       //cylinder(r=15,1,center=true); 
        
       //import(file = "gear2mmx63.dxf");
    
       translate([0,-x,0])
       motor_profile();
    }
}


module motor_profile(){
    
    l = 22.25;
    h = 80; //36.5;


  translate([0, h/2,0])
  curve_cube(length = h, width=l, thickness = 1, curve = 7);

}
module curve_cube()
{    
    mink_r = curve/2;
    //color("Blue")
  //  translate([width/2,height/2,thickness/2])
    minkowski()
    {
        //have to take into account the radius of the cylinder, so subtract from width and length

        cube([width-mink_r*2,length-mink_r*2,thickness],center=true);
        cylinder(r=curve/2,h=0.01);
    }
}
