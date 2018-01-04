
// Ponoko bamboo
material_thickness = 0.204; 
material_length = 31.100;
material_height = 15.100;
material_transparency = 1;


// 4-40 screw minor diameter
set_screw_minor_radius = 0.0805/2; 
set_screw_major_radius = 0.112/2; 

// 2 layers = 3/8 set screw
// 3 layers = 1/2 set screw
// 4 layers = 3/4 set screw
// needs 1 #4 wood screw 3/4" long per joint.  This forms the axle.
// not moddled in the design

// Joint parameters
// Joints connect to arms which will be described as 
// far arm and near arm.
joint_radius = 3;
joint_layers = 6;

//near arm

//far arm
ring_support_inside_radius = joint_radius-0.75;
standard_inside_radius = joint_radius-0.5;


fast_roller_number 	= 7;
slow_roller_number 	= 6;
wobble_radius		= 4/25.4;
roller_radius			= 2*wobble_radius; //roller diameter equal to eccentricity?
first_cam_radius		= standard_inside_radius-0.5-roller_radius;
second_cam_radius	= joint_radius-0.5-roller_radius;



// Arm parameters
arm_layers =4;

// visual seperation, used to look inside object
visual_seperation = 0.5;

// base
// upper arm
// lower arm
// wrist
// hand

use <GM17.scad>
use <6801_ball_bearing.scad>
use <6003_ball_bearing.scad>
GM17_shaft_cp_x = 1.072/2;
GM17_shaft_cp_y = 1.838-1.415;

basic_joint(visual_seperation);

// basic joint
module basic_joint(vs){
	translate([0,0,0]){						GM17_gearmotor();		}
	translate([0,0,vs]){						six_bolt_pattern(first_cam_radius,1/2,1/2);		}
	translate([1.535,0,vs-3/8]){					color([0.25,0.25,0.25,1]){cylinder(r=set_screw_minor_radius,h=3/8,$fn=100);}}
	translate([-GM17_shaft_cp_x+0.208,-GM17_shaft_cp_y,3*vs-3/4]){					color([0.25,0.25,0.25,1]){cylinder(r=set_screw_minor_radius,h=3/4,$fn=100);}}
	translate([-GM17_shaft_cp_x+0.208,GM17_shaft_cp_y,3*vs-3/4]){					color([0.25,0.25,0.25,1]){cylinder(r=set_screw_minor_radius,h=3/4,$fn=100);}}
	translate([0,0,-vs]){						color([166/255,128/255,100/255,material_transparency]){first_layer();}}
	translate([0,0,-2*vs]){						six_bolt_pattern((standard_inside_radius+joint_radius)/2,3/4,3/4);}
	translate([0,0,-material_thickness-2*vs]){			color([166/255,128/255,100/255,material_transparency]){second_layer_shaft();}}
	translate([0,0,-material_thickness-3*vs]){			6801_ball_bearing();		}
	translate([0,0,-material_thickness-4*vs]){			color([166/255,128/255,100/255,material_transparency]){second_layer_GM17_mount();}}
	translate([0,0,-material_thickness-5*vs]){			color([166/255,128/255,100/255,material_transparency]){second_layer_support_ring();}}
	translate([0,0,-2*material_thickness-5*vs]){		rotate([0,0,-90]){translate([-wobble_radius,0,0]){five_bolt_pattern(first_cam_radius-0.5,3/8,3/8);}}}
	translate([0,0,-2*material_thickness-6*vs]){		color([166/255,128/255,100/255,material_transparency]){third_layer_wobbler();}}
	translate([0,0,-2*material_thickness-7*vs]){		color([166/255,128/255,100/255,material_transparency]){third_layer_gear_ring();}}
	translate([0,0,-2*material_thickness-8*vs]){		color([166/255,128/255,100/255,material_transparency]){third_layer_fixed_ring();}}
	translate([0,0,-2*material_thickness-9*vs]){		color([166/255,128/255,100/255,material_transparency]){third_layer_rotating_ring();}}
	translate([0,0,-3*material_thickness-10*vs]){		translate([0,wobble_radius,0]){6003_ball_bearing();}}
	translate([0,0,-3*material_thickness-11*vs]){		color([166/255,128/255,100/255,material_transparency]){fourth_layer_wobbler();}}
	translate([0,0,-3*material_thickness-12*vs]){		color([166/255,128/255,100/255,material_transparency]){fourth_layer_gear_ring();}}
	translate([0,0,-3*material_thickness-13*vs]){		color([166/255,128/255,100/255,material_transparency]){fourth_layer_fixed_ring();}}
	translate([0,0,-4*material_thickness-14*vs]){		color([166/255,128/255,100/255,material_transparency]){fifth_layer_shaft();}}
	translate([0,0,-4*material_thickness-15*vs]){		6801_ball_bearing();		}
	translate([0,0,-4*material_thickness-16*vs]){		color([166/255,128/255,100/255,material_transparency]){fifth_layer_base();}}
	translate([0,0,-4*material_thickness-17*vs]){		color([166/255,128/255,100/255,material_transparency]){fifth_layer_support_ring();}}
	translate([0,0,-5*material_thickness-18*vs]){		color([166/255,128/255,100/255,material_transparency]){sixth_layer();}}
	translate([0,0,-5*material_thickness-20*vs]){		six_bolt_pattern(ring_support_inside_radius-0.25,3/8,0);		}
	translate([0,0,-5*material_thickness-20*vs]){		num_4_woodscrew(3/4);		}
}

module GM17_gearmotor(){translate([-GM17_shaft_cp_y,-GM17_shaft_cp_x,0]){GM17();}}

module first_layer(){
// This caps the joint. It supports the perimiter
// outline of the GM17. It connects to the near
// arm.
	difference(){
		cylinder(r = joint_radius, h=material_thickness,$fn=100);
		translate([-GM17_shaft_cp_y,-GM17_shaft_cp_x,-material_thickness]){
			linear_extrude(height = 3*material_thickness, center =false, convexity = 10){
				GM17_outline();
			}
		}
		six_bolt_pattern(first_cam_radius,3*material_thickness,material_thickness);
	}
}
	
module second_layer_shaft(){
// This piece fits around the GM17 shaft and inside the 6801 bearing
	difference(){
		cylinder(r = 6/25.4, h=material_thickness,$fn=100);
		translate([-GM17_shaft_cp_y,-GM17_shaft_cp_x,material_thickness+0.01]){shaft();}
	}
}

module second_layer_GM17_mount(){
// This piece connects to the GM17 and bolts into the first layer.  It holds
// the GM17 in place and provides something for the support right
// to rotate around.
	difference(){
		cylinder(r =  ring_support_inside_radius, h=material_thickness,$fn=100);
		translate([-GM17_shaft_cp_y,-GM17_shaft_cp_x,-material_thickness]){
			linear_extrude(height = 3*material_thickness, center =false, convexity = 10){
				GM17_holes();
			}
		}
		translate([0,0,-material_thickness]){
			linear_extrude(height = 3*material_thickness, center =false, convexity = 10){
				6801_ball_bearing_outline();
			}
		}
		six_bolt_pattern(first_cam_radius,3*material_thickness,material_thickness);
	}
}

module second_layer_support_ring(){
// This is a ring used to support the far arm.  
	difference(){
		cylinder(r =  joint_radius, h=material_thickness,$fn=100);
		translate([0,0,-material_thickness]){cylinder(r =  ring_support_inside_radius, h=3*material_thickness,$fn=100);}
		six_bolt_pattern((standard_inside_radius+joint_radius)/2,3*material_thickness,material_thickness);
	}
}

module third_layer_wobbler(){
// This piece fits around the GM17 shaft and inside the 6905 bearing.
// It is offset to create the wobble in the gears
	difference(){
		translate([0,4/25.4,0]){cylinder(r = 8.5/25.4, h=material_thickness,$fn=100);}
		translate([-GM17_shaft_cp_y,-GM17_shaft_cp_x,material_thickness+0.01]){shaft();}
	}
}

module third_layer_gear_ring(){
// This ring wobbles around and is connected to another ring
// this provides the actual gear reduction.
	rotate([0,0,-90]){
		difference(){
			linear_extrude(file = "5_knob_cam.dxf", layer = "cam",  height = material_thickness, convexity = 10);
			translate([-wobble_radius,0,-material_thickness]){rotate([0,0,90]){cylinder(r=35/2/25.4,h=3*material_thickness,$fn=100);}}
			translate([-wobble_radius,0,0]){five_bolt_pattern(first_cam_radius-0.5,3*material_thickness,material_thickness);}
		}
	}
}

module third_layer_fixed_ring(){
// This is a ring with a smooth outside
// and a geared inside.  It's fixed to the near arm.
	difference(){
		cylinder(r=standard_inside_radius,h=material_thickness,$fn=100);
		translate([0,0,-material_thickness]){cylinder(r = first_cam_radius+roller_radius, h=3*material_thickness,$fn=100);}	
	}
	difference(){
		rollers(first_cam_radius,roller_radius,material_thickness,6);
		six_bolt_pattern(first_cam_radius,3*material_thickness,material_thickness);
	}
}

module third_layer_rotating_ring(){
// this is a rotating ring connected to the far arm
	difference(){
		cylinder(r=joint_radius,h=material_thickness,$fn=100);
		translate([0,0,-material_thickness]){cylinder(r = standard_inside_radius, h=3*material_thickness,$fn=100);}	
		six_bolt_pattern((standard_inside_radius+joint_radius)/2,3*material_thickness,material_thickness);
	}
}

module fourth_layer_wobbler(){
// This piece fits around the GM17 shaft and inside the 6905 bearing.
// It is offset to create the wobble in the gears
	difference(){
		translate([0,4/25.4,0]){cylinder(r = 8.5/25.4, h=material_thickness,$fn=100);}
		translate([0,0,-material_thickness]){cylinder(r=1/32,h=3*material_thickness,$fn=100);}
	}
}

module fourth_layer_gear_ring(){
// This ring wobbles around and is connected to another ring
// this provides the actual gear reduction.
	difference(){
		translate([0,wobble_radius,0]){
			rotate([0,0,51.428571428571428571428571428571]){
				difference(){
					translate([wobble_radius,0,0]){linear_extrude(file = "6_knob_cam.dxf", layer = "cam",  height = material_thickness, convexity = 10);}
					translate([0,0,-material_thickness]){rotate([0,0,90]){cylinder(r=35/2/25.4,h=3*material_thickness,$fn=100);}}
				}
			}
		}
		rotate([0,0,-90]){translate([-wobble_radius,0,0]){five_bolt_pattern(first_cam_radius-0.5,3*material_thickness,material_thickness);}}
	}
}

module fourth_layer_fixed_ring(){
// This is a ring with a smooth outside
// and a geared inside.  It's fixed to the far arm.
// It drives the far arm.
	difference(){
		cylinder(r=joint_radius,h=material_thickness,$fn=100);
		translate([0,0,-material_thickness]){cylinder(r = second_cam_radius+roller_radius, h=3*material_thickness,$fn=100);}	
		six_bolt_pattern((standard_inside_radius+joint_radius)/2,3*material_thickness,material_thickness);
	}
	rollers(second_cam_radius,roller_radius,material_thickness,7);
}

module fifth_layer_shaft(){
// This piece is connected to the GM17 shaft and inside the 6801 bearing
	difference(){
		cylinder(r = 6/25.4, h=material_thickness,$fn=100);
		translate([0,0,-material_thickness]){cylinder(r=1/32,h=3*material_thickness,$fn=100);}
	}
}

module fifth_layer_base(){
// This piece holds the end of the GM17
// shaft.  It supports the shaft with another 6801 bearing
// It also has a support ring rotating around it.
	difference(){
		cylinder(r =  ring_support_inside_radius, h=material_thickness,$fn=100);
		translate([0,0,-material_thickness]){cylinder(r=10.5/25.4,h=3*material_thickness,$fn=100);}		
		six_bolt_pattern(ring_support_inside_radius-0.25,3*material_thickness,material_thickness);
	}
}
module fifth_layer_support_ring(){
// This is a ring used to support the far arm.  
	difference(){
		cylinder(r =  joint_radius, h=material_thickness,$fn=100);
		translate([0,0,-material_thickness]){cylinder(r =  ring_support_inside_radius, h=3*material_thickness,$fn=100);}
		six_bolt_pattern((standard_inside_radius+joint_radius)/2,3*material_thickness,material_thickness);
	}
}

module sixth_layer(){
// This connects to the near arm.  
// it provides an endcap.  
	difference(){
		cylinder(r = joint_radius, h=material_thickness,$fn=100);
		translate([0,0,-material_thickness]){cylinder(r = 10.5/25.4, h=3*material_thickness,$fn=100);}
		six_bolt_pattern(ring_support_inside_radius-0.25,3*material_thickness,material_thickness);
	}
}

module six_bolt_pattern(rad,h,t){
	color([0.25,0.25,0.25,1]){	
		for (n = [0:5]){
			rotate([0,0,30+60*n]){translate([rad,0,-t]){cylinder(r=set_screw_minor_radius,h=h,$fn=100);}}
		}
	}
}


module five_bolt_pattern(rad,h,t){
	color([0.25,0.25,0.25,1]){	
		for (n = [0:5]){
			rotate([0,0,72*n]){translate([rad,0,-t]){cylinder(r=set_screw_minor_radius,h=h,$fn=100);}}
		}
	}
}

module rollers(spacing_radius,radius,height,number_of_rollers){
	for (n = [0:number_of_rollers-1]){
		rotate([0,0,30+360/number_of_rollers*n]){translate([spacing_radius,0,0]){
			cylinder(r=radius,h=height,$fn=100);
			translate([0,-radius,0]){cube(size=[radius,2*radius,height]);}
			}
		}
	}
}

module num_4_woodscrew(L){
	color([0.25,0.25,0.25,1]){
		rotate([0,0,90]){translate([0,0,0]){		cylinder(r1=15/128,r2=7/128,h=1/8,$fn=30);}}
		rotate([0,0,90]){translate([0,0,1/8]){	cylinder(r=5/128,h=L-1/4,$fn=30);}}
		rotate([0,0,90]){translate([0,0,L-1/8]){	cylinder(r1=5/128,r2=1/128,h=1/8,$fn=30);}}
	}
}


