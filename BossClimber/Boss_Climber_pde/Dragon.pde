class Dragon {
  FireBallRain FireballRain;
  bossFight bossFight;
  HealthBarDragon HealthbarDragon;
  int savedTime;
  int totalTime = 1000;
  float startx;
  float starty;
  float diameter;
  String Modus;
  int vliegen;
  float checkCollision;
  boolean a;
  float dragonHealth = 150;
  float dragonHealthS = 150;
  boolean fight = false;
  float fightAmount = 1;
  boolean fireBallRain = false;
  PVector[] vliegPatroon = {new PVector(150, 50), new PVector(600, 50), new PVector(630, 80)};
  PVector[] stageMovePatroon = {new PVector(150, -100), new PVector(400, -200)};
  boolean waterFles = false;
  void setup() {
    bossFight.setup();
  }

  Dragon(float x, float y, float diameter) {
    FireballRain = new FireBallRain();
    bossFight = new bossFight();
    HealthbarDragon = new HealthBarDragon(275, 20, 250, 10);
    this.startx = x;
    this.starty = y;
    this.diameter = diameter;
    startx = x;
    starty = y;
  }

  void draw() {
    stroke(0);
    fill(185, 185, 182);
    rect(startx, starty, diameter, diameter);

    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      savedTime = millis();
      a = true;
    }
    if (a) {
      //ga naar volgende positie in array
      vliegen++;
      if (vliegen >= vliegPatroon.length) {
        vliegen = 0;
      }
      //zet a weer naar false;
      a = false;
    }
    if (fight) {
      HealthbarDragon.draw();
    }
    if(damageDragon && fight) {
      HealthbarDragon.doDamageDragon(20);
     damageDragon = false;
    }
  }


  void update() {
    //if ( platforms.moveAmount < 4 * fightAmount && platforms.moveAmount > 4 * fightAmount) {
    while (player.posPlayer.y > 80) {
      //voer vlieg routine uit

      //1. maak een timer van bvb 5 seconden

      //2. als de timer voorbij is verander de x en y van de draak naar een van de voorgeprogameerde vlieg posities in de array vliegPatroon
      //je kan de variablen in vliegpatronen bereiken door (voorbeeld): startx = vliegPatroon[1].x
      //if(!FireballRain.fireBallRain) {
      startx = lerp(startx, vliegPatroon[vliegen].x, 0.1);
      starty = lerp(starty, vliegPatroon[vliegen].y, 0.1);
      //als de spelers zijn positie kleiner word dan y = 80 dan gebeurt het onderste gedeelte.
      break;
      //}
    }
    //}
    //ga terug naar begin positie
    if (fireBallRain || player.posPlayer.y < 80 && !fight) {
      startx = lerp(startx, stageMovePatroon[0].x, 0.01);
      starty = lerp(starty, stageMovePatroon[0].y, 0.01);
    }
    if (platforms.moveAmount == 1){
    }
    
    if (platforms.moveAmount == 3 * fightAmount) {
      //FireballRain.spawn();
    }
    if (platforms.moveAmount == 4 /* fightAmount*/) {
      bossFight.startFight();
    }
    xDragon = startx;
    yDragon = starty;
    println(platforms.moveAmount);
  }
}

class FireBallRain {
  float startx = xDragon;
  float starty = yDragon;
  PVector[] vliegPatroon = {new PVector(150, 50), new PVector(600, 50), new PVector(630, 80)};
  void spawn() {
    dragon.fireBallRain = true;
    startx = lerp(startx, vliegPatroon[0].x, 0.01);
    starty = lerp(starty, vliegPatroon[0].y, 0.01);
    for (int i = 0; i > fireballs.length; i++) {
      fireballs[i].posFireball.x = 150;
      fireballs[i].posFireball.y = 50;
      fireballs[i].movementUpdate();
      fireballs[i].draw();
    }
  }
}

class bossFight {
  HealthBarDragon HealthbarDragon;
  float startx = xDragon;
  float starty = yDragon;
  PVector[] vliegPatroon = {new PVector(150, 50), new PVector(600, 50), new PVector(630, 80)};
  PVector vliegPatroonF1 = new PVector(400, -100);
  PVector vliegPatroonF2 = new PVector(400, -50);
  PVector vliegPatroonF3 = new PVector(400, 300);
  PVector startVliegPatroon = new PVector(150, 50);
  PVector[] fireBallVliegPatroon = {new PVector(150, 50 + (int)random(0, 10)), new PVector(400, 65 + (int)random(0, 10)), new PVector(650, 40 + (int)random(0, 10))};
  boolean fase1 = true, fase2 = false;
  boolean lava = false;
  boolean sizeShrink = false;
  float timer = 0;
  float timerAmount = 1;
  float fireBallAmount = 2;
  //float length = 5; probeerde een if loop te maken maar kreeg een error on .class terwijl er geen .class is dus ja

  void setup() {
    HealthbarDragon = new HealthBarDragon(275, 20, 250, 10);
  }
  void startFight() {  
    if (fase1) {
      //println(dragon.fight);
      dragon.fight = true;
      fase1 = true;
      dragon.fightAmount = (platforms.moveAmount/4);
      dragon.dragonHealth = dragon.dragonHealthS * (dragon.fightAmount/2);
      startx = lerp(startx, vliegPatroon[0].x, 0.01);
      starty = lerp(starty, vliegPatroon[0].y, 0.01);
      if (!dragon.waterFles) {
        waterfles.flesX = player.posPlayer.x;
        waterfles.flesY = player.posPlayer.y - 20;
        waterfles = new Waterfles();
        dragon.waterFles = true;
      }
      //if (dragon.fight) HealthbarDragon.HealthBar(10, 100, 250, 10);
      onTheWay();
    }
  }

  void onTheWay() {//Draak vliegt naar de achtergrond en schiet vuurballen op de player. Komt later te weinig tijd.
    /*
    if (dragon.dragonHealth < 300 && fase1 && !fase2) {
     startx = lerp(startx, startVliegPatroon.x, 0.01);
     starty = lerp(starty, startVliegPatroon.y, 0.01);
     fase2 = true;
     fase1 = false;
     }
     if (fase2 && startx == 400 && starty < -100) {
     startx = lerp(startx, vliegPatroonF1.x, 0.01);
     starty = lerp(starty, vliegPatroonF1.y, 0.01);
     } else if (fase2 && startx == 400 && starty > -50) {
     startx = lerp(startx, vliegPatroonF2.x, 0.01);
     starty = lerp(starty, vliegPatroonF2.y, 0.01);
     } else if (fase2 && startx == 400 && starty < -60) {
     sizeShrink = true;
     startx = lerp(startx, vliegPatroonF3.x, 0.01);
     starty = lerp(starty, vliegPatroonF3.y, 0.01);
     }
     if (sizeShrink) {
     constrain((int) sizeDragon, 1, 46);
     sizeDragon -= 0.01;
     }
     */
    if (dragon.dragonHealth < 75 * dragon.fightAmount) {
      startx = lerp(startx, fireBallVliegPatroon[0].x, 0.01);
      starty = lerp(starty, fireBallVliegPatroon[0].y, 0.01);
      timer++;
    }
    if (timer == 60 * timerAmount) {
      for (int i = 0; i > fireballs.length * 2; i++) {
      fireballs[i].posFireball.x = startx;
      fireballs[i].posFireball.y = starty;
      fireballs[i].draw();
    }
    timerAmount++;
    }
  }


  void End() {
    if (dragon.dragonHealth < 0 || HealthbarDragon.healthDragon < 0) {
      dragon.fight = false;
      fase2 = false;
      fase1 = true;
      timer = 0;
      timerAmount = 1;
      dragon.dragonHealth *= dragon.fightAmount;
    }
  }
}
