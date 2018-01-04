/*******************************************************************************
* MottBotChassis 2D
* Units are in mm.
* Copyright (c) 2017 Christopher Mayer
*******************************************************************************/

robot_width = 190;
wheel_hole_y = 75;
wheel_hole_x = 30;

cut_size = 4;
cut_border = 4;

switch_x = 7;
switch_y = 12;

difference() {
  // The main chassis.
  circle(h = thickness, d = robot_width);
  
  // Cut out space for the wheels.
  for (copy = [0 : 1]) mirror([copy, 0, 0])  // This line mirrors the Y axis.
    translate([robot_width/2 - wheel_hole_x, -wheel_hole_y/2, 0])
      square(size=[wheel_hole_x, wheel_hole_y]);
  
  // A grid of holes to allow easy component attachment.
  for (x = [-5 : 5])
    for (y = [-3 : 9])
      translate([-cut_size/2 + x*(cut_size + cut_border),
          -cut_size/2 + y*(cut_size + cut_border), 0])
        square(size=[cut_size, cut_size]);
  
  // Holes for power switches.
  for (mirror_x = [0 : 1]) mirror([mirror_x, 0, 0]) 
    for (mirror_y = [0 : 1]) mirror([0, mirror_y, 0])
      translate([-switch_x/2 + 5*(cut_size + cut_border) + (cut_size+switch_x)/2 + cut_border,
          -switch_y/2 - 8*(cut_size + cut_border), 0])
        square(size=[switch_x, switch_y]);
  
}
