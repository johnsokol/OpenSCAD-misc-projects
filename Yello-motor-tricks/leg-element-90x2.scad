
//smooth curves
$fs=0.5;

 //l=64.5;
 l=75;
 sh=l-5.5;
  
  
 w=22.3;
 w2=w/2;
 
 h = 18.5;
 
 screw_space=17.5;

 Thick = 10;

so= (w / 2 ) -(screw_space/2);



projection(){ 
  mount1();
    
    
 translate([0,30,0])
  mount2();
   
 translate([0,80,0])
  mount3();
}

module mount3()
{

      translate([l-10,0,0])

 difference()
    {
     
    {
      //cube([l,w,1],center=false);
      translate([-25,-10,0]) 
      //cube([40,w+20,1],center=false);
         
      translate([20,(w/2 + 10),0.5])
      curve_cube(length = 40, width=w+20, thickness = 1, curve = 5);
    }
 
     
   difference(){   
  
      union(){
     translate([0,-5,0])
     cube([10,w+10,2],center=false);
      
     translate([-20,-5,0])
     cube([10,w+10,2],center=false);
      }   
     translate([-20,0,0])
     cube([30,w,2]);
       

   }   

   translate([5,so ,0])
      cylinder(r=3.2/2,3,center=true); 
   translate([5 ,w-so ,0])
      cylinder(r=3.2/2,3,center=true); 

   translate([5 - 10.5 - (2.5/2) ,w2 -2.5 ,-2])
      cube([2.5,5,4],center=false);
   
   
  translate([20 ,w2 ,0])
      cylinder(r=12.5,3,center=true); 

  translate([-30 ,w2 ,0])
      cylinder(r=12.5,3,center=true); 
  }
}



module mount1()
{


 difference()
    {
     
     union(){   
   //  cube([l,h,1],center=false);
         
           
   translate([l/2,(h/2),0.5])
      curve_cube(length = h, width=l, thickness = 1, curve = 16);
     
      translate([l-10,-5,0])
      cube([10,h+10,1],center=false);
         
      translate([l-30,-5,0])
      cube([10,h+10,1],center=false);
         
     }
  
 
     
   translate([12.2,h/2 ,0])
   //   cylinder(r=14/2,3,center=true); 
  
  
   //translate([0,0,-1])
        
    //////////////////////////////////////   
    // MOTOR SHAFT KEY (Round with 2 flats) 
    // Measures 5.3mm round 3.55 on flat
    //////////////////////////////////////
    intersection(){
		 cylinder (	r=5.2/2,h=5, $fn=200);
         cube([10,3.45,10],center=true);
     }
        
  }
}

module mount2()
{



 difference()
    {
        
        
   union(){     
       
       translate([l/2,0,0])
   cube([l/2,w,1],center=false);
  
        
    translate([l/2,(w/2),0.5])
      curve_cube(length = w, width=l, thickness = 1, curve = 18);
   }     
        
   translate([12.2,w2 ,0])
   //   cylinder(r=14/2,3,center=true); 
        
    //////////////////////////////////////   
    // MOTOR SHAFT KEY (Round with 2 flats) 
    // Measures 5.3mm round 3.55 on flat
    //////////////////////////////////////
    intersection(){
		 cylinder (	r=5.2/2,h=5, $fn=200);
         cube([10,3.45,10],center=true);
     }
        
        

   translate([sh,so ,0])
      cylinder(r=3.2/2,3,center=true); 
   translate([sh,w-so ,0])
      cylinder(r=3.2/2,3,center=true); 

   translate([sh - 10.5 - (2.5/2) ,w2 -2.5 ,-2])
      cube([2.5,5,4],center=false);
  
        
  translate([sh+15 ,w2 ,0])
      cylinder(r=12.5,3,center=true); 
     
 //  translate([sh-8,w2 ,0])
   //   cylinder(r=4/2,3,center=true); 

//Motor Strap
 //  translate([sh + 11,w2 -2.5 ,-2])
  //    cube([2.5,5,4],center=false);

  // translate([14,A_wid - so ,0])
   //     cylinder(r=bolt_r,h=height*1.5,center=true);
  }
}



module curve_cube()
{


    
    
    mink_r = curve/2;
    color("Blue")
  //  translate([width/2,height/2,thickness/2])
    minkowski()
    {
        //have to take into account the radius of the cylinder, so subtract from width and length

        cube([width-mink_r*2,length-mink_r*2,thickness],center=true);
        cylinder(r=curve/2,h=0.01);
    }
}

     
module flat_roundtab(n=1) {
  square(n);

  //translate([n/2, n, 0])
  //circle(n/2);

  translate([n, n/2, 0])
  circle(n/2);
}

