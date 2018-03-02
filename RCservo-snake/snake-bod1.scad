 $fn=50;
 
 
 
 //flat_roundtab(20,10);
 xx();
 
 
 
module xx(){
 
translate([100,0,0])
x1(70,20);
translate([100,40,0])
x2();
translate([100,80,0])
x2();

x3();
}


module x3(){
 
    width=25;
    p=5;
    
     difference(){
   square([60,25]);
   
   translate([10,2.5,0])      
   square([40,20]);
         
 translate([(60 -52)/2,(25 -1.5)/2,0])    
   square([52,1.5]);
         
         
translate([p,width/2 +5, 0]) 
 circle(4.2/2); 
         
translate([p,width/2 -5, 0]) 
 circle(4.2/2); 
    
translate([p+50,width/2 +5, 0]) 
 circle(4.2/2); 
         
translate([p+50,width/2 -5, 0]) 
 circle(4.2/2); 
         
         
         
     }
}

module x2(){
 
    width=20;
    
     difference(){
   square([15,20]);
         
         
translate([5,width/2 +5, 0]) 
 circle(4.2/2); 
         
translate([5,width/2 -5, 0]) 
 circle(4.2/2); 
     }
}


module x1(length,width){
    
    union(){
    translate([20,-10,0])   square([7.25,40]);
    
difference(){
flat_roundtab(length,width);


 translate([length-width/2,width/2, 0]) 
 circle(5.1/2);

translate([10,width/2 +5, 0]) 
 circle(4.2/2); 
translate([10,width/2 -5, 0]) 
 circle(4.2/2); 
}
}
}

module flat_roundtab(length,width) {
    
    
  //color("blue"){
      square([length-width/2,width]);
  
  translate([length-width/2,width/2, 0])
  circle(width/2);
}

