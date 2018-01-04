sslice = -100;

//projection(cut = true)
for (slice=[sslice:3:sslice+200]) 
//for (slice=[0:1:54]) 
{

translate( [0,40*slice,slice])
rotate([90,0,0]) 
//translate( [0,0,410])
import(file = "C:/Users/johns/Desktop/js/face/x.stl");
}


 
 
//import(file = "C:/Users/johns/Desktop/john sokol.face.front.stl");

