public class Ball{
  
  //Variables
  private float x, Vx;
  private float y, Vy;
  private float d;
  private boolean canMove;
  private String edge;
  
    
  public Ball(){
    //identifiers
    x = width/2;
    d = 28;  
    y = height - 60 - d/2;
    Vx = random(-5,5);
    Vy = -7;

  }
  
  //Area checking
  public void display(){
    if(canMove){
      x += Vx;
      y += Vy;
      //checkWalls
      if(x < 5){
        Vx *= -1;
        x = 5;
      } if(x > width-5){
        Vx *= -1;
        x = width-5;
      } if(y < 5){
        Vy *= -1;
      } else if (y > height - d/2){
        canMove = false;
        y = height - 60 - d/2;
        lives--;
      }
    } 
    else { x = mouseX; }
     
    //Colour and Draw 
    fill(200,0,0); 
    ellipse(x,y,d+10,d+10);
     
    fill(255,0,0);
    ellipse(x,y,d,d);
  }
  
  //Bat
  public void checkBat(Bat bat){
      if(x > bat.x && x < bat.x + bat.w && y > bat.y - d/2 && y < bat.y+2){
        //Vy *= -1;
        Vx += (x - mouseX)/10;
       //CAP THE VX
        if (Vx > 8){
          Vx = 8;
        }
        if (Vx < -8){
          Vx = -8;
        }
        if(Vx < 0){
          Vy = -12 - Vx;
        } else {
          Vy = -12 + Vx;
        }
      } 

  }
}
