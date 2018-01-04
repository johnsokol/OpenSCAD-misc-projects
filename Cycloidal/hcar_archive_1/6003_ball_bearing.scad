mm_per_inch 	= 25.4;
inside_diameter 	= 17/mm_per_inch;
outside_diameter 	= 35/mm_per_inch;
depth 		= 10/mm_per_inch;
wall_thickness	= 2/mm_per_inch;
retainer_indent	= 0.5/mm_per_inch;

6003_ball_bearing();

module 6003_ball_bearing_outline(){
	circle(r=outside_diameter/2,$fn=100);
}

module 6003_ball_bearing(){
	outside_ring();
	retainer();
	inside_ring();
}

module outside_ring(){
	color([1,1,1,1]){
		difference(){
			cylinder(r=outside_diameter/2,h=depth,$fn=100);
			translate([0,0,-depth]){cylinder(r=(outside_diameter-wall_thickness)/2,h=3*depth,$fn=100);}
		}
	}		
}

module inside_ring(){
	color([1,1,1,1]){
		difference(){
			cylinder(r=(inside_diameter+wall_thickness)/2,h=depth,$fn=100);
			translate([0,0,-depth]){cylinder(r=inside_diameter/2,h=3*depth,$fn=100);}
		}
	}		
}

module retainer(){
	color([0,0,0,1]){
		difference(){
			translate([0,0,retainer_indent]){cylinder(r=outside_diameter/2-wall_thickness/4,h=depth-2*retainer_indent,$fn=100);}
			translate([0,0,-depth]){cylinder(r=inside_diameter/2+wall_thickness/4,h=3*depth,$fn=100);}
		}
	}		
}