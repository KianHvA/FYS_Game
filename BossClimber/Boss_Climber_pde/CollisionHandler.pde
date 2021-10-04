/* //<>//
  Welkom bij de Collision Class, dit is hoe je hem gebruikt:
  
  1. maak een collision boolean aan in de global variables:
  boolean hasCollision = false;
  2. Roep deze functie en variable aan in de update loop:
  checkCollision(float objectX, float objectY, float objectRadius);
  hasCollision = collisionHandler.hit;
  3. vervang "float objectX, float objectY, float objectRadius" 
  in de functie checkCollision met de positie X en Y en de hoogte/radius van het object.
  4. gebruik nu de hasCollision boolean in jou code om te bepalen wat er gebeurt als het object collide

  De collision is nu alleen nog voor de platforms, als je wilt dat het ook met andere objecten gaat werken stuur me even je code en ik zal proberen het 
  ook te laten werken met die code.
*/
class CollisionHandler
{
  boolean hit = false;
  PVector platformHitPos;
  float platformHeight;
  boolean[] hitPlatform = new boolean[platforms.length];
  PVector posBeforeCollision;
  //void update()
  //{  
  //  //niet in gebruik 
  //}

  void checkCollision(float objectX, float objectY, float objectRadius)
  {
    for (int i = 0; i < platforms.length; i++)
    {
      BaseLevelSegment platform = platforms[i];
      hit = circleRect(objectX, objectY, objectRadius, platform.platformPos.x, platform.platformPos.y, platform.sizeX, platform.sizeY);
      if (hit) {
        swap(platforms, 0, i);
      } else {
        swap(platforms, i, 0);
      }
    }
  }

  void checkPlatformUnderground(float objectX, float objectY, float objectRadius)
  {
    for (int i = 0; i < platforms.length; i++)
    {
      BaseLevelSegment platform = platforms[i];
      hit = circleRect(objectX, objectY, objectRadius, platform.platformPos.x, platform.platformPos.y, platform.sizeX, platform.sizeY);
      if (hit) {
        swap(platforms, 0, i);
      } else {
        swap(platforms, i, 0);
      }
    }
  }

  boolean circleRect(float objectX, float objectY, float radius, float rx, float ry, float rw, float rh) {

    //temporary variables for testing edges
    float testX = objectX;
    float testY = objectY;

    if (objectX < rx-rw/2)         testX = rx-rw/2;      // compare left edge
    else if (objectX > rx+rw/2) testX = rx+rw/2;   // right edge
    if (objectY < ry)         testY = ry;      // top edge
    else if (objectY > ry+rh) testY = ry+rh;   // bottoobjectXm edge

    // get distance from closest edges
    float distX = objectX-testX;
    float distY = objectY-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );
    println( rh + " " + distance +  " " + radius );
    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      platformHitPos = new PVector(rx, ry);
      posBeforeCollision = new PVector(objectX, objectY);
      platformHeight = rh;
      return true;
    } else {
      return false;
    }
  }
  void swap(BaseLevelSegment[] input, int index_A, int index_B) {
    BaseLevelSegment temp = input[index_A];

    input[index_A] = input[index_B];
    input[index_B] = temp;
  }
}
