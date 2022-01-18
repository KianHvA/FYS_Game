//Ömer, Tristan
class Schild {
  CollisionHandler collisionHandler;
  PVector schildPos = spawnPointsPUPS.upperL;
  PVector schildSize = new PVector(25, 30);
  final float TEXT_SIZE = 30;
  PVector seeScoreDistance = new PVector(10, 40);
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
  int incrementNum = 1;
  int posPlayerDecrease = 15;
  int posPlayernumLess = 0;
  int AantalLevensschild = 0;
  int scoreCountLess = 0;
  int scoreCount = 100;
  float Gravity = 0.98;
  float levensReset = 1;
  float posPlayerX = 10;
  float posPlayerY = 40;
  float schildinventoryco = 1.2;

  Schild() {
    GRAVITYSchild = Gravity;
    timerSD = new PVector(0, 0);
    collisionHandler = new CollisionHandler();
  }

  void SchildEq() {
    
  }

  void update() {
   

    if (dragon.fight && !fight) {
      pickedUp = false;
      fight = true;
    }

    if (waterBottle.pickedUp && pickedUp  || sword.pickedUp &&  pickedUp) {
      healthbar.shieldDamage = false;
      pickedUp = false;
      reset();
      schildActivated = false;
      ResetReset = true;
    }


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

  
    if (!FlamethrowerJumping) {
      schildSaveLevens = schildLevens;
    }

    if (schildActivated && flamethrower.hasCollision) {
      schildLevens = schildSaveLevens;
      FlamethrowerJumping = true;
      LevelMoveAmountCurrent = platforms.moveAmount;
      LevelMoveAmountNext = LevelMoveAmountCurrent + incrementNum;
    }


    if (FlamethrowerJumping) {
      player.posPlayer.y -= posPlayerDecrease;
      if (player.posPlayer.y < posPlayernumLess) {
        FlamethrowerJumping = false;
      }
    }

  

    if (platforms.moveAmount == LevelMoveAmountNext) {
      FlamethrowerJumping = false;
    }
    if (NewPos) {
     
      NewPos = false;
    }

     //wanneer je het schild oppakt dan wordt het schild geactiveerd
    if (schildActivated) {
      health.invincibleB = true;
    }

    //wanneer het schild kapot wordt gemaakt dan gaat het schild weg
    if (schildLevens == AantalLevensschild) { 
      health.invincibleB = false;
      reset();
      timedReset = false;
    }
    

    if (seeScoreShield) {
      schildScoreCount--;
    }

    if (schildScoreCount < scoreCountLess) {
      seeScoreShield = false;
      schildScoreCount = scoreCount;
    }
  }

  void draw() {
    SchildEq();
    fill(255, 0, 0);
    ellipseMode(CENTER);
    image(inventory.shieldOutline, schildPos.x, schildPos.y, schildSize.x * schildinventoryco, schildSize.y  * schildinventoryco);
    image(inventory.shieldF, schildPos.x, schildPos.y, schildSize.x, schildSize.y);
    if (seeScoreShield) {
      fill(255);
      textSize(30);
      text("+ 50", player.posPlayer.x - posPlayerX, player.posPlayer.y - posPlayerY);
    }
  }

  void reset() {
    ResetReset = false;
    NewPos = true;
    schildLevens = levensReset;
    image(inventory.shieldF, schildPos.x, schildPos.y, schildSize.x, schildSize.y);
    schildPos = spawnPointsPUPS.location;
    FlamethrowerJumping = false;
    schildActivated = false;
    pickedUp = false;
    reset = false;
  }
}
