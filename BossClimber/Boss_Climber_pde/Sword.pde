//Ömer
class Sword {
  CollisionHandler collisionHandler;
  float swordX = spawnPointsPUPS.underL.x, swordY = spawnPointsPUPS.underL.y, swordW, swordH;
  float guardW, guardH;
  float durabillity = 3;
  float durablillityFight = 9;
  float durabillityStart = 3;
  boolean newPos = false;
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
  float dragonX = 0;
  float dragonY = 0;
  boolean doneDamage = false;
  boolean fastDamageFix = true;
  float timerDamage = 0;
  float damageFixTimer = 0;
  color damage = #FFFFFF;
  float damageOpacity = 1000;

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
    collisionHandler = new CollisionHandler();
    HealthbarDragon = new HealthBarDragon(dragon.healthbarPos.x, dragon.healthbarPos.y, 250, 10);
  }

  void updateSword() {
    if (dragon.fight && !pickedUp && !fight) {
      swordX = spawnPointsPUPS.fightL.x;
      swordY = spawnPointsPUPS.fightL.y;
      fight = true;
    }

    if (waterfles.pickedUp && pickedUp || schild.pickedUp && pickedUp /*|| Doublejump.pickedUp*/) {
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

    if (reset && !schild.pickedUp /*&& !Doublejump.pickedUp*/ && !sword.pickedUp && !waterfles.pickedUp) {
      reset();
      timedReset = false;
      reset = false;
    }


    //if (attacked && swordOn) {
    //  attack();
    //}

    if (keysPressed['S'] && pickedUp) {
      attacked = true;
      attack();
    }
    //if (timedReset) {
    // delay (5000);
    // reset();
    // reset = false;
    // fight = false;
    // timedReset = false;
    //}
    if (newPos) {
      swordX = spawnPointsPUPS.location.x;
      swordY = spawnPointsPUPS.location.y;
      newPos = false;
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
    if (!doneDamage) {
    dragonX = dragon.startx;
    dragonY = dragon.starty;
    damageOpacity = 1000;
    }
    if (doneDamage) {
      dragonX++;
      dragonY += 2;
      damageOpacity--;
      timerDamage++;
    }
    if (timerDamage >= 60) {
      doneDamage = false;
      timerDamage = 0;
    }
    
    if (fastDamageFix) {
      damageFixTimer++;
    }
    
    if (damageFixTimer >= 60) {
      fastDamageFix = false;
    }
    
    collisionHandler.checkCollisionDragon(player.posPlayer.x, player.posPlayer.y - extendSword, 5);
    hasCollision = collisionHandler.hitDragon;
    if (hasCollision && !fastDamageFix) {
      doneDamage = true;
      fill(damage, damageOpacity);
      text("-1", dragonX, dragonY);
      HealthbarDragon.doDamageDragon(1);
      fastDamageFix = true;
    }
    attacked = false;
  }

  void reset() {
    newPos = true;
    image(inventory.swordI, swordX, swordY, swordW, swordH);
    swordOn = false;
    pickedUp = false;
  }
}
