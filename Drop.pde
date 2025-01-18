//Olivia Timmermann
//Programming 1

class Drop {
  float x, y; //variables
  float speed;
  color c;
  float r;
  PImage img;

  Drop(PImage img) {
    r = 8;
    x = random(width);
    y = -r*4;
    speed = random(1, 5);
    this.img = img; //brings img into class, calls
  }

  void move() {
    y +=speed;
  }

  void display() { //display the image, the meteor, as the drop
    imageMode(CENTER);
    image(img, x, y, r*20, r*14);
    noStroke();
  }

  void caught() { //places the drop far outside the viewing window
    speed = 0;
    x = -100;
  }
}
