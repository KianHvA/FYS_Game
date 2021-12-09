//Tristan
class Flamethrower {
  CollisionHandler collisionHandler;
  final float X1 = width/6; //X coördinates left.
  final float X2 = width/6 + 60;
  final float X3 = width/6 + width/2; //X coördinates right.
  final float X4 = width/6 + width/2 + 60;
  final PVector SIZEFLAME = new PVector(60, 100);
  float timer1 = 0, timer2 = 0;
  int distance = 660; //Size screen so that everything stands correctly.
  int from = 150; //From y = 150 flamethrowers are drawn.
  int minus = 7; //Size base flamethrower.
  int  distBetween = 200; //Distance between bases of flamethrowers.
  final int RIGHTSIDE = 80; //Offset voor de rechterkant.
  boolean live = false; //If the flamethrowers are active this boolean will make sure that the collision activates.
  boolean live2 = false; //If the flamethrowers are active this boolean will make sure that the collision activates.
  boolean hasCollision = false;
  int newY = 660; //Size screen so that everything stands correctly.
  PImage flamethrower;

  void setup() {
    collisionHandler = new CollisionHandler();
    flamethrower = loadImage("Flamethrower.png"); //Loading of the picture.
    //links
    for (int y = distance; y > from; y = y - distBetween) {
      int y1 = y + minus; //Y1 = upper side.
      int y2 = y1 + minus; //Y2 = under side.
      noStroke();
      fill(255);
      quad(X1, y, X1, y1, X2+60, y2 + (platforms.platformThickness/4), X2+60, y1 + (platforms.platformThickness/4) - 10); //Bottom left.
    }
    //rechts 
    for (int y = newY; y > from; y = y - distBetween) {
      int y1 = y + minus; //Y1 = upper side.
      int y2 = y1 + minus; //Y2 = under side.
      noStroke();
      fill(255);
      quad(X3, y, X3, y1, X4 + 60, y2 + (platforms.platformThickness/4), X4 + 60, y1 + (platforms.platformThickness/4) - 10); //Bottom right.
    }
  }

  void draw() {
    newY = distance + platforms.levelMove;
    //links
    for (int y = newY; y >from; y = y - distBetween) {
      int y1 = y + minus; //Y1 = upper side.
      int y2 = y1 + minus; //Y2 = under side.
      noStroke();
      fill(255);
      quad(X1, y, X1, y1, X2, y2 + (platforms.platformThickness/4), X2, y1 + (platforms.platformThickness/4) - 10); //Bottom left.
    }
    newY = distance - RIGHTSIDE + platforms.levelMove; //newY is now 80 less which makes it fit better on the right side.
    //recths
    for (int y = newY; y > from; y = y - distBetween) {
      int y1 = y + minus; //Y1 = upper side.
      int y2 = y1 + minus; //Y2 = under side.
      noStroke();
      fill(255);
      quad(X3, y2  + (platforms.platformThickness/4), X3, y1  + (platforms.platformThickness/4) - 10, X4, y, X4, y1); //Bottom right.
    }
    newY = distance + platforms.levelMove; //Putting back newY so it works correctly in update().
  }

  void update() { //I am using an timer (If you know a better way for a timer you can use it) to make sure the fire dispences from time to time.
    if (!dragon.fight) {//Not if bossfight is active.
      for (int y = newY; y>from; y = y- distBetween) {
        int y1= y - 6; //Y variable links. Picture only needs one Y value.
        int y2 = y - 90; //Y variabel right. Picture only needs one Y value.

        noStroke();
        if (timer2 == 0) {
          timer1++;
        } 
        if (timer1 > 900) {
          imageMode(CENTER);
          rectMode(CENTER);
          fill(#FA9108);
          image(flamethrower, X1 + width/35 + 2, y1 - height/50, SIZEFLAME.x, SIZEFLAME.y);
          image(flamethrower, X3 + width/35 + 2, y2 - height/50, SIZEFLAME.x, SIZEFLAME.y);
          live = true; //Collision check activate
          live2 = true; //Collision check activate
          timer2++;
          timer1 = 910;
        }
        
        if (live) {
          collisionHandler.checkCollisionPlayer(X1 + width/35 + 2, y1 - height/50, SIZEFLAME.x);
          if (collisionHandler.hitPlayer) {
            hasCollision = collisionHandler.hitPlayer;
          } else {
            collisionHandler.checkCollisionPlayer(X3 + width/35 + 2, y2 - height/50, SIZEFLAME.x);
          }
          hasCollision = collisionHandler.hitPlayer;
        }
        if (timer2 == 180) {
          timer1 = 0;
          timer2 = 0;
          live = false; //Collision check de-activate
          live2 = false; //Collision check de-activate
        }
        if (hasCollision) healthbar.doDamage(1); //damage
      }
    }
  }
}
