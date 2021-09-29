class CollisionHandler //<>//
{
  boolean hit = false;
  PVector platformHitPos;
  float platformHeight;
  //player && floor
  void update()
  {
    if (hit)
    {
      checkPlatformUnderground(player.playerPos.x, player.playerPos.y, player.size);
      player.collideWithPlatform();
    } else { 

      checkCollision(player.playerPos.x, player.playerPos.y, player.size);
      player.hasCollision = false;
    }
  }

  void checkCollision(float objectX, float objectY, float objectRadius)
  {
    for (int i = 0; i < platforms.length; i++)
    {
      BaseLevelSegment platform = platforms[i];
      hit = circleRect(objectX, objectY, objectRadius, platform.platformPos.x, platform.platformPos.y, platform.sizeX, platform.sizeY);
    }
  }

  void checkPlatformUnderground(float objectX, float objectY, float objectRadius)
  {
    for (int i = 0; i < platforms.length; i++)
    {
      BaseLevelSegment platform = platforms[i];
      hit = circleRect(objectX, objectY, objectRadius, platform.platformPos.x, platform.platformPos.y, platform.sizeX, platform.sizeY);
    }
  }

  boolean circleRect(float objectX, float objectY, float radius, float rx, float ry, float rw, float rh) {

    //temporary variables for testing edges
    float testX = objectX;
    float testY = objectY;

    // which edge is closest
    if (objectX < rx - rw/2)    testX = rx - rw; // compare left edge
    else if (objectX > rx+rw/2) testX = rx + rw; // right edge
    if (objectY < ry)           testY = ry;      // top edge
    else if (objectY > ry+rh)   testY = ry+rh;   // bottom edge

    // get distance from closest edges
    float distX = objectX-testX;
    float distY = objectY-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );
    println(distance +  " " + radius );
    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      platformHitPos = new PVector(rx, ry);
      platformHeight = rh;
      return true;
    }
    return false;
  }
}
