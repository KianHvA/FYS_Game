//Dion
class Fireball {

  CollisionHandler collisionHandler;
  //variables
  PVector posFireball = new PVector(200, 0);
  PVector startFireball;
  PVector sizeFireball = new PVector(20, 20);
  PVector newPosFireball = new PVector(200, 50);
  PVector velocity = new PVector(0, 0);
  final float GRAVITY = 0.1f;
  //private float timer = 0;
  boolean hasJumped = false, switchDirection = false, hasDashed = false, hasCollision = false, wallCollisonR = false, wallCollisonL = false, playerCollision = false, newPos = false;
  float damageFireball = 33;
  PVector RposFireball = new PVector(400, 50);
  PImage leftF1, leftF2, rightF1, rightF2; //fireballs
  PImage Active, leftActive, rightActive;
  boolean left = false, right = true;
  float timerLeft1 = 0, timerLeft2 = 0, timerRight1 = 0, timerRight2 = 0;;
  
  //void fireball(float fireX, float fireY){
    //posFireball.x = fireX;
    //posFireball.y = fireY;
  //}
  
  void setup(){
    //left
    leftF1 = loadImage("FireBall - Left1.png");
    leftF2 = loadImage("FireBall - Left2.png");
    //right
    rightF1 = loadImage("FireBall - Right1.png");
    rightF2 = loadImage("FireBall - Right2.png");
    //active
    Active = loadImage("FireBall - Right1.png");
    leftActive = loadImage("FireBall - Left1.png");
    rightActive = loadImage("FireBall - Right1.png");
    //dragon.startx = posFireball.x;
    //dragon.starty = posFireball.y;
    startFireball = posFireball;
    //println(posFireball.y);
    
    collisionHandler = new CollisionHandler();
  }


  void draw() {
    //modes
    ellipseMode(CENTER);
    rectMode(CENTER);

    //Fireball
    if(On){
    fill(255, 0, 0);
    image(Active,posFireball.x, posFireball.y, sizeFireball.x, sizeFireball.y);
    //ellipse(posFireball.x, posFireball.y, sizeFireball.x, sizeFireball.y);
  }}
  void movementUpdate()
  {
    checkCollision(posFireball.x, posFireball.y, sizeFireball.y);
    collisionHandler.checkCollisionPlayer(posFireball.x, posFireball.y, sizeFireball.x/2);

    hasCollision = collisionHandler.hit;
    playerCollision = collisionHandler.hitPlayer;
    wallCollisonR = collisionHandler.hitWallRight;
    wallCollisonL = collisionHandler.hitWallLeft;
    if (!hasCollision)
    {
      velocity.y += GRAVITY; //werkt alleen als ik niet op een platform sta.
    } else {
      collideWithPlatform();
      //println(wallCollisonR + "  " + wallCollisonL);
      if (wallCollisonR && !switchDirection) {
        switchDirection = true;
        left = true;
        right = false;
      } else if (wallCollisonL && switchDirection) {
        switchDirection = false;
        right = true;
        left = false;
      } else {
        velocity.x = 2;
      }

      if (switchDirection) {
        velocity.x = -2;
      } else {
        velocity.x = 2;
      }
      velocity.y = 2;
    }

    if (playerCollision) {
      healthbar.doDamage();
    }
    posFireball.x += velocity.x;
    posFireball.y += velocity.y;
      
      if (left && !right) {
        Active = leftActive;
        if (timerLeft2 ==0) {
          timerLeft1++;
        }
        if (timerLeft1 >= 15) {
          leftActive = leftF1;
          timerLeft2++;
        }
        if (timerLeft2 >= 15) {
          leftActive = leftF2;
          timerLeft1 = 0;
          timerLeft2 = 0;
        }
      }
      if (right && !left) {
        Active = rightActive;
        if (timerRight2 ==0) {
          timerRight1++;
        }
        if (timerRight1 >= 15) {
          rightActive = rightF1;
          timerRight2++;
        }
        if (timerRight2 >= 15) {
          rightActive = rightF2;
          timerRight1 = 0;
          timerRight2 = 0;
        }
      }
    //if (timer >= 300) {
    //spawn fireBall
    //posFireball.x = newPosFireball.x;
    // posFireball.y = newPosFireball.y;
    //timer = 0;
    // respawn();
    // }


   // if (timer >= frameRate * 5) {
      //spawn fireBall
     // posFireball.x  = newPosFireball.x;
     // posFireball.y  = newPosFireball.y;
    //}  

    // if (timer >= frameRate * 5) {
    //spawn fireBall
    // posFireball.x  = newPosFireball.x;
    // posFireball.y  = newPosFireball.y;
    //}
  }

  void respawn() {
    //Fireball
    
    posFireball.x = 200;
    posFireball.y = 0;
    
    //posFireball.x = dragon.startx;
    //posFireball.y = dragon.starty;
    
    //println(dragon.startx);
    //println(dragon.starty);
    //startFireball.x = 400;
    //startFireball.y = 50;
    //fill(255, 0, 0);
    //ellipse(startFireball.x, startFireball.y, sizeFireball.x, sizeFireball.y);
  }


  void checkCollision(float objectX, float objectY, float objectRadius) {
    collisionHandler.checkCollision(objectX, objectY, objectRadius);
  }

  void collideWithPlatform()
  {
    velocity.y = 0;
    hasCollision = true;
    if (collisionHandler.platformHitPos.y > posFireball.y) {
      posFireball.y = collisionHandler.platformHitPos.y - collisionHandler.platformHeight * 2;
    }
  }
  
  boolean fireballDruppel(float vuurX, float vuurY, float vuurDia, float drupX, float drupY, float drupDia){//Fireball + druppel
    float distanceX = vuurX - drupX;
    float distanceY = vuurY - drupY;
    
    float totalDistance = sqrt((distanceX * distanceX) + (distanceY * distanceY));
    
    if (totalDistance <= vuurDia + drupDia){
      return true;
    }
    return false;
  }
}
