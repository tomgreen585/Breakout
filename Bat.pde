public class Bat{
   //Variables
   private float x, y, w, h;
   
   public Bat(){
     //Identifiers
     x = width/2;
     y = height - 60;
     w = 200;
     h = 20;
   }
   
   public void display(){
     //Draw
     x = mouseX - w/2;  

     fill(0,0,255); 
     rect(x-3,y-3,w+6,h+6,8);     
     fill(134,92,160);
     rect(x,y,w,h,8); 
     stroke(0,0,150);
     strokeWeight(3);     
   }  
}
