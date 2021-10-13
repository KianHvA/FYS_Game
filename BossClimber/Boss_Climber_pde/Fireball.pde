class Fireball{

  //variables
  PVector posFireball = new PVector(width/2, height/2);
  PVector sizeFireball = new PVector(20, 20);
  PVector velocity = new PVector(0, 0);
  final float GRAVITY = 0.098f;
  boolean hasJumped = false, hasDoubleJumped = false, hasTripleJumped = false, hasDashed = false, hasCollision = false;

  void draw() {
    //modes
    ellipseMode(CENTER);
    rectMode(CENTER);

    //Fireball
    fill(255);
    ellipse(posFireball.x, posFireball.y, sizeFireball.x, sizeFireball.y);
  }
  void movementUpdate()
  {
    checkCollision(posFireball.x, posFireball.y, sizeFireball.y);
    hasCollision = collisionHandler.hit;
    if (!hasCollision)
    {
      velocity.y += GRAVITY; //werkt alleen als ik niet op een platform sta.
    } else {
      collideWithPlatform();
    }
    posFireball.x += velocity.x;
    posFireball.y += velocity.y;
  }
    

  void checkCollision(float objectX, float objectY, float objectRadius) {
    collisionHandler.checkCollision(objectX, objectY, objectRadius);
  }

  void collideWithPlatform()
  {
    velocity.y = 0;
    hasCollision = true;
    hasDoubleJumped = false;
    posFireball.y = collisionHandler.platformHitPos.y - collisionHandler.platformHeight * 2;
  }
}
