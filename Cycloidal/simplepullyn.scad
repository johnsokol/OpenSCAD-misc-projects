
kerf=0.2;


  for (a = [ 0 : 1 : 10 ])
        translate([a * 13, 0, 0])
projection(){

difference()
{

 cylinder(h=1, r=6 + kerf, $fn=200);
 //translate([0,0,-1])
 // cylinder(h=3, r= 140, $fa=2);

//translate([0,-2.5,-1])
 //   intersection(){
		 cylinder (	r=5/2 - kerf, h=5, $fn=200);

    //   translate([0,0,0 ])
   // cube([bore_diameter/2,max(rim_thickness,hub_thickness,gear_thickness),bore_diameter/2],center=true);
 //       translate([0,0.5+kerf,0])
  //       cube([10,5,10],center=true);
  //   }

}


}
