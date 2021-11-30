class Sword {
  float swordX, swordY, swordW, swordH;
  float guardW, guardH;
  float durabillity = 3;
  float durablillityFight = 9;
  float durabillityStart = 3;
  boolean NewPos = false;
  public boolean pickedUp = false;
  boolean swordOn = false;
  boolean spawnSword = false;
  boolean swordOff = false;
  boolean hasCollision = false;
  float extendSword = 60;
  boolean attacked = false;

  Sword() {
    swordX = random(100, 400);
    swordY = random(100, 300);
    swordW = 5;
    swordH = 60;
    durabillity = durabillityStart;

    guardW = 20;
    guardH = 5;
  }
  
  void setup() {
    HealthbarDragon = new HealthBarDragon(dragon.healthbarPos.x,dragon.healthbarPos.y, 250 , 10);
  }

  void updateSword() {
    if (waterfles.pickedUp || schild.pickedUp || Doublejump.pickedUp) {
      pickedUp = false;
    }
    if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, swordX, swordY, swordW, swordH)) {
      swordW = 0;
      swordH = 0;
      pickedUp = true;
    }

    if (swordW == 0 && swordH == 0 && keysPressed['S'] && !swordOff && cooldown == 0) {
      swordOn = true;
    }

    if (pickedUp && dragon.fight) {
      durabillity = durablillityFight;
    }
  }

  void draw() {
    fill(255);
    rectMode(CENTER);
    image(inventory.swordI, swordX, swordY, swordW, swordH);
    //rect(swordX, swordY, swordW, swordH);
    //rect(swordX, swordY + 15, guardW, guardH);
  }
  
  void attack() {
    collisionHandler.checkCollisionDragon(player.posPlayer.x, player.posPlayer.y+extendSword, 5);
    hasCollision = collisionHandler.hitDragon;
    if (hasCollision) {
      HealthbarDragon.doDamageDragon(1);
    }
  }
  
  void reset() {
    NewPos = false;
    image(inventory.swordI, swordX, swordY, swordW, swordH);
    swordOn = false;
    pickedUp = false;

  }
  
}
