class Schild {
  PVector schildPos = new PVector(random(100, 700), random(0, 200));
  PVector schildSize = new PVector(30, 40);
  PVector timerSD;
  final float GRAVITYSchild;
  boolean schildOn = false;
  boolean spawnSchild = false;
  boolean schildActivated = false;
  boolean FlamethrowerJumping = false;
  float LevelMoveAmountCurrent = 0;
  float LevelMoveAmountNext = 1;
  float schildLevens = 3;
  boolean NewPos = false;
  boolean pickedUp = false;
  boolean hit = false;
  float hitTimer = 0;

  Schild() {
    GRAVITYSchild = 0.98;
    timerSD = new PVector(0, 0);
  }

  void SchildEq() {
    if (schildOn && !schildActivated) {
      timerSD.x++;
    }
    if (timerSD.x == 900) {
      timerSD.x = 0;
      schildOn = false;
    }
    if (!schildOn && !schildActivated) {
      timerSD.y++;
    }
    if (timerSD.y == 900) {
      reset();
      timerSD.y = 0;
    }
  }

  void update() {
    collisionHandler.checkCollisionPlayer(schildPos.x, schildPos.y, schildSize.y);
    if (collisionHandler.hitPlayer) {
      pickedUp = true;
      schildSize.x = 0;
      schildSize.y = 0;
    }

    if (schildSize.x == 0 && schildSize.y == 0 && keysPressed['S'] && !schildActivated) {
      schildOn = false;
      schildActivated = true;
    }
    if (schildActivated && flamethrower.hasCollision) {
      FlamethrowerJumping = true;
      LevelMoveAmountCurrent = platforms.moveAmount;
      LevelMoveAmountNext = LevelMoveAmountCurrent + 1;
    }


    if (FlamethrowerJumping) {
      player.posPlayer.y -= 15;
      if (player.posPlayer.y < 0) {
        FlamethrowerJumping = false;
      }
      println("done");
    }

    //if (platforms.moveAmount == LevelMoveAmountNext) {
    //  FlamethrowerJumping = false;
    //}
    if (NewPos) {
      schildPos.x = random(100, 700);
      schildPos.y = random(0, 200);
      NewPos = false;
    }
    if (schildActivated) {
      println("Active");
      health.invincibleB = true;
    }

    if (schildLevens == 0) {
      health.invincibleB = false;
      reset();
    }
  }

  void draw() {
    SchildEq();
    schildPos.y += GRAVITYSchild;
    fill(255, 0, 0);
    rect(schildPos.x, schildPos.y, schildSize.x);
  }

  void reset() {
    NewPos = true;
    rect(schildPos.x, schildPos.y, schildSize.x, schildSize.y);
    schildActivated = false;
    pickedUp = false;
  }
}
