//Ömer
class Sword {
  CollisionHandler collisionHandler;
  float swordX = width * 2, swordY = height * 2, swordW, swordH;
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
  boolean swordPickedUp = false;
  boolean timedReset = false;
  float dragonX = 0;
  float dragonY = 0;
  boolean doneDamage = false;
  boolean fastDamageFix = true;
  float timerDamage = 0;
  float damageFixTimer = 0;
  color damage = #FF0000;
  float damageOpacity = 1000;
  boolean seeScoreSword = false;
  float scoreSwordCount = 100;
  int swordScore = 50;
  PImage swordStab;
  float stabAnimation = 0;

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
    swordStab = loadImage("Knight - Sword attack.png");
  }

  void updateSword() {
    if (!dragon.fight) {
      swordX = width * 2;
      swordY = height * 2;
    }

    if (dragon.fight && !pickedUp && !swordPickedUp) {
      swordX = spawnPointsPUPS.fightR.x;
      swordY = spawnPointsPUPS.fightR.y;
      swordPickedUp = true;
    }

    if (waterfles.pickedUp && pickedUp || schild.pickedUp && pickedUp /*|| Doublejump.pickedUp*/) {
      pickedUp = false;
      reset = true;
      timedReset = true;
    }

    if (!schild.pickedUp) {
      if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, swordX, swordY, swordW, swordH)) {
        swordX = width * 2;
        swordY = height * 2;
        pickedUp = true;
        swordPickedUp = false;
        seeScoreSword = true;
        scoreHandler.score += swordScore;
      }
    }

    if (swordW == 0 && swordH == 0 && keysPressed['S'] && !swordOff && cooldown == 0) {
      swordOn = true;
    }

    if (pickedUp && dragon.fight) {
      durabillity = durablillityFight;
    }

    if (reset) { //&& !schild.pickedUp /*&& !Doublejump.pickedUp*/ && !sword.pickedUp && !waterfles.pickedUp) {
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
    if (!doneDamage) {
      dragonX = dragon.startx;
      dragonY = dragon.starty;
      damageOpacity = 1000;
    }
    if (doneDamage) {
      fill(damage, sword.damageOpacity);
      text("-1000", sword.dragonX, sword.dragonY);
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

    if (seeScoreSword) {
      scoreSwordCount--;
    }

    if (scoreSwordCount < 0) {
      seeScoreSword = false;
      scoreSwordCount = 100;
    }
    if (attacked) {
      stabAnimation++;
    }
    if (stabAnimation >= 10) {
      attacked = false;
      stabAnimation = 0;
    }
  }

  void draw() {
    fill(255);
    rectMode(CENTER);
    image(inventory.swordI, swordX, swordY, swordW, swordH);
    //rect(swordX, swordY, swordW, swordH);
    //rect(swordX, swordY + 15, guardW, guardH);

    if (seeScoreSword) {
      fill(255);
      textSize(30);
      text("+ 50", player.posPlayer.x - 10, player.posPlayer.y - 40);
    }
  }

  void attack() {    
    collisionHandler.checkCollisionDragon(player.posPlayer.x, player.posPlayer.y - extendSword, 5);
    hasCollision = collisionHandler.hitDragon;
    if (hasCollision && !fastDamageFix) {
      doneDamage = true;
    }
    if (doneDamage) {
      dragon.healthbarDragon.doDamageDragon(1);
      fastDamageFix = true;
    }
  }

  void reset() {
    newPos = true;
    swordX = 650;
    swordY = 1152;
    image(inventory.swordI, swordX, swordY, swordW, swordH);
    swordOn = false;
    pickedUp = false;
  }
}
