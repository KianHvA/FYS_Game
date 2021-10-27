class Sword {
  float swordX, swordY, swordW, swordH;
  float guardW, guardH;

  boolean swordOn = false;
  boolean spawnSword = false;
  boolean swordOff = false;

  Sword() {
    swordX = random(100, 400);
    swordY = random(100, 300);
    swordW = 5;
    swordH = 60;

    guardW = 20;
    guardH = 5;
  }

  void updateWaterfles(){
    if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, swordX, swordY, swordW, swordH)){
      swordW = 0;
      swordH = 0;
    }
    
    if (swordW == 0 && swordH == 0 && keysPressed['S'] && !swordOff && cooldown == 0){
      swordOn = true;
    }
  }

  void draw() {
    fill(255);
    rectMode(CENTER);
    rect(swordX, swordY, swordW, swordH);
    rect(swordX, swordY + 15, guardW, guardH);
  }
}
