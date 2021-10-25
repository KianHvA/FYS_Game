class Fireball {

  //variables
  PVector posFireball = new PVector(200, 50);
  PVector sizeFireball = new PVector(20, 20);
  PVector newPosFireball = new PVector(200, 50);
  PVector velocity = new PVector(0, 0);
  final float GRAVITY = 0.098f;
  private float timer = 0;
  boolean hasJumped = false, switchDirection = false, hasDashed = false, hasCollision = false, wallCollisonR = false, wallCollisonL = false;
  float damageFireball = 33;

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

    hasCollision = collisionHandler.hit;
    wallCollisonR = collisionHandler.hitWallRight;
    wallCollisonL = collisionHandler.hitWallLeft;
    if (!hasCollision)
    {
      velocity.y += GRAVITY; //werkt alleen als ik niet op een platform sta.
    } else {
      collideWithPlatform();
      println(wallCollisonR + "  " + wallCollisonL);
      if (wallCollisonR && !switchDirection) {
        switchDirection = true;
      } else if (wallCollisonL && switchDirection) {
        switchDirection = false;
      } else {
        velocity.x = 2;
      }

      if (switchDirection) {
        velocity.x = -2;
      }
      else {
        velocity.x = 2;
      }
      velocity.y = 2;
    }
    posFireball.x += velocity.x;
    posFireball.y += velocity.y;
    if (timer >= 300) {
      //spawn fireBall
      posFireball.x = newPosFireball.x;
      posFireball.y = newPosFireball.y;
      timer = 0;
      respawn();
    }

    if (timer >= frameRate * 5) {
      //spawn fireBall
      posFireball.x  = newPosFireball.x;
      posFireball.y  = newPosFireball.y;
    }
  }

  void respawn() {
    //Fireball
    fill(255, 0, 0);
    ellipse(posFireball.x, posFireball.y, sizeFireball.x, sizeFireball.y);
  }


  void checkCollision(float objectX, float objectY, float objectRadius) {
    collisionHandler.checkCollision(objectX, objectY, objectRadius);
  }

  void collideWithPlatform()
  {
    velocity.y = 0;
    hasCollision = true;
    posFireball.y = collisionHandler.platformHitPos.y - 10 * 2;
  }
}
