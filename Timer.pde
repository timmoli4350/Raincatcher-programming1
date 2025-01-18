//Olivia Timmermann
//Programming 1



//this class is unused - it can be but I chose not to have a timer

class Timer {
  int savedTime; //variables
  int totalTime;

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime; //temporary total time is used to bring in Totaltime
  }

  void start() {
    savedTime = millis();
  }

  boolean isFinished() {

    int passedTime = millis()- savedTime; 
    if (passedTime >totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
