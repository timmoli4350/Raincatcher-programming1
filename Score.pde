//Olivia Timmermann
//Programming 1

class Score {
  int x, y, score;

  Score(int scoreX, int scoreY) {
    x = scoreX;
    y = scoreY;
    score = 0;
  }

  void display() {
    fill(255);
    rect(x, y, 50, 25);
    fill (0, 0, 30);
    textSize (25);
    textAlign(RIGHT, CENTER);
    text(score, x+45, y+7);
  }

  void incScore() { //used for drop
    score = score + 10;
    updateState();
  }
  void decScore() { // used for badDrop
    score = score - 10;
    updateState();
  }
  void decScoreCrow() { //used for crow
    score = score - 1;
    updateState();
  }
  void decScoreFollower() { // used for follower
    score = score - 1;
    updateState();
  }
  void updateState() { //checks when score is changed if it has to change the state
  if (score < 100) {
    state = '0';
  }
    
  if (score > 100 && score < 200 ) {
    state = '1';
  }
  
  if (score > 200 && score < 300) {
    state = '2';
    }
    
  if (score > 300) { //win condition
    state = 'w';
  }
}
}
