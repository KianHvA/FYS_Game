class Jumpboost {
  PVector timerJB = new PVector(0, 0);
  boolean pickedUp = false;
  boolean hasCollision = false;
  PVector Location = new PVector(200, 200);
  PVector sizePowerup = new PVector(50, 50);
  float GRAVITYJB = 0.98;
  float size = 50;



  void setup() {
  }
  void item() {
    draw();
  }
  void draw() {
    jumpboostEq();
    GRAVITYJB = 0.98;
    Location.y += GRAVITYJB;
    rect(Location.x, Location.y, sizePowerup.x, sizePowerup.y);

    size = 50;
  }
  void update() {
    //collisionHandler.checkCollision(Location.x, Location.y, size);
    //{
    //  hasCollision = collisionHandler.hit;
    //  if (hasCollision) {
    //    pickedUp = true;
    //  }
    //}
  }



  void jumpboostEq() {
    if (pickedUp) {
      player.velocity.y = -10;
      Location = new PVector(width * 2, height * 2);
      GRAVITYJB = 0;
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
      reset();
      timerJB.y = 0;
    }
  }
  void reset() {
    Location = new PVector(200, 200);
    rect(Location.x, Location.y, sizePowerup.x, sizePowerup.y);
  }
}
