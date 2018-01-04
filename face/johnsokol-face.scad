slice = 0;

//projection(cut = true)
for (slice=[-100:3:+100]) 
{

translate( [0,40*slice,slice])
rotate([90,0,0]) 
//translate( [0,0,410])
import(file = "C:/Users/johns/Desktop/clean/fixed-john sokol4.stl");
}


 
 
//import(file = "C:/Users/johns/Desktop/john sokol.face.front.stl");

