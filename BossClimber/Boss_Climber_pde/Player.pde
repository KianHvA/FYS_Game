class Player
{
  float size, velocityX, velocityY;
  final float GRAVITY = 0.098f;
  PVector playerPos;
  boolean hasCollision = false, hasDoubleJumped = false;

  Player(PVector playerPos, float size)
  {
    this.playerPos = playerPos;
    this.size = size;
  }    

  //lopen van links naar rechts.
  //springen.

  void update()
  {
    if (!hasCollision)
    {
      velocityY += GRAVITY; //werkt alleen als ik niet op een platform sta.
    }
    playerPos.x += velocityX;
    playerPos.y += velocityY;

    if (keysPressed[LEFT])
    {
      velocityX = -1;
    } else if (keysPressed[RIGHT])
    {
      velocityX = 1;
    } else
    {
      velocityX = 0;
    }

    if (hasCollision && keysPressed[UP])
    {
      hasCollision = false;
      velocityY = -25;
      println("jump");
    }
    if (!hasCollision && !hasDoubleJumped && keysPressed[UP] && velocityY > -10)
    {
      velocityY = -15;
      hasDoubleJumped = true;
    }
  }


  //void moveWorld(float x, float y)
  //{
  //  for (int i = 1; i < platforms.length; i++)
  //  {
  //    BaseLevelSegment platform = platforms[i];
  //    platform.platformPos.y += y;
  //  }
  //}

  void collideWithPlatform()
  {
    velocityY = 0;
    hasCollision = true;
    hasDoubleJumped = false;
    playerPos.y = collisionHandler.platformHitPos.y - collisionHandler.platformHeight*2;
  }

  void draw()
  {
    fill(255, 0, 0);
    circle(playerPos.x, playerPos.y, size);
  }
}
