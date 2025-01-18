//Olivia Timmermann
//Programming 1

class Crows {
  float r; //variables
  float x, y;
  float xSpeed, ySpeed;
  PImage crowImage;
  
  Crows (float tempR, PImage img) { //two parameters, radius and image
    r = tempR;
    x = random(width);
    y = random(height);
    xSpeed = random (-5,5);
    ySpeed = random (-5,5);
    this.crowImage = img;
  }
  
  void move() {
    x += xSpeed;
    y += ySpeed;
    
    if (x > width || x < 0) { //bouncing off the walls
      xSpeed *= -1;
    }
    
    if (y > height || y < 0) { //bouncing off the ground
      ySpeed *= -1;
    }
  }
  
  void display() { //display method
    imageMode(CENTER);
    image(crowImage, x, y, r*3, r*3);
    noStroke();
  }
}
    
