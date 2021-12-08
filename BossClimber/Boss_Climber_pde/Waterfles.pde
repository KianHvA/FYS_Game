//Dion
class Waterfles {
  float flesX = spawnPointsPUPS.underR.x, flesY = spawnPointsPUPS.underR.y, flesB, flesH, resetFlesX, resetFlesY;
  boolean druppelOn = false;
  boolean spawnWaterfles = false;
  boolean druppelOff = false;
  boolean pickedUp = false; //Needed for inventory
  boolean catchWaterfles = true;
  boolean reset = false;
  boolean fight = false;
  boolean timedReset = false;

  Waterfles() {
    //flesX = random(200, 600);
    //flesY = random(0, 600);
    flesB = 20;
    flesH = 20;
    //resetFlesX = random(200, 600);
    //resetFlesY = random(200, 600);
  }

  void updateWaterfles() {
    if (dragon.fight && !pickedUp && !fight) {
      flesX = spawnPointsPUPS.fightM.x;
      flesY = spawnPointsPUPS.fightM.y;
      fight = true;
    }

    if (schild.pickedUp || /*Doublejump.pickedUp ||*/ sword.pickedUp) {
      pickedUp = false;
      reset = true;
      timedReset = true;
    }
    if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, flesX, flesY, flesB, flesH)) {//Collision player & waterfles
      flesX = width * 2;
      flesY = height * 2;
      pickedUp = true;
      scoreHandler.score((int)random(10, 30));
      fight = false;
    }
    if (reset && !schild.pickedUp && !Doublejump.pickedUp && !sword.pickedUp && !pickedUp) {
      resetWaterfles();
      fight = false;
      timedReset = false;
      reset = false;
    }
    //if (timedReset) {
    //  delay (5000);
    //  resetWaterfles();
    //  reset = false;
    //  fight = false;
    //  timedReset = false;
    //}
  }

  void resetWaterfles() {//Reset nieuwe waterfles
    pickedUp = false;
    flesX = spawnPointsPUPS.location.x;
    flesY = spawnPointsPUPS.location.y;
    flesB = 20;
    flesH = 20;
    druppels.posPlayer.x = player.posPlayer.x;
    druppels.posPlayer.y = player.posPlayer.y;
    druppels.hasCollision = false;
  }

  void draw() {
    fill(255,255,0);
    circle(flesX + flesB/2, flesY + flesB/2, flesB * 1.5);
    fill(0, 0, 255);
    image(inventory.waterflesI, flesX, flesY, flesB, flesH);
    //rect(flesX, flesY, flesB, flesH);
  }
}
