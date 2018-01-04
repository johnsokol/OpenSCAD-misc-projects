

r=50;
dr=4;
xmax=30;
ymax=20;


module my_object(){
    sphere(r);
    cube(r);
}


module slice(dr=dr){
    for(i=[-r:dr:r]){
        translate([0,0,i])linear_extrude(1)translate([0,0,i*r])projection(cut=true)translate([0,0,-i])children();
    }
}


//slice()my_object();

//translate([2.5*r,0,0])my_object();   


module tile(i=0){
    for(iy=[-r:ymax:r]){
        for(ix=[-r-xmax:xmax:r+xmax]){
            color([.5-(ix)/r/2,1-(.5-(ix)/r/2),.5-(iy)/r/2])
            render()intersection(){
                translate([0,0,i*r])projection(cut=true)translate([0,0,-i])children();
                translate([ix+xmax/2*iy/ymax,iy])square([xmax,ymax]);
            }
        }
    }
}


tile()my_object();
translate([2.5*r,0,0])projection(cut=true)my_object();
