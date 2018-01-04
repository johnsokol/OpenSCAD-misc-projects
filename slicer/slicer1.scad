r=50;
dr=4;

module my_object(){
    sphere(r);
    cube(r);
}


module slice(dr=dr){
    for(i=[-r:dr:r]){
        translate([0,0,i])linear_extrude(1)translate([0,0,i*r])projection(cut=true)translate([0,0,-i])children();
    }
}


slice()my_object();

translate([2.5*r,0,0])my_object();     