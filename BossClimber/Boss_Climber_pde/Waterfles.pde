//Dion
class Waterfles {
  CollisionHandler collisionHandler;
  Druppel druppel;
  float flesX = spawnPointsPUPS.underR.x, flesY = spawnPointsPUPS.underR.y, flesB, flesH, resetFlesX, resetFlesY, flesScore, flesScoreCount;
  boolean druppelOn = false;
  boolean spawnWaterfles = false;
  boolean druppelOff = false;
  boolean pickedUp = false; //Needed for inventory
  boolean catchWaterfles = true;
  boolean reset = false;
  boolean fight = false;
  boolean timedReset = false;
  boolean seeScoreFles = false;

  Waterfles() {
    collisionHandler = new CollisionHandler();
    druppel = new Druppel();
    //flesX = random(200, 600);
    //flesY = random(0, 600);
    flesB = 20;
    flesH = 20;
    flesScore = 25;
    flesScoreCount = 100;
  }

  void updateWaterfles() {
    if (dragon.fight && !pickedUp && !fight && !druppelOn) {
      if (dragon.fight && !pickedUp && !fight && flesB <= 0 && flesH <= 0) {
        flesX = spawnPointsPUPS.fightM.x;
        flesY = spawnPointsPUPS.fightM.y;
        fight = true;
      }

      if (schild.pickedUp && pickedUp  /*|| Doublejump.pickedUp*/ || sword.pickedUp && pickedUp) {
        pickedUp = false;
        reset = true;
        timedReset = true;
      }
      if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, flesX, flesY, flesB, flesH)) {//Collision player & waterfles
        flesX = width * 2;
        flesY = height * 2;
        pickedUp = true;
        scoreHandler.score += flesScore;
        fight = false;
        seeScoreFles = true;
      }
      if (reset /*&& !schild.pickedUp && !Doublejump.pickedUp && !sword.pickedUp && !pickedUp*/ || druppel.posPlayer.x <= 0 && druppel.posPlayer.y <= 0 || druppel.hasCollision) {
        resetWaterfles();
        fight = false;
        timedReset = false;
        reset = false;
      }

      if (seeScoreFles) {
        flesScoreCount--;
      }

      if (flesScoreCount < 0) {
        seeScoreFles = false;
        flesScoreCount = 100;
      }

      if (sword.swordX == width * 2 && sword.swordY == height *2 && schild.schildPos.x == width *2 && schild.schildPos.y == height * 2 || flesX == width *2 && flesY == height *2 && schild.schildPos.x == width *2 && schild.schildPos.y == height * 2 || flesX == width *2 && flesY == height *2 && sword.swordX == width * 2 && sword.swordY == height *2) {
        reset = true;
        sword.reset = true;
        schild.reset = true;
      }
    }
  }

  void resetWaterfles() {//Reset nieuwe waterfles
    pickedUp = false;
    flesScoreCount = 100;
    if (!dragon.fight) {
      flesX = spawnPointsPUPS.location.x;
      flesY = spawnPointsPUPS.location.y;
    }
    flesB = 20;
    flesH = 20;
    druppels.posPlayer.x = player.posPlayer.x;
    druppels.posPlayer.y = player.posPlayer.y;
    druppels.hasCollision = false;
  }

  void draw() {
    fill(0, 0, 255);
    image(inventory.waterflesI, flesX, flesY, flesB, flesH);

    if (seeScoreFles) {
      fill(255);
      textSize(30);
      text("+ 25", player.posPlayer.x, player.posPlayer.y - 40);
    }
  }
}
