class Waterfles {
  float flesX = spawnPointsPUPS.underR.x, flesY = spawnPointsPUPS.underR.y, flesB, flesH, resetFlesX, resetFlesY;
  boolean druppelOn = false;
  boolean spawnWaterfles = false;
  boolean druppelOff = false;
  boolean pickedUp = false; //Needed for inventory
  boolean catchWaterfles = true;
  boolean reset = false;

  Waterfles() {
    //flesX = random(200, 600);
    //flesY = random(0, 600);
    flesB = 20;
    flesH = 20;
    //resetFlesX = random(200, 600);
    //resetFlesY = random(200, 600);
  }

  void updateWaterfles() {
    if (schild.pickedUp || Doublejump.pickedUp) {
      pickedUp = false;
      reset = true;
    }
    if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, flesX, flesY, flesB, flesH)) {//Collision player & waterfles
      flesB = 0;
      flesH = 0;
      pickedUp = true;
      scoreHandler.score((int)random(10, 30));
    }
    if (reset) {
     resetWaterfles();
     reset = false;
    }
  }

  void resetWaterfles() {//Reset nieuwe waterfles
    flesX = spawnPointsPUPS.location.x;
    flesY = spawnPointsPUPS.location.y;
    flesB = 10;
    flesH = 40;
    druppels.posPlayer.x = player.posPlayer.x;
    druppels.posPlayer.y = player.posPlayer.y;
    druppels.hasCollision = false;
  }

  void draw() {
    fill(0, 0, 255);
    image(inventory.waterflesI, flesX, flesY, flesB, flesH);
    //rect(flesX, flesY, flesB, flesH);
  }
}
