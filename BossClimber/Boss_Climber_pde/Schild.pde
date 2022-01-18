//Ömer, Tristan
class Schild {
  CollisionHandler collisionHandler;
  PVector schildPos = spawnPointsPUPS.upperL;
  PVector schildSize = new PVector(25, 30);
  PVector timerSD;
  final float GRAVITYSchild;
  boolean schildOn = false;
  boolean spawnSchild = false;
  boolean schildActivated = false;
  boolean FlamethrowerJumping = false;
  float LevelMoveAmountCurrent = 0;
  float LevelMoveAmountNext = 1;
  float schildLevens = 1;
  boolean NewPos = false;
  boolean pickedUp = false;
  boolean hit = false;
  float hitTimer = 0;
  boolean reset = false;
  boolean livesSet = false;
  boolean fight = false;
  boolean ResetReset = false;
  boolean timedReset = false;
  boolean seeScoreShield = false;
  float schildSaveLevens = schildLevens;
  float schildScoreCount = 100;
  int shieldScore = 50;
  final float TEXT_SIZE = 30;
  PVector seeScoreDistance = new PVector(10, 40);

  Schild() {
    GRAVITYSchild = 0.98;
    timerSD = new PVector(0, 0);
    collisionHandler = new CollisionHandler();
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
    //if(dragon.fight && !pickedUp && !fight) {
    //schildPos = spawnPointsPUPS.fightR;
    //fight = true;
    //}

    if (dragon.fight && !fight) {
      pickedUp = false;
      fight = true;
    }

    if (waterBottle.pickedUp /*&& !ResetReset*/ && pickedUp /*|| Doublejump.pickedUp && !ResetReset */ || sword.pickedUp && /*!ResetReset &&*/ pickedUp) {
      healthbar.shieldDamage = false;
      pickedUp = false;
      //reset = true;
      reset();
      schildActivated = false;
      //timedReset = true;
      ResetReset = true;
    }

    //if (!waterfles.pickedUp && !Doublejump.pickedUp && !sword.pickedUp) {
    //  pickedUp = false;
    //  ResetReset = false;
    //}

    collisionHandler.checkCollisionPlayer(schildPos.x, schildPos.y, schildSize.y);

    if (!dragon.fight) {
      if (collisionHandler.hitPlayer) {
        pickedUp = true;
        health.invincibleB = true;
        livesSet = true;
        schildActivated = true;
        schildPos.x = width * 2;
        schildPos.y = height * 2;
        fight = false;
        seeScoreShield = true;
        scoreHandler.score += shieldScore;
      }
    }

    if (livesSet) {
      schildLevens = schildSaveLevens;
      livesSet = false;
    }

    //if (schildSize.x == 0 && schildSize.y == 0 && keysPressed['S'] && !schildActivated) {
    //  schildOn = false;
    //  schildActivated = true;
    //}
    if (!FlamethrowerJumping) {
      schildSaveLevens = schildLevens;
    }

    if (schildActivated && flamethrower.hasCollision) {
      schildLevens = schildSaveLevens;
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

    if (platforms.moveAmount == LevelMoveAmountNext) {
      FlamethrowerJumping = false;
    }
    if (NewPos) {
      //schildPos = spawnPointsPUPS.location;
      //schildPos.x = random(100, 700);
      //schildPos.y = random(0, 200);
      NewPos = false;
    }

    if (schildActivated) {
      health.invincibleB = true;
    }

    if (schildLevens == 0) { //|| reset && !pickedUp /*&& !Doublejump.pickedUp && !sword.pickedUp && !waterfles.pickedUp*/) {
      health.invincibleB = false;
      reset();
      timedReset = false;
    }
    //if (timedReset) {
    // delay (5000);
    // reset();
    // reset = false;
    // fight = false;
    // timedReset = false;
    //}

    if (seeScoreShield) {
      schildScoreCount--;
    }

    if (schildScoreCount < 0) {
      seeScoreShield = false;
      schildScoreCount = 100;
    }
  }

  void draw() {
    SchildEq();
    //schildPos.y += GRAVITYSchild;
    fill(255, 0, 0);
    ellipseMode(CENTER);
    //fill(255,255,0,240);
    //ellipse(schildPos.x - 0.5, schildPos.y, schildSize.y * 1.2, schildSize.y * 1.2);
    image(inventory.shieldOutline, schildPos.x, schildPos.y, schildSize.x * 1.2, schildSize.y  * 1.2);
    image(inventory.shieldF, schildPos.x, schildPos.y, schildSize.x, schildSize.y);
    //rect(schildPos.x, schildPos.y, schildSize.x, schildSize.y);

    if (seeScoreShield) {
      fill(white);
      textSize(TEXT_SIZE);
      text("+ 50", player.posPlayer.x - seeScoreDistance.x, player.posPlayer.y - seeScoreDistance.y);

      if (seeScoreShield) {
        fill(255);
        textSize(30);
        text("+ 50", player.posPlayer.x - 10, player.posPlayer.y - 40);
      }
    }
  }
  void reset() {
    ResetReset = false;
    NewPos = true;
    schildLevens = 1;
    image(inventory.shieldF, schildPos.x, schildPos.y, schildSize.x, schildSize.y);
    schildPos = spawnPointsPUPS.location;
    FlamethrowerJumping = false;
    schildActivated = false;
    pickedUp = false;
    reset = false;
  }
}
