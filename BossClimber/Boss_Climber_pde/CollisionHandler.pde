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
  boolean hitWallLeft = false;
  boolean hitWallRight = false;
  boolean hitPlayer = false;
  boolean hitDragon = false;
  boolean hitLadder = false;
  boolean hitUndersidePlatform = false;

  float closestDistance;
  PVector closestHitPos;
  PVector platformHitPos;
  float platformHeight;
  PVector posBeforeCollision;

  int wallThickness = width/12;

  //object met player collision
  void checkCollisionPlayer(float objectX, float objectY, float objectRadius) {
    hitPlayer = circleRect(objectX, objectY, objectRadius, player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, player.sizePlayer.y);
  }
  //object met Dragon collision
  void checkCollisionDragon(float objectX, float objectY, float objectRadius) {
    hitDragon = circleRect(objectX, objectY, objectRadius, dragon.startx, dragon.starty, dragon.diameter.y, dragon.diameter.y);
  }

  //Object met platform collision
  void checkCollision(float objectX, float objectY, float objectRadius)
  {
    if (polyCircle(platforms.vertexesL, objectX, objectY, objectRadius) || polyCircle(platforms.vertexesR, objectX, objectY, objectRadius))
    {
      hit = true;
    } else {
      hit = false;
    }

    hitWallLeft = wallColliderLeft(objectX, objectRadius, wallThickness); //check collision with left wall
    hitWallRight = wallColliderRight(objectX, objectRadius, wallThickness); //chack collision with right wall
  }

  // POLYGON/CIRCLE
  boolean polyCircle(PVector[] vertices, float cx, float cy, float r) {

    // go through each of the vertices
    // and the next vertex in the list
    int next = 0;
    closestDistance = 0;
    for (int current=0; current < vertices.length; current++) {

      next = current+1;
      if (next == vertices.length) next = 0;

      PVector vc = vertices[current];
      rectMode(CENTER);
      PVector vn = vertices[next];
      //ellipseMode(CENTER);
      //circle(vc.x, vc.y, 10);
      //if (calculateDistance(vc.x, vc.y, cx, cy) > 500 || calculateDistance(vn.x, vn.y, cx, cy) > 500) {
      //  continue;
      //}
      boolean collision = lineCircle(vc.x, vc.y, vn.x, vn.y, cx, cy, r);
      if (collision) return true;
    }

    //boolean centerInside = polygonPoint(vertices, cx, cy);
    //if (centerInside) return true;

    return false;
  }

  // LINE/CIRCLE //<>//
  boolean lineCircle(float x1, float y1, float x2, float y2, float cx, float cy, float r) {

    boolean inside1 = pointCircle(x1, y1, cx, cy, r); //<>//
    boolean inside2 = pointCircle(x2, y2, cx, cy, r);
    if (inside1 || inside2) return true;

    // get length of the line
    float distX = x1 - x2;
    float distY = y1 - y2;
    float len = sqrt( (distX*distX) + (distY*distY) );

    float dot = ( ((cx-x1)*(x2-x1)) + ((cy-y1)*(y2-y1)) ) / pow(len, 2);

    float closestX = x1 + (dot * (x2-x1));
    float closestY = y1 + (dot * (y2-y1));
    platformHeight = 10;

    boolean onSegment = linePoint(x1, y1, x2, y2, closestX, closestY);
    if (!onSegment) return false;


    fill(255, 0, 0);
    noStroke();

    platformHitPos = new PVector(closestX, closestY);
    // get distance to closest point
    distX = closestX - cx;
    distY = closestY - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    if (distance > closestDistance) {
      closestDistance = distance; 
      closestHitPos = new PVector(closestX, cy - r/2);
      platformHitPos = closestHitPos;
    }
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
    if (distance <= r) {
      return true;
    }
    return false;
  }


  //CIRCLE/CIRCLE
  boolean circleCircle(float circleX, float circleY, float circleDia, float oCircleX, float oCircleY, float oCircleDia) {
    float afstX = circleX - oCircleX;
    float afstY = circleY - oCircleY;
    float afstand = ( (afstX * afstX) + (afstY * afstY) );

    if (afstand <= circleDia + oCircleDia) {
      return true;
    }
    return false;
  }


  // POLYGON/POINT
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

      PVector vc = vertices[current];
      PVector vn = vertices[next];

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

    if (objectX < rx-rw/2) { // compare left edge
      testX = rx-rw/2;
    } else if (objectX > rx+rw/2) {// right edge
      testX = rx+rw/2;
    }  
    if (objectY < ry) {// top edge
      testY = ry;
    } else if (objectY > ry+rh) { // bottom objectX edge
      testY = ry+rh;
    }   

    float distX = objectX-testX;
    float distY = objectY-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    if (distance <= radius) {
      platformHitPos = new PVector(rx, ry);
      posBeforeCollision = new PVector(objectX, objectY);
      platformHeight = rh;
      return true;
    } else {
      return false;
    }
  }


  boolean wallColliderLeft(float objectX, float radius, float wallThickness) {
    if (objectX - radius < wallThickness) {
      return true;
    }
    return false;
  }
  boolean wallColliderRight(float objectX, float radius, float wallThickness) {
    if (objectX + radius > width - wallThickness) {
      return true;
    }
    return false;
  }

  double calculateDistance(
    double x1, 
    double y1, 
    double x2, 
    double y2) {

    double ac = Math.abs(y2 - y1);
    double cb = Math.abs(x2 - x1);

    return Math.hypot(ac, cb);
  }
}
