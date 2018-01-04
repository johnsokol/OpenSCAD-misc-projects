
spokes= 12.7 -1 ;

projection(){




difference()
{

 cylinder(h=1, r=6, $fa=2);
 //translate([0,0,-1])
 // cylinder(h=3, r= 140, $fa=2);

translate([0,-2.5,-1])
    intersection(){
		 cylinder (	r=5/2,h=5, $fn=200);

    //   translate([0,0,0 ])
   // cube([bore_diameter/2,max(rim_thickness,hub_thickness,gear_thickness),bore_diameter/2],center=true);
        translate([0,0.5,0])
         cube([10,5,10],center=true);
     }



}


}
