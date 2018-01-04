// GM17 Gearmotor model

mounting_hole_radius 		= 0.104/2;
mounting_hole_seperation 	= 0.878;
shaft_guard_ring_radius		= 0.359/2;
//shaft_guard_ring_height	= ??;
shaft_radius			= 0.270/2;
shaft_width				= 0.185;
shaft_height			= 0.221;
shaft_cp_to_tab			= 1.415;
body_width				= 1.072;
body_length_without_tab	= 1.838;
tab_hole_cp_to_body		= 0.120;
corner_radius			= (body_width-mounting_hole_seperation)/2;
support_radius 			= 0.132/2;
support_height			= shaft_height/3; //?? not specified in datasheet
support_cp_to_tab                 	= 0.958;
motor_radius 			= 1.065/2;
tab_height				= 0.060;
motor_height			= 1.265;
body_height 			= 0.640;

GM17();

module GM17_outline(){
	projection(cut=true){
		difference(){
			cube(size=[body_length_without_tab,body_width,body_height]);
			translate([0,0,0]){corner_round(corner_radius,body_height,-90);}
			translate([body_length_without_tab,0,0]){corner_round(corner_radius,body_height,0);}
			translate([0,body_width,0]){corner_round(corner_radius,body_height,180);}
			translate([body_length_without_tab,body_width,0]){corner_round(corner_radius,body_height,90);}
		}
		mirror([1,0,0]){translate([-body_length_without_tab,0,0]){
		difference(){
			union(){
				translate([-tab_hole_cp_to_body,body_width/2,0]){
					rotate([0,0,90]){cylinder(r=mounting_hole_radius*2,h=tab_height,$fn=100);}
				}
				translate([-2*mounting_hole_radius,body_width/2-4*mounting_hole_radius,0]){
					cube(size=[4*mounting_hole_radius,8*mounting_hole_radius,tab_height]);
				}
			}
			translate([-2*mounting_hole_radius,body_width/2-4*mounting_hole_radius,-tab_height]){
				rotate([0,0,90]){cylinder(r=mounting_hole_radius*2,h=3*tab_height,$fn=100);}
			}
			translate([-2*mounting_hole_radius,body_width/2+4*mounting_hole_radius,-tab_height]){
				rotate([0,0,90]){cylinder(r=mounting_hole_radius*2,h=3*tab_height,$fn=100);}
			}
		}
		}}
	}	
}
module GM17_holes(){
	projection(cut=true){
		mounting_holes();
		support();
		mirror([1,0,0]){
			translate([-body_length_without_tab,0,0]){
				translate([-tab_hole_cp_to_body,body_width/2,-tab_height]){
					rotate([0,0,90]){
						cylinder(r=mounting_hole_radius,h=3*tab_height,$fn=100);
					}
				}
			}
		}
		translate([body_length_without_tab-shaft_cp_to_tab,body_width/2,-shaft_height]){
			rotate([0,0,90]){cylinder(r=shaft_radius,h=shaft_height+1,$fn=100);}
		}
	}	
}

module GM17(){
	color([1,1,1,1]){
		main_body();
		motor();
		shaft();
		tab();
		support();
	}
}

module main_body(){
	difference(){
		cube(size=[body_length_without_tab,body_width,body_height]);
		translate([0,0,0]){corner_round(corner_radius,body_height,-90);}
		translate([body_length_without_tab,0,0]){corner_round(corner_radius,body_height,0);}
		translate([0,body_width,0]){corner_round(corner_radius,body_height,180);}
		translate([body_length_without_tab,body_width,0]){corner_round(corner_radius,body_height,90);}
		mounting_holes();
	}
}
module motor(){
	translate([body_length_without_tab-body_width/2,body_width/2,0]){rotate([0,0,90]){
		cylinder(r=motor_radius,h=motor_height,$fn=100);}
	}
}
module mounting_holes(){
	mhr = mounting_hole_radius;
	translate([2*mhr,2*mhr,-body_height/2]){
		rotate([0,0,90]){cylinder(r=mhr,h=2*body_height,$fn=100);}
	}
	translate([2*mhr,mounting_hole_seperation+2*mhr,-body_height/2]){
		rotate([0,0,-90]){cylinder(r=mhr,h=2*body_height,$fn=100);}
	}
}
module shaft(){
	translate([body_length_without_tab-shaft_cp_to_tab,body_width/2,-shaft_height]){
		rotate([0,0,90]){
			difference(){
				cylinder(r=shaft_radius,h=shaft_height,$fn=100);
				translate([0.5*shaft_width,-1.5*shaft_radius,-0.5*shaft_height]){
					cube([shaft_radius,shaft_radius*3,shaft_height*2]);
				}
				translate([-shaft_radius-0.5*shaft_width,-1.5*shaft_radius,-0.5*shaft_height]){
					cube([shaft_radius,shaft_radius*3,shaft_height*2]);
				}
			}
		}
	}
}
module tab(){
mirror([1,0,0]){translate([-body_length_without_tab,0,0]){
	difference(){
		union(){
			translate([-tab_hole_cp_to_body,body_width/2,0]){
				rotate([0,0,90]){cylinder(r=mounting_hole_radius*2,h=tab_height,$fn=100);}
			}
			translate([-2*mounting_hole_radius,body_width/2-4*mounting_hole_radius,0]){
				cube(size=[4*mounting_hole_radius,8*mounting_hole_radius,tab_height]);
			}
		}
		translate([-tab_hole_cp_to_body,body_width/2,-tab_height]){
			rotate([0,0,90]){cylinder(r=mounting_hole_radius,h=3*tab_height,$fn=100);}
		}
		translate([-2*mounting_hole_radius,body_width/2-4*mounting_hole_radius,-tab_height]){
			rotate([0,0,90]){cylinder(r=mounting_hole_radius*2,h=3*tab_height,$fn=100);}
		}
		translate([-2*mounting_hole_radius,body_width/2+4*mounting_hole_radius,-tab_height]){
			rotate([0,0,90]){cylinder(r=mounting_hole_radius*2,h=3*tab_height,$fn=100);}
		}
	}
}}
}
module support(){
	translate([body_length_without_tab-support_cp_to_tab,body_width/2,-support_height]){
		rotate([0,0,90]){
			cylinder(r=support_radius,h=support_height+1,$fn=100);
		}
	}
}
module corner_round(R,H,rot){
	rotate([90,0,rot]){
		difference(){
			translate([-R,-H/2,-R]){cube([2*R,2*H,2*R]);}
			translate([-R,-H,-R]){rotate([-90,0,0]){cylinder(r=R,h=3*H,$fn=100);}}
		}
	}
}