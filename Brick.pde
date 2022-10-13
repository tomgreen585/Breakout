public class Block{
    
    //Variables
    private float x, y, w, h;
    private int numBlocks;  
    private boolean status;
    private int r, g, b;
    
    //Seperate
    public Block(){
      //Identifiers
      x = 0;
      numBlocks = 8;
      y = 0;
      w = width / numBlocks;
      h = 30;
    }
    //Together
    public Block(int col, int row, int theNumBlocks){
      //Identifiers
      numBlocks = theNumBlocks;
      w = width / numBlocks;
      h = 30;
      x = w * col;
      y = h * row;
      setColors(row, col);
      status = true;
    }
    
      //Colours
    public void setColors(int col, int row){
        b = 150;
        //Color bricks method change in colour over column
        if(col%9==0){
          r = 50;
        } else if (col%8==1){
          r = 100;
        } else if (col%8==2){
          r = 150;
        } else if (col%8==3){
          r = 200;
        } else if (col%8==4){ 
          r = 250;
        } else if (col%8==5){
          r = 200;
        } else if (col%8==6){
          r = 150;
        } else if (col%8==7){
          r = 100;
        } else if (col%8==8){ 
          r = 50;
        }
        //Row
        if(row%2==0){
          g = 70;
          b = 120;
        }
    }
    
    
    public void display(){
      //Draw
      stroke(0);
      strokeWeight(1);
      fill(r/2,g/2,b/2);
      if(status){
        rect(x,y, w, h, 10);
        fill(255,255,0);
      }
    }
    
    public void checkBall(Ball ball, Ball ball2){
      //Ball colision detect
      
       if(status){
         //Ball1
         //Bottom
         if(ball.x > x && ball.x < x+w && ball.y < (y+h+ball.d/2)&& ball.y>y+h){
           ball.Vy*=-1;
           status=false;
           score++;
         }
         //Top
         if(ball.x > x && ball.x < x+w && ball.y > y-ball.d/2 && ball.y < y){
           ball.Vy*=-1;
           status=false;
           score++;
         }
         //Left
         if(ball.x > x - ball.d/2 && ball.y > y && ball.y < y+h && ball.x < x){
           ball.Vx*=-1;
           status=false;
           score++;
         }
         //Right
         if(ball.x > x+w  && ball.y > y && ball.y < y+h && ball.x<x+w+ball.d/2){
           ball.Vx*=-1;
           status=false;
           score++;
         }  
         
         //Ball2
         //Bottom
         if(ball2.x > x && ball2.x < x+w && ball2.y < (y+h+ball2.d/2)&& ball2.y>y+h){
           ball2.Vy*=-1;
           status=false;
           score++;
         }
         //Top
         if(ball2.x > x && ball2.x < x+w && ball2.y > y-ball2.d/2 && ball2.y < y){
           ball2.Vy*=-1;
           status=false;
           score++;
         }
         //Left
         if(ball2.x > x - ball2.d/2 && ball2.y > y && ball2.y < y+h && ball2.x < x){
           ball2.Vx*=-1;
           status=false;
           score++;
         }
         //Right
         if(ball2.x > x+w  && ball2.y > y && ball2.y < y+h && ball2.x<x+w+ball2.d/2){
           ball2.Vx*=-1;
           status=false;
           score++;
         }
      }
    }

}
