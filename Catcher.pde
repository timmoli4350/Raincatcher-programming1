//Olivia Timmermann
//Programming 1

class Catcher {
  float r; //variables
  color colr;
  float x, y;
  PImage catcherImage;

  Catcher(float tempR, PImage img) { //intakes two parameters, temp radius, image
    r = tempR;
    colr = color(131, 105, 83);
    x = 0;
    y = 0;
    this.catcherImage = img;
  }

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
  void display() { //display method for the image (my first programming project)
    imageMode(CENTER);
    image(catcherImage, x, y, r*4, r*4);
    noStroke();

  }

  boolean intersectGood(Drop d) { //checks if the cursor intersects with a drop, then increases score
    float distance = dist(x, y, d.x, d.y);
    if (distance < r+10 + d.r) {
      scoreBoard.incScore();
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersectBad(BadDrop d) { //checks if the cursor intersects with a drop, then decreases score
    float distance = dist(x, y, d.x, d.y);
    if (distance < r+10 + d.r) {
      scoreBoard.decScore();
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersectCrow(Crows d) { //checks if the cursor intersects with a drop, then continuously decreases score
    float distance = dist(x, y, d.x, d.y);
    if (distance < r+22 + d.r) {
      scoreBoard.decScoreCrow();
      return true;
    } else {
      return false;
    }
  }


  boolean intersectFollower(Follower d) { //checks if the cursor intersects with a drop, then ends game
    float distance = dist(x, y, d.x, d.y);
    if (distance < r+10 + d.r) {
      state = 'l';
        return true;
    } else {
      return false;
    }
  }
  
}
