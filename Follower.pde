//Olivia Timmermann
//Programming 1

class Follower {
  float x;
  float y;
  float r;
  float easing = 0.02; //used Processing guide, easing is distance to follow from
  PImage img;
  
  Follower(PImage img) {
    x = width/2;
    y = height/2;
    r = 66;
    this.img = img;
  }
  
  void update() { //update method; constantly checks if its distance is too far then goes towards the catcher
    float targetX = mouseX;
    float dx = targetX - x;
    x += dx * easing;
    
    float targetY = mouseY; //same as above, but for mouseY
    float dy = targetY - y;
    y += dy * easing;
  }
  
  void display(){ // display method for the image
    imageMode(CENTER);
    image(img, x, y, r, r);
    noStroke();
  }
}
