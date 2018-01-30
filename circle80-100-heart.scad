

 $fs=0.01;
 
//linear_extrude(height = 13) 

aa=9;
bb=14;
cc=21;
dd=36;

//projection()

draw_more_shit();

module draw_more_shit()
{
difference(){
outer_cover();
    translate([-cc,-cc,0])
flat_heart(dd);
    
}
{
translate([-aa,-aa,0])
flat_heart(bb);
led_ring();
}
}

module draw_shit()
{

outer_housing();
translate([95,0,0]) inside_spacer();
translate([95,95,0]) inside_wirehole();
translate([0,110,0]) outer_cover();

}

module led_ring(){
   ring(27,39);
    
    
}

module outer_housing(){
    ring(80,100);
    ring(70,78);
}

module outer_cover(){
   rout = 100;
   
    circle( r=rout/2 );
}

module inside_spacer(){
    ring(39.25,80);
}

module inside_wirehole(){
    rin = 1; rout = 80;
    difference()
    {
    circle( r=rout/2 );
    translate([20,0,0])
    circle(r= rin/2 );
    }
}

module ring(rin,rout){
    
    difference()
    {
        circle(r=rout/2);
        //translate([0,0,-1])
        circle( r= rin/2);
    }

}

module flat_heart(n=1) {
  square(n);

  translate([n/2, n, 0])
  circle(n/2);

  translate([n, n/2, 0])
  circle(n/2);
}


