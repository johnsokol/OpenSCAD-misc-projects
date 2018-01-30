 thick = 5; // Board thickness
 hthick= thick/2;


 w=155;
 h=77; //+2 mm for clearance above rubber
 wt=20;
 
 
     bb_w=22; //Ball bearing diameter
     bw=120; // Bearing Width on scooter clamp
     bh=120; // Bearing Height over center of pivot
     bw2=80; // Bearing Width on Robot body
     sal=46; // Supporting arm length
     
     
scooter_clamp();

scooter_mount();


translate([30,40,0])
make_rods();


translate([115,22,0])
support_hangers();
translate([115,112,0])
support_hangers();
//translate([165,22,0]) support_hangers();
//translate([165,112,0]) support_hangers();

translate([0,160,0])
robot_mount();



module support_hangers(){
    
difference(){
    hull(){        
        circle((bb_w + wt)/2);
        translate([0,sal,0])
        circle((bb_w + wt)/2);
    } 
    {
        circle(bb_w/2);
        translate([0,sal,0]) 
        circle(bb_w/2);
    }
}
}


module make_rods(){
translate([0,25,0])   square([10,50]);
translate([0,80,0])   square([10,50]);
translate([15,30,0])   square([10,100]);
translate([30,30,0])   square([7.25,100]);
translate([40,30,0])   square([7.25,100]);
}

module robot_mount(){
    
        k=50;
    
      pw=bw2+bb_w+20; //part width
     ph= 85;
    
    pc = (w + wt*2) / 2; //Part center
    
    translate([-ph,pc - (pw / 2),0]){
    
a0 = [[0,0],
     [ph-k,0],
     [ph,0+k],
      //[h+1.5*wt,0],
      
      [ph,pw-k],
      [ph-k,pw],
    //[h+1.5*wt,w+wt*2],
      [0,pw]];     // main
      
b0 = [0,1,2,3,4,5]; 
    
   difference(){   
       
      polygon(a0,[b0]);
   //square([ph,pw]);
       

  // translate([10 + bb_w/2, 10 + bb_w/2, 0 ]) circle(bb_w/2);   
  //   translate([10 + bb_w/2, pw-(10 + bb_w/2), 0 ]) circle(bb_w/2);
 
       
     translate([10 + bb_w/2, 10 + bb_w/2, 0 ]) square([7.25,5],center = true);   
     translate([10 + bb_w/2, pw-(10 + bb_w/2), 0 ]) square([7.25,5],center = true); 
        
         
     }
        
    }
}




module scooter_mount(){
    
    


    
     pw=bw+bb_w+20; //part width
     ph= 85;
    
    pc = (w + wt*2) / 2; //Part center
    
    translate([-ph,pc - (pw / 2),0]){
        
   difference(){   
   square([ph,pw]);
       

  // translate([10 + bb_w/2, 10 + bb_w/2, 0 ]) circle(bb_w/2);   
  //   translate([10 + bb_w/2, pw-(10 + bb_w/2), 0 ]) circle(bb_w/2);
 
       
     translate([10 + bb_w/2, 10 + bb_w/2, 0 ]) square([7.25,5],center = true);   
     translate([10 + bb_w/2, pw-(10 + bb_w/2), 0 ]) square([7.25,5],center = true); 
        
         
     }
        
    }
}


module scooter_clamp(){


 k=28;
 
a0 = [[0,0],
     [h+1.5*wt-k,0],
     [h+1.5*wt,0+k],
      //[h+1.5*wt,0],
      
      [h+1.5*wt,w+wt*2-k],
      [h+1.5*wt-k,w+wt*2],
    //[h+1.5*wt,w+wt*2],
      [0,w+wt*2]];     // main
      
b0 = [0,1,2,3,4,5];

a1 =[
     [wt+4.5+75,wt+27],
     [wt+4.5+68,wt+17],
     [wt+4.5+68,wt+10],
     [wt+4.5+58,wt],
     [wt+4.5,wt],
     [wt+4.5,wt+14],
     [wt+2  ,wt+14],
     [wt+2  ,wt+14+8],
     [wt    ,wt+14+8],
     
     [wt    ,w+wt-(+14+8)],
     [wt+2  ,w+wt-(+14+8)],
     [wt+2  ,w+wt-(+14  )],
     [wt+4.5,w+wt-(+14  )],
     [wt+4.5,w+wt],
     [wt+4.5+58,w+wt],
     [wt+4.5+68,w+wt-10],
     [wt+4.5+68,w+wt-(+17     )],
     [wt+4.5+75,w+wt-(+27     )]];
     
b1 = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23];
     
a2 = [
     [wt + h/2 - 5,wt/2+(hthick)], 
     [wt + h/2 - 5,wt/2-(hthick)], 
     [wt + h/2 + 5,wt/2-(hthick)], 
     [wt + h/2 + 5,wt/2+(hthick)], 

     ];
b2 = [24,25,26,27];

a3 = [
     [wt + h/2 - 5,w+wt*1.5+(hthick)], 
     [wt + h/2 - 5,w+wt*1.5-(hthick)], 
     [wt + h/2 + 5,w+wt*1.5-(hthick)], 
     [wt + h/2 + 5,w+wt*1.5+(hthick)], 

     ];
b3 = [28,29,30,31];


a4 = [
     [wt + h/2 + 10,0], 

     [wt + h/2 + 10,w+wt*2], 
     
     [wt *2+ h   ,w+wt*2], 

     [wt *2 + h  ,0]

     ];
b4 = [32,33,34,35];

a5 = [
     [wt + h/2 - 10,0], 

     [wt + h/2 - 10,w+wt*2], 
     
     [0  ,w+wt*2], 

     [0 ,0]

     ];
b5 = [36,37,38,39];


a  = concat (a0,a1,a2,a3,a4,a5);
b  = [b0,b1,b2,b3];

//d = [b4];



difference(){
polygon(a,b);
polygon(a,[b4]);
}

translate([-18 ,27,0]){

    difference(){
    polygon(a,b);
    polygon(a,[b5]);
    }
}




      //alternate 
//polygon(a,[b0,b1,b2,b3,b4]);


}
