projection() 
  Yellow_motor_mount();
  
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

