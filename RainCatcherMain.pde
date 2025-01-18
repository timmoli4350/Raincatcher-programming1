//Olivia Timmermann
//Programming 1

Catcher catcher; //global variables
Timer timer;
Drop[] drops;
BadDrop[] badDrops;
Score scoreBoard;
Crows crow1;
Crows crow2;
Follower follower;

PImage bgImage; //image variables
PImage dropImage; 
PImage crowImage;
PImage followerImage;
PImage catcherImage;
PImage badDropImage;

Drop drop;
BadDrop badDrop;
Crows crow;

float x;
float y;
float easing = 0.02; //easing is for the follower 

char state;

int totalDrops = 0;
int totalBadDrops = 0;

void setup() {
  dropImage = loadImage("purpleMeteor.png"); // load each of the images into the game
  crowImage = loadImage("crow.png");
  bgImage = loadImage("dinosaurBackground.png");
  followerImage = loadImage("explosion.png"); 
  catcherImage = loadImage("dino2.png");
  badDropImage = loadImage("heart.png");

  drop = new Drop(dropImage); //instantiation
  badDrop = new BadDrop(badDropImage);
  crow = new Crows(25, crowImage);
  size(1177,783);
  background(0, 0, 0);
  noCursor();
  noStroke();
  state = 'i';
  
  crow1 = new Crows(25, crowImage); // more instantiation
  crow2 = new Crows(25, crowImage);
  catcher= new Catcher(30, catcherImage);
  drops = new Drop[1000];
  badDrops = new BadDrop[1000];
  timer = new Timer(300);
  scoreBoard = new Score (5, 25);  
  follower = new Follower(followerImage);

  timer.start();
}

void draw() { //draw method, has all switch statements inside
  background(bgImage);
  catcher.setLocation(mouseX, mouseY);
  catcher.display();
  
  if (keyPressed) {
    state=key; 
  }
  
  switch (state) { //switch statement, switches between cases (levels, instructions, win/loss)
    case 'i': //instructions
      textSize (40);
      textAlign(LEFT, CENTER);
      text("welcome to dinosaver!", x+100, y+100);
      textSize (25);
      text("you are a dinosaur trying to save your", x+100, y+230); 
      text("civilization from extinction...", x+100, y+260);
      text("catching the hearts will deduct 10 points from your score", x+100, y+390);
      text("catching the purple meteors will add 10 points to your score", x+100, y+420);
      text("touching an explosion will end your game", x+100, y+450);
      text("touching flying crows will continuously decrease your score until you move away", x+100, y+480);
      text("there are 3 levels, and you win at 300 pts!", x+100, y+140);
      text("press p to pause || press 0 to start!", x+650, y+100); 
    break;
    
    case 'p': //pause
      textSize (25);
      textAlign(RIGHT, CENTER);
      text("GAME PAUSED!", x+500, y+400);    
    break;
    
    case 'w': //winning
      textSize (80);
      textAlign(RIGHT, CENTER);
      text("GAME WON!", x+500, y+400);  
      textSize (20);
      textAlign(RIGHT, CENTER);
      text("thanks for playing :)", x+500, y+460);
      text("yippppeeeeeee", x+800, y+600);
      text("we're alive", x+1000, y+630);
    break;
    
    case 'l': //losing
      textSize (80);
      textAlign(RIGHT, CENTER);
      text("GAME OVER!", x+500, y+400);
      textSize (30);
      text("everybody died. try again?", x+500, y+460);
      text("AAAAAAAAAAAA", x+830, y+600);
      text("(dead)", x+1000, y+630);
    break;
    
    case '0': //--------------------------------------------------------------------------------------------------------------------------------- case 0
      if (frameCount%35==0) { //every 35 frames, another drop is created
        drops[totalDrops] = new Drop(dropImage);
        totalDrops++ ;
    }
      
      if (frameCount%60==0) { //every 60 grames, another bad drop is created
        badDrops[totalBadDrops] = new BadDrop(badDropImage);
        totalBadDrops++;
    }
      if (totalDrops >=drops.length) {
        totalDrops= 0;
    }
      if (totalBadDrops >=badDrops.length) {
        totalBadDrops= 0;
    }
      timer.start();
    
      for (int i = 0; i < totalDrops; i++) { //starts the drops, if they are caught it runs caught -> scoring
        drops[i].move();
        drops[i].display();
      if (catcher.intersectGood(drops[i])) {
        drops[i].caught();
    }
  }
      for (int i = 0; i < totalBadDrops; i++) { //same as above but for bad drops
        badDrops[i].move();
        badDrops[i].display();
      if (catcher.intersectBad(badDrops[i])) {
        badDrops[i].caughtBad();
    }
  }

    scoreBoard.display(); //display method for scoring class
    
  break;
  
  case '1': //--------------------------------------------------------------------------------------------------------------------------------- case 1
      if (frameCount%35==0) {
        drops[totalDrops] = new Drop(dropImage);
        totalDrops++ ;
    }
      if (frameCount%60==0) {
        badDrops[totalBadDrops] = new BadDrop(badDropImage);
        totalBadDrops++;
    }
      if (totalDrops >=drops.length) {
        totalDrops= 0;
    }
      if (totalBadDrops >=badDrops.length) {
        totalBadDrops= 0;
    }
      timer.start();
    
      for (int i = 0; i < totalDrops; i++) {
        drops[i].move();
        drops[i].display();
      if (catcher.intersectGood(drops[i])) {
        drops[i].caught();
    }
  }
      for (int i = 0; i < totalBadDrops; i++) {
        badDrops[i].move();
        badDrops[i].display();
      if (catcher.intersectBad(badDrops[i])) {
        badDrops[i].caughtBad();
    }
  }

    scoreBoard.display();
    
  crow1.move(); 
  crow1.display();
  crow2.move();
  crow2.display();
  
  if (catcher.intersectCrow(crow1)) {
      scoreBoard.decScoreCrow();
    }
  if (catcher.intersectCrow(crow2)) {
      scoreBoard.decScoreCrow();
  }
    
  break;  
  
  case '2': //--------------------------------------------------------------------------------------------------------------------------------- case 2
      if (frameCount%35==0) {
        drops[totalDrops] = new Drop(dropImage);
        totalDrops++ ;
    }
      if (frameCount%60==0) {
        badDrops[totalBadDrops] = new BadDrop(badDropImage);
        totalBadDrops++;
    }
      if (totalDrops >=drops.length) {
        totalDrops= 0;
    }
      if (totalBadDrops >=badDrops.length) {
        totalBadDrops= 0;
    }
      timer.start();
    
      for (int i = 0; i < totalDrops; i++) {
        drops[i].move();
        drops[i].display();
      if (catcher.intersectGood(drops[i])) {
        drops[i].caught();
    }
  }
      for (int i = 0; i < totalBadDrops; i++) {
        badDrops[i].move();
        badDrops[i].display();
      if (catcher.intersectBad(badDrops[i])) {
        badDrops[i].caughtBad();
    }
  }

    scoreBoard.display();
    
  crow1.move(); 
  crow1.display();
  crow2.move();
  crow2.display();
  
  if (catcher.intersectCrow(crow1)) {
      scoreBoard.decScoreCrow();
    }
  if (catcher.intersectCrow(crow2)) {
      scoreBoard.decScoreCrow();
  }  
  if (catcher.intersectFollower(follower)) {
      state = 'l';
    }
    
  follower.update();
  follower.display();
  break;
  }
}
  
