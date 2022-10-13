//////////////////////////////////////////////////

//identifiers
PImage background2, background1;

import processing.sound.*;
SoundFile sound1;

PFont mono;

Ball ball;
Ball ball2;
Bat bat;
Block[][] block;
Countdown startCount;

int rows, columns, score, lives, level, levelCount, startScreen;
int gameScreen = 0;

//////////////////////////////////////////////////


//////////////////////////////////////////////////

void setup(){
  
  //classifiers
  
  //Sound
  sound1 = new SoundFile(this,"123.mp3");
  sound1.loop();
  
  //Background
  background2 = loadImage("1313.png");
  background1 = loadImage("1414.png");
  
  background2.resize(1000,700);
  background1.resize(1000,700);
  
  //Text Font
  mono = createFont("bungee.ttf", 128);
  
  size(1000,700);
  textSize(24);
  startScreen = 0;
  level = 0;
  levelCount = 0;
  score=0; 
  rows = 4;
  columns = 10;
  makeLevel(columns, rows);
  
  //Total Lives
  lives = 15;
  
  //Time
  startCount = new Countdown(150);

}

//////////////////////////////////////////////////


//////////////////////////////////////////////////
void draw(){
  //MENU
  if (gameScreen == 0){ 
    menu();
  } 
  
  //GAME
  if(gameScreen == 1){ 
    startGame();
    
     if(score == 121){
       gameScreen = 3;
     } 
  }
  
 
  
  //Completed Game Screen
  if(gameScreen == 3){ //END SCREEN
     gameScreen = 3;
     background(background1);
     fill(255,255,255);
     text("You finished with a Score of " + score, 100, height/5+180);
     text("With " + lives + " remaining lives", 100, height/5+210); 
     
     if(mousePressed == true){
       menu();
     }  
  }
  
  //Paused
  if(gameScreen == 4){
    clearBlocks();
    fill(255,0,0);
    textSize(40);
    textFont(mono);
    text("Paused" , 50, height/5+5);
  }
}

////////////////////////////////////////////////////


////////////////////////////////////////////////////
void checkLevel(){
  if(clearBlocks()){
    
    //level count
    level++;
    
    //balls
    ball.canMove = false;
    ball.y = bat.y - ball.d/2;
    
    ball2.canMove = false;
    ball2.y = bat.y - ball2.d/2;
    
    //drawing
    fill(0);
    rect(190, height/2 + 130, 400, 30);
    rect(250, height/2 + 160, 400, 30);
    textSize(20);
    fill(255,0,255); 
    text("You Cleared all the bricks!" , 200, height/2+152);
    text("Click anywhere to continue" , 260, height/2+182); 
    
    //Continue
    if(mousePressed){
      if(level%2==0){
        rows *= 1;
      } else {
        columns *= 1;
      }
      
      //maked and carry on
      makeLevel(rows, columns);
      ball.canMove = true;
      ball2.canMove = true;
      
    }
  }
}
////////////////////////////////////////////////////


////////////////////////////////////////////////////
//Score carry printed right
void showScore(){
  strokeWeight(2);
  fill(180,0,0);
  text("Score: " + score, width - 250, height - 10); 
}
////////////////////////////////////////////////////


////////////////////////////////////////////////////
//Life carry printed left
void showLives(){
  fill(180,0,0);  
  text("Lives: " + lives, 40, height - 10);  
  if(lives == 0){
    fill(0);
    rect(190, height/2 + 130, 400, 30);
    rect(250, height/2 + 160, 400, 30);    
    fill(255,0,255);  
    text("Sorry, you ran out of lives...." , 200, height/2+152);
    text("Click anywhere to restart" , 260, height/2+182);    
  }
}
/////////////////////////////////////////////////////



/////////////////////////////////////////////////////
void showTimer(){
  strokeWeight(2);
  fill(180,0,0);
  textSize(35);
  text(startCount.getTimeRemain(), 400, 690);
}
/////////////////////////////////////////////////////


/////////////////////////////////////////////////////
//Block Method Display
void showBlocks(){
  for(int i = 0; i < block.length; i++){
    for(int j = 0; j < block[0].length; j++){
      block[i][j].display();
      block[i][j].checkBall(ball,ball2);
    }
  }  
}

//New Level
void makeLevel(int rows, int columns){
  ball = new Ball();
  ball2 = new Ball();
  
  
  bat = new Bat();
  block = new Block[rows][columns];
  
  for(int i = 0; i < block.length; i++){
    for(int j = 0; j < block[0].length; j++){
      block[i][j] = new Block(i,j+5,block.length);
        
    }
  }  
}

//Clear Blocks
boolean clearBlocks(){
  for(int i = 0; i < block.length; i++){
    for(int j = 0; j < block[0].length; j++){
      if(block[i][j].status){
        return false;  
      }
    }
  }
  return true; 
}

///////////////////////////////////////////////


///////////////////////////////////////////////
void startGame(){
  gameScreen = 1;
  
  //Timer Method
  startCount.countDown();
 
  if(startCount.getTimeRemain() < 0.0112){
    gameScreen = 3;
  }
  
  //Set Background
  background(background1); 

  //Display Balls
  ball.display();
  ball.checkBat(bat);
  ball2.display();
  ball2.checkBat(bat);
  
  //Display everything else
  bat.display();
  showBlocks(); 
  showLives();
  showScore();
  checkLevel();  
  showTimer();
}

//Menu Screen
void menu(){
  gameScreen = 0;
  background(background2);
  fill(255,0,0);
  textSize(1);
  textFont(mono);
  text("BreakOut" , 50, height/5+5);
  textSize(20);
  fill(255,255,255);
  text("'BREAKOUT!'" , 800, height/9.5+5);
  fill(255,0,0);
  text("THROUGH THE" , 800, height/7+5);
  text("BLOCKS!" , 800, height/5.5+5);
  textSize(20);
  fill(255,255,255);
  text("Click to Start" , 50, height/1.13);
  text("Use the Mouse to Control Your Board" , 50, height/1.1);
  text("Hold Space to Pause -- Release to Continue" , 50, height/1.07);
  
  fill(255,255,255);
  text("Break Through the Blocks!" , 50, height/5+70);
  text("A Game about Strategy" , 50, height/5+100);
  text("Try get the Highest Score Possible" , 50, height/5+130);
  text("by Tom Green" , 50, height/5+160);
  
  fill(255,0,0);
  text("BE CAREFUL!" , 50, height/5+210); 
  text("You have only 15 lives" , 50, height/5+230);
  text("Everytime you lose one of the balls you use a life" , 50, height/5+260); 
  text("You don't have long to complete the challenge" , 50, height/5+290); 
  
}

///////////////////////////////////////////////



void reset(){
  gameScreen = 0;
  if(mousePressed == true){
    startGame();
  }
}


////////////////////////////////////////////////
void mousePressed(){
  if(gameScreen == 0){
    startGame();
  }
  else if(gameScreen == 3){
    menu();
  }
  if(startCount.getTimeRemain() < 0.0112){
    menu();
  }
  
  if(lives > 0){
    ball.y -= 5;
    ball.canMove = true; 
    ball2.y -= 5;
    ball2.canMove = true;
  
    
  } else {
    setup();
  } 
}
///////////////////////////////////////////////

void keyPressed(){
  //Pause
  if(key == ' '){
    gameScreen = 4;
  }
}
  void keyReleased(){
  //Released return to game
    if(key == ' '){
    gameScreen = 1;
  }  
}
