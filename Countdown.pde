public class Countdown {
  float Time;
  
  Countdown(float set){
    Time = set;
  }
  //Remaining
  float getTimeRemain(){
    return(Time); 
  }
  //Timer
  void setTimer(float set){
    Time = set;
  }
  //Counting Down
  void countDown(){
    Time -= 1/frameRate;
  }
}
