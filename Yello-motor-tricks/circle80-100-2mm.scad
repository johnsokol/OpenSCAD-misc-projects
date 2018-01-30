


//projection()
{

outer_housing();
translate([95,0,0]) inside_spacer();
translate([95,95,0]) inside_wirehole();
translate([0,110,0]) outer_cover();

}



module outer_housing(){
    ring(80,100);
    ring(70,78);
}

module outer_cover(){
   rout = 100;
   
    cylinder(h=1, r=rout/2, $fa=2);
}

module inside_spacer(){
    ring(39.25,80);
}

module inside_wirehole(){
    rin = 1; rout = 80;
    difference()
    {
    cylinder(h=1, r=rout/2, $fa=2);
    translate([20,0,0])
    cylinder(h=1, r= rin/2, $fa=2);
    }
}

module ring(rin,rout){
    
    difference()
    {
        cylinder(h=1, r=rout/2, $fa=2);
        //translate([0,0,-1])
        cylinder(h=1, r= rin/2, $fa=2);
    }

}


