class Fireball {

  //variables
  PVector posFireball = new PVector(0, 0);
  PVector startFireball;
  PVector sizeFireball = new PVector(20, 20);
  PVector newPosFireball = new PVector(200, 50);
  PVector velocity = new PVector(0, 0);
  final float GRAVITY = 0.1f;
  private float timer = 0;
  PVector RposFireball;
  boolean hasJumped = false, switchDirection = false, hasDashed = false, hasCollision = false, wallCollisonR = false, wallCollisonL = false, playerCollision = false, newPos = false;
  float damageFireball = 33;

  void fireball(float fireX, float fireY) {
    posFireball.x = fireX;
    posFireball.y = fireY;
  }

  void setup() {
    //dragon.startx = posFireball.x;
    //dragon.starty = posFireball.y;
    startFireball = posFireball;
    println(posFireball.y);
    RposFireball = new PVector(400, 50);
  }
  void draw() {
    //modes
    ellipseMode(CENTER);
    rectMode(CENTER);

    //Fireball
    fill(255, 0, 0);
    ellipse(posFireball.x, posFireball.y, sizeFireball.x, sizeFireball.y);
  }
  void movementUpdate()
  {
    checkCollision(posFireball.x, posFireball.y, sizeFireball.y);
    collisionHandler.checkCollisionPlayer(posFireball.x, posFireball.y, sizeFireball.x);

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
      } else if (wallCollisonL && switchDirection) {
        switchDirection = false;
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
      healthbar.doDamage(damageFireball);
    }
    posFireball.x += velocity.x;
    posFireball.y += velocity.y;
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
    posFireball.x = dragon.startx;
    posFireball.y = dragon.starty;
    println(dragon.startx);
    println(dragon.starty);
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
}
