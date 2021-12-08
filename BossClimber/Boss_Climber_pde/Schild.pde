//Ömer, Tristan
class Schild {
  PVector schildPos = spawnPointsPUPS.upperL;
  PVector schildSize = new PVector(35, 40);
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
  boolean reset = false;
  boolean livesSet = false;
  boolean fight = false;
  boolean ResetReset = false;
  boolean timedReset = false;

  Schild() {
    GRAVITYSchild = 0.98;
    timerSD = new PVector(0, 0);
  }

  void SchildEq() {
    //if (schildOn && !schildActivated) {
    //  timerSD.x++;
    //}
    //if (timerSD.x == 900) {
    //  timerSD.x = 0;
    //  schildOn = false;
    //}
    //if (!schildOn && !schildActivated) {
    //  timerSD.y++;
    //}
    //if (timerSD.y == 900) {
    //  reset();
    //  timerSD.y = 0;
    //}
  }

  void update() {
    if(dragon.fight && !pickedUp && !fight) {
      schildPos = spawnPointsPUPS.fightR;
      fight = true;
    }
    
    if (waterfles.pickedUp && !ResetReset /*|| Doublejump.pickedUp && !ResetReset*/ || sword.pickedUp && !ResetReset) {
      pickedUp = false;
      reset = true;
      timedReset = true;
      ResetReset = true;
    }
    
    if (!waterfles.pickedUp && !Doublejump.pickedUp && !sword.pickedUp) {
      pickedUp = false;
      ResetReset = false;
    }

    collisionHandler.checkCollisionPlayer(schildPos.x, schildPos.y, schildSize.y);
    if (collisionHandler.hitPlayer) {
      pickedUp = true;
      livesSet = true;
      schildPos.x = width * 2;
      schildPos.y = height * 2;
      fight = false;
    }

    if (livesSet) {
      schildLevens = 3;
      livesSet = false;
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
    }

    //if (reset) {
    //  reset(); 
    //  reset = false;
    //}

    //if (platforms.moveAmount == LevelMoveAmountNext) {
    //  FlamethrowerJumping = false;
    //}
    if (NewPos) {
      //schildPos = spawnPointsPUPS.location;
      //schildPos.x = random(100, 700);
      //schildPos.y = random(0, 200);
      NewPos = false;
    }

    if (schildActivated) {
      health.invincibleB = true;
    }

    if (schildLevens == 0 || reset && !schild.pickedUp && !Doublejump.pickedUp && !sword.pickedUp && !waterfles.pickedUp) {
      health.invincibleB = false;
      reset();
      timedReset = false;
      reset = false;
    }
    //if (timedReset) {
    // delay (5000);
    // reset();
    // reset = false;
    // fight = false;
    // timedReset = false;
    //}
  }

  void draw() {
    SchildEq();
    //schildPos.y += GRAVITYSchild;
    fill(255, 0, 0);
    image(inventory.shieldF, schildPos.x, schildPos.y, schildSize.x, schildSize.y);
    //rect(schildPos.x, schildPos.y, schildSize.x, schildSize.y);
  }

  void reset() {
    NewPos = true;
    schildLevens = 3;
    image(inventory.shieldF, schildPos.x, schildPos.y, schildSize.x, schildSize.y);
    schildPos = spawnPointsPUPS.location;
    schildActivated = false;
    pickedUp = false;
  }
}
