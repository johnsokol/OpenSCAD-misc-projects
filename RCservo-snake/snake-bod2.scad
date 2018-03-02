 $fn=50;
 
 shaft=8;
 thick=4.77;
 
 bearingshaft = 7.25;  // 8mm 4.77 material thickness 
 
 //flat_roundtab(20,10);
 xx();
 
 
 
module xx(){
 x3();
translate([80,0,0])
x1(40 +10,20);



translate([80,50,0])
    x2();
    
translate([50,50,0])
mirror([1,0,0])
     x2();

}


module x3 (){
 
    width=25;
    p=5;
    
     difference(){
   square([60,25]);
   
         union(){
   translate([9,2.5,0])      
   square([41,20]);
         
   translate([05,2.5,0])      
   square([50,5]);
   translate([05,2.5+15,0])      
   square([50,5]);
             
   translate([05,2.5+7.5,0])      
   square([10,5]);
         }  
 //translate([(60 -52)/2,(25 -1.5)/2,0])  square([52,1.5]);
     
     }
}



module x2(){

  difference(){
      
   union()   {
translate([0,10,0])
 square([50,40]);
    
     translate([-7.5,10,0]) 
      square([65,13]); 
      
      translate([-5,-1-thick/2-2,0])
      x2h(16);
       
     translate([-10,7,0])
      square([10,16]); 
  }
      
 translate([5,5,0])
 #union(){  //The Servo's profile
      square([40,40.5]); 
    translate([-7.5,10,0]) 
      square([55,3]);    
  }
  
  }


}



module x2h(width){
    length=width/2;
    
    difference(){
      //flat_roundtab(length,width);
          translate([length-width/2,width/2, 0])
          circle(width/2);
        
      translate([length-width/2,width/2, 0]) 
      circle( shaft /2 +0.4);
  }

}

module x3x(){
 
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




module x1(length,width){
    
    union(){
    translate([-bearingshaft/2,-10,0])
        square([bearingshaft,40]);
    
difference(){
flat_roundtab(length,width);


 translate([length-width/2,width/2, 0]) 
 circle(5.1/2);


}
}
}

module flat_roundtab(length,width) {
    
    
  //color("blue"){
      translate([0,width*0.25, 0])

      square([(length-width/2) -width * 0.4 ,width/2]);
  
  translate([length-width/2,width/2, 0])
  circle(width/2);
}
