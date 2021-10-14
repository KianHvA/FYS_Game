/*
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
  boolean hitWall = false;
  boolean hitPlayer = false;
  boolean hitLadder = false;
  PVector platformHitPos;
  float platformHeight;
  boolean[] hitPlatform = new boolean[100];
  PVector posBeforeCollision;
  int wallThickness = 200;

  void update() {
    hit = polyCircle(platforms.vertexesL, player.posPlayer.x, player.posPlayer.y, player.sizePlayer.y) ||
      polyCircle(platforms.vertexesR, player.posPlayer.x, player.posPlayer.y, player.sizePlayer.y) ||
      polyCircle(vertexesBossPlatform, player.posPlayer.x, player.posPlayer.y, player.sizePlayer.y);
  }

  //object met player collision
  void checkCollisionPlayer(float objectX, float objectY, float objectRadius) {
    hitWall = wallCollider(objectX, objectRadius, wallThickness);
    hitPlayer = circleRect(objectX, objectY, objectRadius, player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, player.sizePlayer.y);
  }



  //Object met platform collision
  void checkCollision(float objectX, float objectY, float objectRadius)
  {
    if (polyCircle(platforms.vertexesL, objectX, objectY, objectRadius) == true || polyCircle(platforms.vertexesR, objectX, objectY, objectRadius) == true || polyCircle(vertexesBossPlatform, objectX, objectY, objectRadius)) {
      hit = true;
    } else {
      hit = false;
    }
  }

  // POLYGON/CIRCLE
  boolean polyCircle(PVector[] vertices, float cx, float cy, float r) {

    // go through each of the vertices, plus
    // the next vertex in the list
    int next = 0;
    for (int current=0; current < vertices.length; current++) {
      
      next = current+1;
      if (next == vertices.length) next = 0;

      PVector vc = vertices[current];
      PVector vn = vertices[next];
      
      boolean collision = lineCircle(vc.x, vc.y, vn.x, vn.y, cx, cy, r);
      if (collision) return true;
    }

    boolean centerInside = polygonPoint(vertices, cx, cy);
    if (centerInside) return true;

    return false;
  }


  // LINE/CIRCLE
  boolean lineCircle(float x1, float y1, float x2, float y2, float cx, float cy, float r) {

    boolean inside1 = pointCircle(x1, y1, cx, cy, r);
    boolean inside2 = pointCircle(x2, y2, cx, cy, r);
    if (inside1 || inside2) return true;

    // get length of the line
    float distX = x1 - x2;
    float distY = y1 - y2;
    float len = sqrt( (distX*distX) + (distY*distY) );

    float dot = ( ((cx-x1)*(x2-x1)) + ((cy-y1)*(y2-y1)) ) / pow(len, 2);

    float closestX = x1 + (dot * (x2-x1));
    float closestY = y1 + (dot * (y2-y1));
    //ellipse(closestX, closestY, 20, 20);
    platformHitPos = new PVector(closestX, closestY);
    platformHeight = 10;
    
    boolean onSegment = linePoint(x1, y1, x2, y2, closestX, closestY);
    if (!onSegment) return false;


    fill(255, 0, 0);
    noStroke();
    //ellipse(closestX, closestY, 20, 20);

    // get distance to closest point
    distX = closestX - cx;
    distY = closestY - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // is the circle on the line?
    if (distance <= r) {
      return true;
    }
    return false;
  }


  // LINE/POINT
  boolean linePoint(float x1, float y1, float x2, float y2, float px, float py) {

    // get distance from the point to the two ends of the line
    float d1 = dist(px, py, x1, y1);
    float d2 = dist(px, py, x2, y2);

    // get the length of the line
    float lineLen = dist(x1, y1, x2, y2);

    // since floats are so minutely accurate, add
    // a little buffer zone that will give collision
    float buffer = 0.1;    // higher # = less accurate

    // if the two distances are equal to the line's
    // length, the point is on the line!
    // note we use the buffer here to give a range, rather
    // than one #
    if (d1+d2 >= lineLen-buffer && d1+d2 <= lineLen+buffer) {
      return true;
    }
    return false;
  }


  // POINT/CIRCLE
  boolean pointCircle(float px, float py, float cx, float cy, float r) {

    // get distance between the point and circle's center
    // using the Pythagorean Theorem
    float distX = px - cx;
    float distY = py - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the circle's 
    // radius the point is inside!
    if (distance <= r) {
      return true;
    }
    return false;
  }


  // POLYGON/POINT
  // only needed if you're going to check if the circle
  // is INSIDE the polygon
  boolean polygonPoint(PVector[] vertices, float px, float py) {
    boolean collision = false;

    // go through each of the vertices, plus the next
    // vertex in the list
    int next = 0;
    for (int current=0; current<vertices.length; current++) {

      // get next vertex in list
      // if we've hit the end, wrap around to 0
      next = current+1;
      if (next == vertices.length) next = 0;

      // get the PVectors at our current position
      // this makes our if statement a little cleaner
      PVector vc = vertices[current];    // c for "current"
      PVector vn = vertices[next];       // n for "next"

      // compare position, flip 'collision' variable
      // back and forth
      if (((vc.y > py && vn.y < py) || (vc.y < py && vn.y > py)) &&
        (px < (vn.x-vc.x)*(py-vc.y) / (vn.y-vc.y)+vc.x)) {
        collision = !collision;
      }
    }
    return collision;
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
    //als distanse kleiner is dan de radus dan heb je collision
    if (distance <= radius) {
      platformHitPos = new PVector(rx, ry);
      posBeforeCollision = new PVector(objectX, objectY);
      platformHeight = rh;
      return true;
    } else {
      return false;
    }
  }
}

boolean wallCollider(float objectX, float radius, float wallThickness) {
  if (objectX < wallThickness || objectX > width - wallThickness) {
    return true;
  }
  return false;
}
void swapPlatform(Platform[] input, int index_A, int index_B) {
  Platform temp = input[index_A];

  input[index_A] = input[index_B];
  input[index_B] = temp;
}
void swapPVector(PVector[] input, int index_A, int index_B) {
  PVector temp = input[index_A];

  input[index_A] = input[index_B];
  input[index_B] = temp;
}
