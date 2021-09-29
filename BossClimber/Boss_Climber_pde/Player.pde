class Player {

  //variables
  PVector posPlayer = new PVector(width/2, height/2);
  PVector sizePlayer = new PVector(20, 40);
  PVector velocity = new PVector(0, 0);
  float gravity = 0.981f;
  boolean hasJumped = false, hasDoubleJumped = false, hasTripleJumped = false, hasDashed = false;

  void player() {
    //modes
    ellipseMode(CENTER);
    rectMode(CENTER);

    //player
    fill(255);
    ellipse(posPlayer.x, posPlayer.y, sizePlayer.x, sizePlayer.y);
  }


  void movementUpdate() {
    //bewegen
    if(!co.hasCollision) {
      velocity.y += gravity;
      }
    posPlayer.x += velocity.x;
    posPlayer.y += velocity.y;
    if (keysPressed[LEFT]) {
      velocity.x = -10;
    } else if (keysPressed[RIGHT]) {
      velocity.x = 10;
    } else if (co.hasCollision && keysPressed[UP]) {
      println(velocity.y);
      velocity.y -= 40;
      co.hasCollision = false;
    } else if (keysPressed[DOWN]) {
      println("hoi");
    } else { 
      velocity.x = 0; 
      velocity.y = 0;
    };
  }
}
