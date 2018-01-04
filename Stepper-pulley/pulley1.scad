
spokes= 12.7 -1 ;

projection(){




difference()
{

 cylinder(h=1, r=20, $fa=2);
 //translate([0,0,-1])
 // cylinder(h=3, r= 140, $fa=2);

translate([0,0,-1])
    intersection(){
		 cylinder (	r=5/2,h=5, $fn=200);

    //   translate([0,0,0 ])
   // cube([bore_diameter/2,max(rim_thickness,hub_thickness,gear_thickness),bore_diameter/2],center=true);
         cube([10,3,10],center=true);
     }

    translate([spokes,0,-1])
    cylinder ( r=1,h=5,$fn=20 );

     rotate(120)
    translate([spokes,0,-1])
    cylinder ( r=1,h=5,$fn=20 );

     rotate(240)
    translate([spokes,0,-1])
    cylinder ( r=1,h=5,$fn=20 );

}

    translate([43,0,0])
difference()
{

 cylinder(h=1, r=20, $fa=2);
 //translate([0,0,-1])
 // cylinder(h=3, r= 140, $fa=2);

translate([0,0,-1])
    
		 cylinder (	r=5/2,h=5, $fn=200);


    translate([spokes,0,-1])
    cylinder ( r=1,h=5,$fn=20 );

     rotate(120)
    translate([spokes,0,-1])
    cylinder ( r=1,h=5,$fn=20 );

     rotate(240)
    translate([spokes,0,-1])
    cylinder ( r=1,h=5,$fn=20 );

}

}
