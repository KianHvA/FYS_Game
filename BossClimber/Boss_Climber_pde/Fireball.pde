//Dion
class Fireball {

  CollisionHandler collisionHandler;
  //variables
  PVector posFireball = new PVector(200, 0);
  PVector startFireball;
  PVector sizeFireball = new PVector(20, 20);
  PVector newPosFireball = new PVector(200, 50);
  PVector velocity = new PVector(0, 0);
  PVector resetFireball = new PVector(200, 0);
  final float GRAVITY = 0.1f;
  //private float timer = 0;
  boolean hasJumped = false, switchDirection = false, hasDashed = false, hasCollision = false, wallCollisonR = false, wallCollisonL = false, playerCollision = false, newPos = false;
  float damageFireball = 33;
  PVector RposFireball = new PVector(400, 50);
  PImage leftF1, leftF2, rightF1, rightF2; //fireballs
  PImage Active, leftActive, rightActive;
  boolean left = false, right = true, bossOn = false;
  float timerLeft1 = 0, timerLeft2 = 0, timerRight1 = 0, timerRight2 = 0;;
  float zeroSpeed = 0;
  float positiveSpeed = 2;
  float negativeSpeed = -2;
  float two = 2;
  float zero = 0;
  int achievementFireballCount = 0;
  color red = color(255, 0, 0);
  
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
    
    collisionHandler = new CollisionHandler();
  }


  void draw() {
    //modes
    ellipseMode(CENTER);
    rectMode(CENTER);

    //Fireball
    if(On || bossOn){
    fill(red);
    image(Active,posFireball.x, posFireball.y, sizeFireball.x, sizeFireball.y);
    //ellipse(posFireball.x, posFireball.y, sizeFireball.x, sizeFireball.y);
  }}
  void movementUpdate()
  {
    //Collisions
    checkCollision(posFireball.x, posFireball.y, sizeFireball.y);
    collisionHandler.checkCollisionPlayer(posFireball.x, posFireball.y, sizeFireball.x/2);
    hasCollision = collisionHandler.hit;
    playerCollision = collisionHandler.hitPlayer;
    wallCollisonR = collisionHandler.hitWallRight;
    wallCollisonL = collisionHandler.hitWallLeft;
    
    //Switch fireball directions
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
        velocity.x = positiveSpeed;
      }

      if (switchDirection) {
        velocity.x = negativeSpeed;
      } else {
        velocity.x = positiveSpeed;
      }
      velocity.y = positiveSpeed;
    }

    if (playerCollision) {
      healthbar.doDamage(damageFireball);
    }
    posFireball.x += velocity.x;
    posFireball.y += velocity.y;
      
      if (left && !right) {
        Active = leftActive;
        if (timerLeft2 == zero) {
          timerLeft1++;
        }
        if (timerLeft1 >= 15) {
          leftActive = leftF1;
          timerLeft2++;
        }
        if (timerLeft2 >= 15) {
          leftActive = leftF2;
          timerLeft1 = zero;
          timerLeft2 = zero;
        }
      }
      if (right && !left) {
        Active = rightActive;
        if (timerRight2 == zero) {
          timerRight1++;
        }
        if (timerRight1 >= 15) {
          rightActive = rightF1;
          timerRight2++;
        }
        if (timerRight2 >= 15) {
          rightActive = rightF2;
          timerRight1 = zero;
          timerRight2 = zero;
        }
      }
  }
  
  void achievementUpdateFireball(){
    if (fireballDrop(posFireball.x, posFireball.y, sizeFireball.x,
     drops.posPlayer.x, drops.posPlayer.y, drops.dropDia)){
      achievementFireballCount++;
   }
  }
  
  //Fireballs movement during the boss fight
  void movementUpdateBossFight(){
    checkCollision(posFireball.x, posFireball.y, sizeFireball.y);
    collisionHandler.checkCollisionPlayer(posFireball.x, posFireball.y, sizeFireball.x/2);

    hasCollision = collisionHandler.hit;
    playerCollision = collisionHandler.hitPlayer;
    wallCollisonR = collisionHandler.hitWallRight;
    wallCollisonL = collisionHandler.hitWallLeft;
    if (!hasCollision)
    {
      velocity.x = zeroSpeed;
      velocity.y += GRAVITY; //werkt alleen als ik niet op een platform sta.
    } else {
      collideWithPlatform();
      velocity.x = positiveSpeed;
      //println(wallCollisonR + "  " + wallCollisonL);
    }
      
   if (playerCollision) {
      healthbar.doDamage(damageFireball);
    }
    
    posFireball.x += velocity.x;
    posFireball.y += velocity.y;
  }

  void respawn() {
    //Fireball
    
    posFireball.x = resetFireball.x;
    posFireball.y = resetFireball.y;
  }


  void checkCollision(float objectX, float objectY, float objectRadius) {
    collisionHandler.checkCollision(objectX, objectY, objectRadius);
  }

  void collideWithPlatform()
  {
    velocity.y = zeroSpeed;
    hasCollision = true;
    if (collisionHandler.platformHitPos.y > posFireball.y) {
      posFireball.y = collisionHandler.platformHitPos.y - collisionHandler.platformHeight * two;
    }
  }
  
  boolean fireballDrop(float vuurX, float vuurY, float vuurDia, float drupX, float drupY, float drupDia){//Fireball + druppel
    float distanceX = vuurX - drupX;
    float distanceY = vuurY - drupY;
    
    float totalDistance = sqrt((distanceX * distanceX) + (distanceY * distanceY));
    
    if (totalDistance <= vuurDia + drupDia){
      return true;
    }
    return false;
  }
}
