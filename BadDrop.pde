//Olivia Timmermann
//Programming 1

class BadDrop {
  float x, y; //variables
  float speed;
  color c;
  float r;
  PImage img;

  BadDrop(PImage img) { //one parameter, img (image for the badDrop)
    r = 8;
    x = random(width);
    y = -r*4;
    speed = random(1, 5);
    this.img = img;
  }

  void move() {
    y +=speed;
  }

  void display() { //display method for badDrop image
    imageMode(CENTER);
    image(img, x, y, r*10, r*10);
    noStroke();
    }
  

  void caughtBad() { // places outside viewing window
    speed = 0;
    x = -100;
  }
}
