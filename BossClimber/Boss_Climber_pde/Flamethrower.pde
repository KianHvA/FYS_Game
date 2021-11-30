class Flamethrower {
  //PVector source = new PVector(platforms.x/random(1, 5), platforms.y + platforms.platformThickness/2);
  //PVector[] spawn = new PVector[20];
  float x1 = width/6, x2 = width/6;
  float x3 = width/6 + width/2, x4 = width/6 + width/2;
  int i = 0;
  PVector sizeVlam = new PVector(22, 80);
  float timer1 = 0, timer2 = 0;
  int distance = 660, from = 150, minus = 7;
  int  distBetween = 200, idk = 0;
  boolean live = false, hasCollision = false;
  int newY = 660;
  PImage flamethrower;

  void setup() {
    flamethrower = loadImage("Flamethrower.png");
    //links
    for (int y = distance; y > from; y = y - distBetween) {
      int y1 = y + minus;
      int y2 = y1 + minus;
      noStroke();
      fill(255);
      quad(x1, y, x1, y1, x2+60, y2 + (platforms.platformThickness/4), x2+60, y1 + (platforms.platformThickness/4) - 10); //The bottom of the Flamethrower
    }
    //rechts 
    //for (int y = 660; y>150; y = y+ 200) {
    //  int y1= y + 7;
    //  int y2 = y1 + 7;
    //  noStroke();
    //  fill(255);
    //  quad(x3, y, x3, y1, x4+60, y2 + (platforms.platformThickness/4), x4+60, y1 + (platforms.platformThickness/4) - 10);
    //}
  }

  void draw() {
    newY = distance + platforms.levelMove;
    //links
    for (int y = newY; y >from; y = y - distBetween) {
      int y1 = y + minus;
      int y2 = y1 + minus;
      noStroke();
      fill(255);
      quad(x1, y, x1, y1, x2+60, y2 + (platforms.platformThickness/4), x2+60, y1 + (platforms.platformThickness/4) - 10); //The bottom of the Flamethrower
    }
  }

  void update() { //I am using an timer (If you know a better way for a timer you can use it) to make sure the fire dispences from time to time
    for (int y = newY; y>from; y = y- distBetween) {
      int y1= y - 6;

      noStroke();
      if (timer2 == 0) {
        timer1++;
        //println(timer1);
      } 
      if (timer1 > 900&&On) {
        imageMode(CENTER);
        rectMode(CENTER);
        fill(#FA9108);
        image(flamethrower, x1 + width/25, y1, sizeVlam.x, sizeVlam.y);
        //rect(x1 + width/25, y1, sizeVlam.x, sizeVlam.y); //Making the Fire come out
        live = true; //Collision check activate
        timer2++;
        timer1 = 910;
        //println(timer2);
      } 
      if (live) { //Checking the collision
        collisionHandler.checkCollisionPlayer(x1, y1, sizeVlam.x);
        hasCollision = collisionHandler.hitPlayer;
      } else {
        hasCollision = false;
      }
      if (timer2 == 180) {
        timer1 = 0;
        timer2 = 0;
        live = false; //Collision check de-activate
      }
      if (hasCollision) idk++; //Uhm we don't talk about it (Otherwise it doesn't detect that hasCollision == true. I don't know why)
    }
  }
}
