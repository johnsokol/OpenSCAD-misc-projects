r=50; 
dr=4; 
xmax=30; 
ymax=20; 
sp = 1; // spacing between tiles in spreading 


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


module tile(i=0,dx=0,dy=0){ 
    for(iy=[-r-dy*ymax:ymax:r+dy*ymax]){ 
        for(ix=[-r-xmax-dx*xmax:xmax:r+xmax+dx*xmax]){ 
            translate([sp*ix/xmax,sp*iy/ymax,0]) 
            render()intersection(){ 
                translate([0,0,i*r])projection(cut=true)translate([0,0,-i])children(); 
                translate([ix+xmax/2*iy/ymax-(i%2)*xmax*3/4,iy-(i%2)*ymax/2])square([xmax,ymax]); 
            } 
        } 
    } 
} 

// three adjacent layers 
tile(0)my_object(); 
translate([0,0,5]) tile(1) my_object(); 
translate([0,0,10]) tile(2) my_object(); 
translate([2.5*r,0,0])projection(cut=true)my_object();