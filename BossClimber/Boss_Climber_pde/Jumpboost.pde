class Jumpboost {
  //variable
  Cube[] cube = new Cube[2];
  PVector timerJB = new PVector(0, 0);
  boolean pickedUp = false;
  boolean hasCollision = false;




  void setup() {
    cube[0] = new Cube();
  }
  void item() {
    cube[0].draw();
  }



  //void collect() {
  // if (pla.posPlayer.x - pla.sizePlayer.x / 2 < cube[0].Location.x + cube[0].sizePowerup.x / 2 &&
  // pla.posPlayer.y - pla.sizePlayer.y / 2 < cube[0].Location.y + cube[0].sizePowerup.y / 2 &&
  // pla.posPlayer.x + pla.sizePlayer.x / 2 > cube[0].Location.x - cube[0].sizePowerup.x / 2 &&
  // pla.posPlayer.y + pla.sizePlayer.y / 2 > cube[0].Location.y - cube[0].sizePowerup.y / 2) {
  // pickedUp = true;
  // }
  //}



  void update() {
    collisionHandler.checkCollision(cube[0].X, cube[0].Y, cube[0].Size);
    {
      hasCollision = collisionHandler.hit;
      if (hasCollision == false) {
        pickedUp = true;
      }
    }
  }



  void jumpboostEq() {
    if (pickedUp) {
      player.velocity.y = -10;
      cube[0].Location = new PVector(width * 2, height * 2);
      cube[0].GRAVITYJB = 0;
      timerJB.x++;
      println(timerJB.x);
    }
    if (timerJB.x == 600) {
      println("hoi");
      player.velocity.y = -5;
      timerJB.x = 0;
      pickedUp = false;
    }
    if (!pickedUp) {
      timerJB.y++;
      println(timerJB.y);
    }
    if (timerJB.y == 600) {
      cube[0].reset();
      timerJB.y = 0;
    }
  }
}



class Cube {
  PVector Location = new PVector(200, 200);
  PVector sizePowerup = new PVector(50, 50);
  float GRAVITYJB = 0.98;
  float X, Y, Size = 50;
  void draw() {
    GRAVITYJB = 0.98;
    Location.y += GRAVITYJB;
    rect(Location.x, Location.y, sizePowerup.x, sizePowerup.y);
    X = Location.x;
    Y = Location.y;
    Size = 50;
  }



  void reset() {
    Location = new PVector(200, 200);
    rect(Location.x, Location.y, sizePowerup.x, sizePowerup.y);
  }
}
