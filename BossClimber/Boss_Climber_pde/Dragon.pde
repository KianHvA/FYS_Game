//Ömer, Tigo
class Dragon {
  FireBallRain FireballRain;
  bossFight bossFight;
  HealthBarDragon healthbarDragon;
  int savedTime;
  int totalTime = 1000;
  float startx;
  float starty;
  PVector diameter = new PVector(0, 0);
  boolean isFlipped; //for animation
  float ppos; //for animation
  String Modus;
  int vliegen;
  float checkCollision;
  boolean a;
  final int b = 300;
  final int c = 350;
  boolean d;
  boolean oneTickBool = false;
  float randomX = width/2;
  float dragonHealth = 3;
  float dragonHealthS = 3;
  boolean fight = false;
  int fightAmount = 1;
  boolean fireBallRain = false;
  PVector[] vliegPatroon = {new PVector(150, 3), new PVector(500, 10), new PVector(630, 80), new PVector(500, 10)};
  PVector[] vliegPatroonBossFight = {new PVector(150, 3), new PVector(150, b), new PVector(200, c), new PVector(250, b), new PVector(300, c), new PVector(350, b), 
    new PVector(400, c), new PVector(450, b), new PVector(500, c), new PVector(550, b), new PVector(600, c), new PVector(600, b), new PVector(width/2, height/2), new PVector(600, 3)};
  PVector[] stageMovePatroon = {new PVector(150, -100), new PVector(400, -200)};
  PVector healthbarPos = new PVector(-1000, -1000);
  PVector healthbarPosStart = new PVector(275, 20);
  PVector healthbarPosEnd = new PVector(-1000, -1000);
  boolean waterFles = false;
  boolean bossFightRoomFase2 = false;

  PImage dragonClosedUp, dragonClosedDown, dragonOpenUp, dragonOpenDown;
  PImage dragonClosedUpR, dragonClosedDownR, dragonOpenUpR, dragonOpenDownR;
  PImage dragonSprite, dragonSpriteR; //current dragon sprite renderd
  void setup() {
    bossFight.setup();
  }

  Dragon(float x, float y, float diameter) {
    FireballRain = new FireBallRain();
    bossFight = new bossFight();
    healthbarDragon = new HealthBarDragon(275, 20, 250, 10);
    this.startx = x;
    this.starty = y;
    this.diameter.x = diameter;
    this.diameter.y = diameter;
    startx = x;
    starty = y;

    //load images
    dragonClosedUp = loadImage("DragonClosedUp.png");
    dragonClosedDown = loadImage("DragonClosedDown.png");
    dragonOpenUp = loadImage("DragonOpenUp.png");
    dragonOpenDown = loadImage("DragonOpenDown.png");

    dragonClosedUpR = loadImage("DragonClosedUpR.png");
    dragonClosedDownR = loadImage("DragonClosedDownR.png");
    dragonOpenUpR = loadImage("DragonOpenUpR.png");
    dragonOpenDownR = loadImage("DragonOpenDownR.png");

    dragonSprite = dragonClosedUp;
    dragonSpriteR = dragonClosedUpR;
  }

  void draw() {
    stroke(0);
    fill(185, 185, 182);

    //for dragon wing animation
    imageMode(CORNER);
    if (frameCount % 30 == 0) {
      dragonSpriteR = dragonClosedDownR;
      dragonSprite = dragonClosedDown;
    } else if (frameCount % 50 == 0) {
      dragonSpriteR = dragonClosedUpR;
      dragonSprite = dragonClosedUp;
    }

    //check the direction the dragon is moving and use flipped sprite
    if (isFlipped) {
      image(dragonSpriteR, startx, starty, diameter.x, diameter.y);
    } else {
      image(dragonSprite, startx, starty, diameter.x, diameter.y);
    }


    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      savedTime = millis();
      a = true;
      d = true;
    }
    if (a) {
      //ga naar volgende positie in array
      vliegen++;
      if (bossFightRoom) {
        if (vliegen >= vliegPatroonBossFight.length) {
          vliegen = 0;
        }
      } else if (vliegen >= vliegPatroon.length) {
        vliegen = 0;
      }

      //zet a weer naar false;
      a = false;
    }
    if (fight) {
      healthbarDragon.draw();
    }
    if (damageDragon && fight) {
      healthbarDragon.doDamageDragon(1);
      damageDragon = false;
    }

    if (scoreHandler.seeScoreDragon) {
      fill(255);
      textSize(30);
      text("+ 500", player.posPlayer.x, player.posPlayer.y - 40);
    }
  }


  void update() {
    if (!fight) {
      dragon.healthbarPos.x = -1000; 
      dragon.healthbarPos.y = -1000;
    }
    while (player.posPlayer.y > height/2) {
      //voer vlieg routine uit
      if (bossFightRoom && !bossFightRoomFase2) { 
        startx = lerp(startx, vliegPatroonBossFight[vliegen].x, 0.01);
        starty = lerp(starty, vliegPatroonBossFight[vliegen].y, 0.01);

        if (dragon.dragonHealth<=1) {
          bossFightRoomFase2 = true;
        }
      }
      
      if (bossFightRoomFase2) {
        if (d) {
          d=false;
          randomX = random(0, 800);
        }
        if (!On) {
          startx = lerp(startx, randomX, 0.1);
          starty = lerp(starty, 100, 0.1);
          FireballRain.spawn();
        }
      }
      if (On) {
        startx = lerp(startx, vliegPatroon[vliegen].x, 0.1);
        starty = lerp(starty, vliegPatroon[vliegen].y, 0.1);
      }
      //als de spelers zijn positie kleiner word dan y = 80 dan gebeurt het onderste gedeelte.
      break;
      //}
    }
    //}
    //ga terug naar begin positie
    if (fireBallRain || player.posPlayer.y < height/2 && !fight) {
      println("dragoon goes away");
      startx = lerp(startx, stageMovePatroon[0].x, 0.1);
      starty = lerp(starty, stageMovePatroon[0].y, 0.1);
    }

    if (platforms.moveAmount == 3 * fightAmount) {
      //FireballRain.spawn();
    }
    if (platforms.moveAmount == 4 /* fightAmount*/) {
      if (!oneTickBool) {
        bossFight.startFight();
        oneTickBool = true;
      }
    }
    xDragon = startx;
    yDragon = starty;
    //for turning the dragon and animation
    if ((startx - ppos) > 0) {
      isFlipped = true;
    } else {
      isFlipped = false;
    }
    ppos = startx;
    //end of animation part
  }
}

class FireBallRain {
  CollisionHandler collisionHandler;
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
    if (dragon.fireBallRain == true) {
      fireballs[10].damageFireball = 10;
      //collisionHandler.hitPlayer = true;
    }
  }
}

class bossFight {
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
    dragon.healthbarPos = dragon.healthbarPosEnd;
  }
  void startFight() {  
    dragon.healthbarPos = dragon.healthbarPosStart;
    if (fase1) {
      dragon.fight = true;
      fase1 = true;
      dragon.fightAmount = (platforms.moveAmount/4);
      dragon.dragonHealth = dragon.dragonHealthS * dragon.fightAmount;
      //startx = lerp(startx, vliegPatroon[0].x, 0.01);
      //starty = lerp(starty, vliegPatroon[0].y, 0.01);
      //if (!dragon.waterFles) {
      //waterfles.flesX = player.posPlayer.x;
      // waterfles.flesY = player.posPlayer.y - 20;
      //waterfles = new Waterfles();
      //dragon.waterFles = true;
      //}
      //if (dragon.fight) HealthbarDragon.HealthBar(10, 100, 250, 10);
      onTheWay();
    }
  }

  void onTheWay() {//Draak vliegt naar de achtergrond en schiet vuurballen op de player. Komt later te weinig tijd.

    if (dragon.dragonHealth < 300 && fase1 && !fase2) {
      //startx = lerp(startx, startVliegPatroon.x, 0.01);
      //starty = lerp(starty, startVliegPatroon.y, 0.01);
      fase2 = true;
      fase1 = false;
    }
    if (fase2 && startx == 400 && starty < -100) {
      //startx = lerp(startx, vliegPatroonF1.x, 0.01);
      //starty = lerp(starty, vliegPatroonF1.y, 0.01);
    } else if (fase2 && startx == 400 && starty > -50) {
      //startx = lerp(startx, vliegPatroonF2.x, 0.01);
      //starty = lerp(starty, vliegPatroonF2.y, 0.01);
    } else if (fase2 && startx == 400 && starty < -60) {
      sizeShrink = true;
      //startx = lerp(startx, vliegPatroonF3.x, 0.01);
      //starty = lerp(starty, vliegPatroonF3.y, 0.01);
    }
    if (sizeShrink) {
      constrain((int) sizeDragon, 1, 46);
      sizeDragon -= 0.01;
      println("yes");
    }

    if (dragon.dragonHealth < 75 * dragon.fightAmount) {
      //startx = lerp(startx, fireBallVliegPatroon[0].x, 0.01);
      //starty = lerp(starty, fireBallVliegPatroon[0].y, 0.01);
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
    if (dragon.dragonHealth == 0 && bossFightRoom) {
      restartGame();
      dragon.fight = false;
      fase2 = false;
      fase1 = true;
      timer = 0;
      timerAmount = 1;
      dragon.fightAmount += 1;
      scoreHandler.score(250);
      dragon.dragonHealth = dragon.dragonHealthS * dragon.fightAmount;
      dragon.healthbarPos = dragon.healthbarPosEnd;
      bossFightRoom = false;
      On=true;
      dragon.vliegen = 0;
      platforms.drawBossRoom=false;
      On = true;
      dragon.bossFightRoomFase2 = false;
      platforms.moveAmount=platforms.moveAmount+1;
      scoreHandler.seeScoreDragon = true;
      println("dead");
    }
  }
}
