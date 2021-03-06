//Ömer
class Sword {
  CollisionHandler collisionHandler;
  //variables
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
  int damageNum = 1000;
  int timer = 60;
  int damageTimer = 60;
  int scoreCount = 0;
  int score2Count = 100;
  int Animation = 10;
  int Animation2 = 0;
  int timeDmg = 0;
  int dragonposY = 2;
  int swordXpos = 650;
  int swordYpos = 1152;
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
  float posPlayerX = 10;
  float posPlayerY = 40;
  float swordinvPos = 1.2;
  float extendswordpos = 5;
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

    if (waterBottle.pickedUp && pickedUp || schild.pickedUp && pickedUp) {
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

    //wanneer je het zwaard oppakt en als je op s klikt dan wordt de zwaard geactiveerd
    if (swordW == 0 && swordH == 0 && keysPressed['S'] && !swordOff && cooldown == 0) {
      swordOn = true;
    }

    //wanneer je het zwaard oppakt 
    if (pickedUp && dragon.fight) {
      durabillity = durablillityFight;
    }

    //hier wordt de zwaard gereset
    if (reset) { 
      reset();
      timedReset = false;
      reset = false;
    }


   

     //als je op s drukt en oppakt dan kan je slaan met het zwaard
    if (keysPressed['S'] && pickedUp) {
      attacked = true;
      attack();
    }
    
    if (newPos) {
      swordX = spawnPointsPUPS.location.x;
      swordY = spawnPointsPUPS.location.y;
      newPos = false;
    }
    
    if (!doneDamage) {
      dragonX = dragon.startx;
      dragonY = dragon.starty;
      damageOpacity = damageNum;
    }
    //hier wordt er damage gedaan aan de draak
    if (doneDamage) {
      fill(damage, sword.damageOpacity);
      text("-1000", sword.dragonX, sword.dragonY);
      dragonX++;
      dragonY += dragonposY;
      damageOpacity--;
      timerDamage++;
    }
    
    //hier wordt er geen damage gedaan
    if (timerDamage >= timer) {
      doneDamage = false;
      timerDamage = timeDmg;
    }

    //hier wordt de damage gefixed daarna wordt de damagefixtimer increment
    if (fastDamageFix) {
      damageFixTimer++;
    }

    //wanneer 0 groter of gelijk aan 60 is dan wordt the damage niet gefixed
    if (damageFixTimer >= damageTimer) {
      fastDamageFix = false;
    }
     
     //hier wordt de score van het zwaard getelt
    if (seeScoreSword) {
      scoreSwordCount--;
    }
       
       //hier zie je de punten wanneer je het zwaard oppakt
    if (scoreSwordCount < scoreCount) {
      seeScoreSword = false;
      scoreSwordCount = score2Count;
    }
    
    //hier wordt er aangevallen met het zwaard en de animatie wordt aangegeven
    if (attacked) {
      stabAnimation++;
    }
    
    //wanneer je slaat met het zwaard dan komt er een animatie
    if (stabAnimation >= Animation) {
      attacked = false;
      stabAnimation = Animation2;
    }
  }

  void draw() {
    fill(255);
    rectMode(CENTER);
    ellipseMode(CENTER);
    image(inventory.swordIOutline, swordX, swordY, swordW * swordinvPos, swordH * swordinvPos);
    image(inventory.swordI, swordX, swordY, swordW, swordH);
    
    //hier kan je het zwaard zien en je kan de punten zien wanneer je het zwaard pakt
    if (seeScoreSword) {
      fill(255);
      textSize(30);
      text("+ 50", player.posPlayer.x - posPlayerX, player.posPlayer.y - posPlayerY);
    }
  }

  //hier kan je slaan met de zwaard en krijgt de draak damage
  void attack() {    
    collisionHandler.checkCollisionDragon(player.posPlayer.x, player.posPlayer.y - extendSword, extendswordpos);
    hasCollision = collisionHandler.hitDragon;
    if (hasCollision && !fastDamageFix) {
      doneDamage = true;
    }
    //hier krijgt de draak dmg wanneer je met de zwaard slaat
    if (doneDamage) {
      dragon.healthbarDragon.doDamageDragon(1);
      fastDamageFix = true;
    }
  }

  //wanneer je het zwaard verliest dan wordt het gereset
  void reset() {
    newPos = true;
    swordX = swordXpos;
    swordY = swordYpos;
    image(inventory.swordI, swordX, swordY, swordW, swordH);
    swordOn = false;
    pickedUp = false;
  }
}
