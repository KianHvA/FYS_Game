class Waterfles {
  float flesX, flesY, flesB, flesH, resetFlesX, resetFlesY;
  boolean druppelOn = false;
  boolean spawnWaterfles = false;
  boolean druppelOff = false;
  boolean pickedUp = false; //Needed for inventory
  boolean catchWaterfles = true;

  Waterfles() {
    flesX = random(200, 600);
    flesY = random(0, 600);
    flesB = 20;
    flesH = 20;
    resetFlesX = random(200, 600);
    resetFlesY = random(200, 600);
  }

  void updateWaterfles() {
    if (schild.pickedUp || Doublejump.pickedUp) {
      pickedUp = false;
    }
    if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, flesX, flesY, flesB, flesH)) {//Collision player & waterfles
      flesB = 0;
      flesH = 0;
      pickedUp = true;
      scoreHandler.score((int)random(10, 30));
    }

    if (pickedUp == true && keysPressed['S'] && cooldown == 0) {//Schiet waterfles
      druppelOn = true;
    }
  }

  void resetWaterfles() {//Reset nieuwe waterfles
    flesX = random(200, 600);
    flesY = random(0, 600);
    flesB = 10;
    flesH = 40;
    druppels.startX = player.posPlayer.x;
    druppels.startY = player.posPlayer.y;
  }

  void draw() {
    fill(0, 0, 255);
    image(inventory.waterflesI, flesX, flesY, flesB, flesH);
    //rect(flesX, flesY, flesB, flesH);
  }
}
