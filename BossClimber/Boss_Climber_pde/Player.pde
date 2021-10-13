class Player {

  //variables
  PVector posPlayer = new PVector(width/2, height/2);
  PVector sizePlayer = new PVector(20, 20);
  PVector velocity = new PVector(0, 0);
  final float GRAVITY = 0.098f;
  boolean hasJumped = false, hasDoubleJumped = false, hasTripleJumped = false, hasDashed = false, hasCollision = false;

  void draw() {
    //modes
    ellipseMode(CENTER);
    rectMode(CENTER);

    //player
    fill(255);
    ellipse(posPlayer.x, posPlayer.y, sizePlayer.x, sizePlayer.y);
  }
  void movementUpdate()
  {
    println(posPlayer);
    checkCollision(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.y);
    hasCollision = collisionHandler.hit;
    if (!hasCollision)
    {
      velocity.y += GRAVITY; //werkt alleen als ik niet op een platform sta.
    } else {
      player.collideWithPlatform();
    }
    posPlayer.x += velocity.x;
    posPlayer.y += velocity.y;

    if (keysPressed[LEFT])
    {
      velocity.x = -1;
    } else if (keysPressed[RIGHT])
    {
      velocity.x = 1;
    } else if (!hasCollision)
    {
      velocity.x = lerp(velocity.x, 0, 0.01);
    } else {
      velocity.x = 0;
    }

    if (hasCollision && keysPressed[UP])
    {
      hasCollision = false;
      velocity.y = -5;
    }
    if (!hasCollision && !hasDoubleJumped && keysPressed[UP] && velocity.y > 0 && jumpboost.pickedUp)
    {
      velocity.y = -5;
      hasDoubleJumped = true;
    }
    if (collisionHandler.hitLadder && keysPressed[UP]) {
      velocity.y = -2;
    } else if (collisionHandler.hitLadder && keysPressed[DOWN]) {
      velocity.y = 2;
    } else if (collisionHandler.hitLadder) {
      velocity.y = 0;
    }
  }

  void checkCollision(float objectX, float objectY, float objectRadius) {
    collisionHandler.checkCollision(objectX, objectY, objectRadius);
  }

  void collideWithPlatform() //<>//
  {
    velocity.y = 0;
    hasCollision = true;
    hasDoubleJumped = false;
    //if (collisionHandler.platformHitPos.y > posPlayer.y) {
    //  posPlayer.y = collisionHandler.platformHitPos.y - collisionHandler.platformHeight * 2;
    //} else {
      //if(posPlayer.y != match(posPlayer.y, "<tag>(.*?)</tag>");)
      //float preY = posPlayer.y;
      posPlayer.y = collisionHandler.platformHitPos.y - collisionHandler.platformHeight * 2;
    //}
    
  }
}
