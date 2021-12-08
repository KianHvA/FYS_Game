//Ömer
class Sword {
  float swordX = spawnPointsPUPS.underL.x, swordY = spawnPointsPUPS.underL.y, swordW, swordH;
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
  float extendSword = 10;
  boolean attacked = false;
  boolean reset = false;
  boolean fight = false;
  boolean timedReset = false;

  Sword() {
    //swordX = random(100, 400);
    //swordY = random(100, 300);
    swordW = 5;
    swordH = 60;
    durabillity = durabillityStart;

    guardW = 20;
    guardH = 5;
  }

  void setup() {
    HealthbarDragon = new HealthBarDragon(dragon.healthbarPos.x, dragon.healthbarPos.y, 250, 10);
  }

  void updateSword() {
    if (dragon.fight && !pickedUp && !fight) {
      swordX = spawnPointsPUPS.fightL.x;
      swordY = spawnPointsPUPS.fightL.y;
      fight = true;
    }

    if (waterfles.pickedUp || schild.pickedUp /*|| Doublejump.pickedUp*/) {
      pickedUp = false;
      reset = true;
      timedReset = true;
    }
    if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, swordX, swordY, swordW, swordH)) {
      swordX = width * 2;
      swordY = height * 2;
      pickedUp = true;
      fight = false;
    }

    if (swordW == 0 && swordH == 0 && keysPressed['S'] && !swordOff && cooldown == 0) {
      swordOn = true;
    }

    if (pickedUp && dragon.fight) {
      durabillity = durablillityFight;
    }

    if (reset && !schild.pickedUp && !Doublejump.pickedUp && !sword.pickedUp && !waterfles.pickedUp) {
      reset();
      timedReset = false;
      reset = false;
    }


    if (attacked && swordOn) {
      attack();
    }

    if (keysPressed['S'] && pickedUp) {
      attacked = true;
      println("Active");
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
    fill(255);
    rectMode(CENTER);
    image(inventory.swordI, swordX, swordY, swordW, swordH);
    //rect(swordX, swordY, swordW, swordH);
    //rect(swordX, swordY + 15, guardW, guardH);
  }

  void attack() {
    collisionHandler.checkCollisionDragon(player.posPlayer.x, player.posPlayer.y - extendSword, 5);
    hasCollision = collisionHandler.hitDragon;
    if (hasCollision) {
      HealthbarDragon.doDamageDragon(1);
      println("Damage Dragon");
    }
    attacked = false;
  }

  void reset() {
    NewPos = false;
    image(inventory.swordI, swordX, swordY, swordW, swordH);
    swordOn = false;
    pickedUp = false;
  }
}
