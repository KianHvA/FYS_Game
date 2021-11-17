class Player {

  //variables
  PVector posPlayer = new PVector(width/2, height/2 - 10);
  PVector sizePlayer = new PVector(20, 20);
  PVector velocity = new PVector(0, 0);
  final float GRAVITY = 0.4f;
  float jumpForce = 9;
  boolean hasJumped = false, hasDoubleJumped = false, hasCollision = false, wallCollisonR = false, wallCollisonL = false;

  void draw() {
    //modes
    ellipseMode(CENTER);
    rectMode(CENTER);

    //player
    fill(menu.player);
    ellipse(posPlayer.x, posPlayer.y, sizePlayer.x, sizePlayer.y);
  }
  void movementUpdate()
  {
    //check collision and set booleans to use down the line
    checkCollision(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.y);
    hasCollision = collisionHandler.hit;
    wallCollisonL = collisionHandler.hitWallLeft;
    wallCollisonR = collisionHandler.hitWallRight;
    if (!hasCollision)
    {
      velocity.y += GRAVITY; //werkt alleen als ik niet op een platform sta.
    } else {
      velocity.y = 0;
      player.collideWithPlatform();
    }
    if (wallCollisonR) {
      velocity.x = 0;
      velocity.x -= 1;
    } else if (wallCollisonL) {
      velocity.x = 0;
      velocity.x += 1;
    }
    //handle movement on x-axes
    if (keysPressed[LEFT] && !collisionHandler.hitWallLeft && !platforms.moveStage)
    {
      velocity.x = -3;
    } else if (keysPressed[RIGHT] && !collisionHandler.hitWallRight  && !platforms.moveStage)
    {
      velocity.x = 3;
    } else 
    if (!hasCollision)
    {
      velocity.x = lerp(velocity.x, 0, 0.01);
    } else {
      velocity.x = 0;
    }

    //handle jump
    if (hasCollision && keysPressed[UP]  && !platforms.moveStage)
    {
      hasCollision = false;
      velocity.y = -jumpForce;
    }
    if (!hasCollision && !hasDoubleJumped && keysPressed[UP] && velocity.y > 0 && Doublejump.pickedUp && Doublejump.cooldown < 10  && !platforms.moveStage)
    {
      velocity.y = -jumpForce;
      hasDoubleJumped = true;
    }
    
    if(healthbar.shieldDamage && schild.schildActivated && schild.schildLevens == 3) {
      schild.schildLevens = 2;
      schild.hit = true;
      healthbar.shieldDamage = false;
    }
    if(healthbar.shieldDamage && schild.schildActivated && schild.schildLevens == 2) {
      schild.schildLevens = 1;
      schild.hit = true;
      healthbar.shieldDamage = false;
    }
    if(healthbar.shieldDamage && schild.schildActivated && schild.schildLevens == 1) {
      schild.schildLevens = 0;
      schild.hit = true;
      healthbar.shieldDamage = false;
    }

    //add velocity to posPlayer
    posPlayer.x += velocity.x;
    posPlayer.y += velocity.y;
  }

  void collideWithPlatform()
  {
    hasCollision = true;
    if (collisionHandler.platformHitPos.y > posPlayer.y) {
      posPlayer.y = collisionHandler.platformHitPos.y - collisionHandler.platformHeight * 2;
    } else {
      hasCollision = false;
      posPlayer.y = posPlayer.y + 1;
    }
  }

  void checkCollision(float objectX, float objectY, float objectRadius) {
    collisionHandler.checkCollision(objectX, objectY, objectRadius);
  }
}
