//prototype IG-103-2

import samuelal.squelized.*;
import java.util.Properties;
//import de.bezier.data.sql.*;

Menu menu;
Player player;
Platform platforms;
Health health;
HealthBar healthbar;
DoubleJump Doublejump;
Level level;
Fireball[] fireballs;
Flamethrower flamethrower;
Dragon dragon;
Sword sword;
Waterfles waterfles;
Druppel druppels;
ScoreHandler scoreHandler;
Inventory inventory;
Instructions instruction;
Schild schild;
HealthBarDragon HealthbarDragon;
HighScore Highscore;
SpawnPointsPUPS spawnPointsPUPS;
Lava lava;
ParticleSystem ps;
int cooldown = 100;
int fireballCount = 1200;
int spawnCountDruppel = 500;
int RspawnCountDruppel = 500; //oorspronkelijke functie
int resetWaterflesCount = 600;
int aantalCoins = 2;
final int maxToetsen = 1024; //kan niet worden aangepast.
float halfX = width/2;
float halfY = height/2;
float xDragon = 152, yDragon = 10, sizeDragon = 100;
float textX = width/2;
float textY = height/2;
float fireballHitCount = 100;
int fireballAmount = 6;
boolean fire = false;
boolean fire2 = false;
boolean fire3 = false;
boolean fire4 = false;
boolean fire5 = false;
boolean fire6 = false;
boolean[] keysPressed = new boolean[maxToetsen]; //als ik op een toets druk, wordt een van de waarden in deze array van false naar true gezet.
float powerUpTimer1 = 0, powerUpTimer2 = 0;
boolean powerUpActive = false;
boolean damageDragon = false;
boolean respawnWaterfles = false;
boolean On = true;
boolean seeHitFireball = false;
SQLConnection myConnection;


void setup() 
{
  size(1024, 576);
  rectMode(CENTER);
  frameRate(60);
  smooth(8);
  Properties props = new Properties();
  props.setProperty("user", "dreijed1");
  props.setProperty("password", "kerPVqZtWlI8M4");

  spawnPointsPUPS = new SpawnPointsPUPS();
  myConnection = new MySQLConnection("jdbc:mysql://oege.ie.hva.nl/zdreijed1?serverTimezone=UTC", props);//Connection database.

  menu = new Menu();
  level = new Level();
  player = new Player();
  platforms = new Platform();

  lava = new Lava();
  health = new Health();
  healthbar = new HealthBar(width/8, height - 20, 250, 10);
  Doublejump = new DoubleJump();
  fireballs = new Fireball[fireballAmount];
  flamethrower = new Flamethrower();
  dragon = new Dragon(xDragon, yDragon, sizeDragon);
  scoreHandler = new ScoreHandler();
  inventory = new Inventory();
  instruction = new Instructions();
  schild = new Schild();
  Highscore = new HighScore();
  ps = new ParticleSystem(new PVector(player.posPlayer.x, player.posPlayer.y));
  ;
  level.setup();
  scoreHandler.setup();

  for (int i = 0; i < fireballs.length; i++) { 
    fireballs[i] = new Fireball();
    fireballs[i].setup();
  }

  flamethrower.setup();
  health.setup();
  dragon.setup();
  waterfles = new Waterfles();
  druppels = new Druppel();
  sword = new Sword();
  sword.setup();
  inventory.setup();
  player.setup();
  Highscore.setup();
  //ParticleSystem.setup();
}

void update()
{
  dragon.update();
  flamethrower.update();
  Doublejump.update();
  health.update();
  waterfles.updateWaterfles();
  sword.updateSword();
  menu.restart();
  schild.update();
  Highscore.update();
  //3 is amount off power-ups need change later
  int randomPowerup = randomizer(3);
  if (!dragon.fight) {
    if (powerUpTimer2 == 0 && !powerUpActive) powerUpTimer1++;
    if (powerUpTimer1 == 300 && !powerUpActive) {
      switch(randomPowerup) {
      case 1:
        spawnCountDruppel = RspawnCountDruppel;
        //waterfles = new Waterfles();
        break;
      case 2:
        sword = new Sword();
        break;
      case 3:
        waterfles = new Waterfles();
        break;
      default:
        powerUpActive = true;
      }
      if (powerUpActive) powerUpTimer2++;
      if (powerUpTimer2 > 300) {
        powerUpTimer1 = 0; 
        powerUpTimer2 = 0;
        powerUpActive = false;
      }
    }
  }

  //int randomPowerup = randomizer(3);
  //switch(randomPowerup) {
  //case 1:
  //  waterfles = new Waterfles();
  //  break;
  //case 2:
  //  sword = new Sword();
  //  break;
  //case 3:
  //  waterfles = new Waterfles();
  //  break;
  //  default:
  //}

  if (dragon.fight || !dragon.fight) {
    if (fireballCount >= 0) {
      fireballCount--;
    }

    if (fireballCount == 1000) {//Counter fireballs
      fire = true;
    }
    if (fireballCount == 800) {
      fire2 = true;
    }
    if (fireballCount == 600) {
      fire3 = true;
    }

    if (fire == true) {//Boolean fires == true ---> movementUpdate();
      fireballs[0].movementUpdate();
    }
    if (fire2 == true) {
      fireballs[1].movementUpdate();
    }
    if (fire3 == true) {
      fireballs[2].movementUpdate();
    }    

    if (fireballs[0].playerCollision || fireballs[0].posFireball.y >= height) {//Damage fireball && respawning fireball
      fire = false;
      fireballCount = 1200;
      fireballs[0].respawn();
      fireballs[0].posFireball = fireballs[0].RposFireball;
    }  

    if (fireballs[1].playerCollision || fireballs[1].posFireball.y >= height) {//Damage fireball && respawning fireball
      fire2 = false;
      fireballCount = 1200;
      fireballs[1].respawn();
      fireballs[1].posFireball = fireballs[1].RposFireball;
    }
    if (fireballs[2].playerCollision || fireballs[2].posFireball.y >= height) {//Damage fireball && respawning fireball
      fire3 = false;
      fireballCount = 1200;
      fireballs[2].respawn();
      fireballs[2].posFireball = fireballs[2].RposFireball;
    }

    if (fireballs[0].playerCollision) {//Player sees that he/she is hitting a fireball.
      seeHitFireball = true;
    }
    if (fireballs[1].playerCollision) {//Player sees that he/she is hitting a fireball.
      seeHitFireball = true;
    }
    if (fireballs[2].playerCollision) {//Player sees that he/she is hitting a fireball.
      seeHitFireball = true;
    }

    if (scoreHandler.score >= 50000) {//Score >= 50000 ---> spawning more fireballs!
      if (fireballCount == 400) {//Counter fireballs
        fire4 = true;
      }
      if (fireballCount == 200) {
        fire5 = true;
      }
      if (fireballCount == 0) {
        fire6 = true;
      }

      if (fire4 == true) {//Boolean fires == true ---> movementUpdate();
        fireballs[3].movementUpdate();
      }
      if (fire5 == true) {
        fireballs[4].movementUpdate();
      }
      if (fire6 == true) {
        fireballs[5].movementUpdate();
      }    

      if (fireballs[3].playerCollision || fireballs[3].posFireball.y >= height) {//Damage fireball && respawning fireball
        fire4 = false;
        fireballCount = 1200;
        fireballs[3].respawn();
        fireballs[3].posFireball = fireballs[3].RposFireball;
      }  

      if (fireballs[4].playerCollision || fireballs[4].posFireball.y >= height) {//Damage fireball && respawning fireball
        fire5 = false;
        fireballCount = 1200;
        fireballs[4].respawn();
        fireballs[4].posFireball = fireballs[4].RposFireball;
      }
      if (fireballs[5].playerCollision || fireballs[5].posFireball.y >= height) {//Damage fireball && respawning fireball
        fire6 = false;
        fireballCount = 1200;
        fireballs[5].respawn();
        fireballs[5].posFireball = fireballs[5].RposFireball;
      }

      if (fireballs[3].playerCollision) {//Player sees that he/she is hitting a fireball.
        seeHitFireball = true;
      }
      if (fireballs[4].playerCollision) {//Player sees that he/she is hitting a fireball.
        seeHitFireball = true;
      }
      if (fireballs[5].playerCollision) {//Player sees that he/she is hitting a fireball.
        seeHitFireball = true;
      }
    }

    if (fireballs[0].fireballDruppel(fireballs[0].posFireball.x, fireballs[0].posFireball.y, fireballs[0].sizeFireball.x, 
      druppels.posPlayer.x, druppels.posPlayer.y, druppels.druppelDia)) {//Collision fireball & druppel
      fire = false;
      fireballCount = 1200;
      fireballs[0].respawn();
    }
    if (fireballs[1].fireballDruppel(fireballs[1].posFireball.x, fireballs[1].posFireball.y, fireballs[1].sizeFireball.x, 
      druppels.posPlayer.x, druppels.posPlayer.y, druppels.druppelDia)) {//Collision fireball & druppel
      fire2 = false;
      fireballCount = 1200;
      fireballs[1].respawn();
    }
    if (fireballs[2].fireballDruppel(fireballs[2].posFireball.x, fireballs[2].posFireball.y, fireballs[2].sizeFireball.x, 
      druppels.posPlayer.x, druppels.posPlayer.y, druppels.druppelDia)) {//Collision fireball & druppel
      fire3 = false;
      fireballCount = 1200;
      fireballs[2].respawn();
    }
    if (fireballs[3].fireballDruppel(fireballs[3].posFireball.x, fireballs[3].posFireball.y, fireballs[3].sizeFireball.x, 
      druppels.posPlayer.x, druppels.posPlayer.y, druppels.druppelDia)) {//Collision fireball & druppel
      fire4 = false;
      fireballCount = 1200;
      fireballs[3].respawn();
    }
    if (fireballs[4].fireballDruppel(fireballs[4].posFireball.x, fireballs[4].posFireball.y, fireballs[4].sizeFireball.x, 
      druppels.posPlayer.x, druppels.posPlayer.y, druppels.druppelDia)) {//Collision fireball & druppel
      fire5 = false;
      fireballCount = 1200;
      fireballs[4].respawn();
    }
    if (fireballs[5].fireballDruppel(fireballs[5].posFireball.x, fireballs[5].posFireball.y, fireballs[5].sizeFireball.x, 
      druppels.posPlayer.x, druppels.posPlayer.y, druppels.druppelDia)) {//Collision fireball & druppel
      fire6 = false;
      fireballCount = 1200;
      fireballs[5].respawn();
    }

    if (platforms.moveStage == true||!On) {
      fire = false;
      fire2 = false;
      fire3 = false;
      fire4 = false;
      fire5 = false;
      fire6 = false;
      fireballCount = 1200;
    }

    if (seeHitFireball) {
      if (seeHitFireball && schild.pickedUp){
        fireballHitCount = -1;
      }
      fireballHitCount--;
    }

    if (fireballHitCount < 0) {
      seeHitFireball = false;
      fireballs[0].playerCollision = false;
      fireballs[1].playerCollision = false;
      fireballs[2].playerCollision = false;
      fireballs[3].playerCollision = false;
      fireballs[4].playerCollision = false;
      fireballs[5].playerCollision = false;
      fireballHitCount = 100;
    }
  }

  if (cooldown > 0) {
    cooldown--;
  }

  if (spawnCountDruppel > 0) {
    spawnCountDruppel--;
  }

  if (waterfles.druppelOn) {//When shooting the druppel.
    druppels.druppelUpdate();
    waterfles.pickedUp = false;
    dragon.waterFles = false;
    cooldown = 100;
  }

  if (druppels.posPlayer.y <= 0 || druppels.hasCollision) {//Druppel off screen or hits dragon:
    waterfles.druppelOn = false;
    waterfles.resetWaterfles();
  }
  
  if (scoreHandler.seeScoreDragon){
    scoreHandler.seeScoreDragonCount--;
  }
  
  if (scoreHandler.seeScoreDragonCount < 0){
    scoreHandler.seeScoreDragon = false;
    scoreHandler.seeScoreDragonCount = 100;
  }

  println(waterfles.flesX);

  player.movementUpdate();
  spawnPointsPUPS.update();
  //if (Highscore.gameFinished) {
  //  Properties props = new Properties();
  //  props.setProperty("user", "dreijed1");
  //  props.setProperty("password", "kerPVqZtWlI8M4");
  //  myConnection = new MySQLConnection("jdbc:mysql://oege.ie.hva.nl/zdreijed1?serverTimezone=UTC", props);//Connection database.
  //}
}

void restartGame() {//Resets the whole game
  scoreHandler.score = 0;
  Highscore.j = 0;
  platforms.moveAmount = 1;
  player.posPlayer.x = width/1.8;
  player.posPlayer.y = height/1.2;
  menu.kleur = 255;
  instruction.manual = false;
  instruction.powerExpl = false;
  health.amount = 4;
  health.amount0 = false;
  health.amount1 = false;
  health.amount2 = false;
}

void draw()
{
  background(0);

  textSize(40);
  text("Press Y to go to the title screen", width/2, height/2);

  if (Highscore.ending == false) {
    if (menu.start == false) {
      background(0);
      level.draw();
      menu.draw();

      if (keysPressed['D']) {
        instruction.manual = true;
      }

      if (instruction.manual) {//Player reads instructions.
        instruction.updateInstructions();
        instruction.draw();

        if (keysPressed['S']) {
          instruction.powerExpl = true;
        }

        if (instruction.powerExpl) {
          instruction.powerUpInstructions();
        }
      }
      if (menu.displayHighscore) {
        menu.HighscoreDraw();
      }
    }

    if (menu.start == true) {
      background(0);
      update();
      //dragon.bossFight.End();
      level.draw();
      muur();

      instruction.sign();

      if (On) {
        flamethrower.draw();
        platforms.draw();
        player.draw();
      }
      if (platforms.drawBossRoom) {
        player.draw();
        Bossplatform();
      }

      if (fire == true) {//Draws fireballs!
        fireballs[0].draw();
      }
      if (fire2 == true) {  
        fireballs[1].draw();
      }

      if (fire3 == true) {  
        fireballs[2].draw();
      }

      if (fire4 == true) {
        fireballs[3].draw();
      }

      if (fire5 == true) {
        fireballs[4].draw();
      }

      if (fire6 == true) {
        fireballs[5].draw();
      }

      if (seeHitFireball && !schild.pickedUp) {
        fill(255);
        textSize(30);
        text("Ouch!", player.posPlayer.x, player.posPlayer.y - 40);
      }

      if (seeHitFireball && schild.pickedUp) {
        fill(255);
        textSize(30);
        text("Protected!", player.posPlayer.x, player.posPlayer.y - 40);
      }

      Doublejump.draw();
      waterfles.draw();
      schild.draw();
      dragon.draw();
      sword.draw();
      lava.draw();
      healthbar.draw();
      health.draw();

      if (waterfles.druppelOn) {//Shooting
        druppels.draw();
      }

      //teken alle UI hier zodat het op de voorgrond komt
      scoreHandler.draw();
      inventory.draw();
      Highscore.draw();

      //game overscherm
      //healthbar.draw();
      //health.draw();
      ps.addParticle();
      ps.run();
    }
  }

  if (Highscore.ending == true && keysPressed['D']) {
    health.dead = false;
    Highscore.drawn = false;
    Highscore.ending = false;
    menu.start = false;
    restartGame();
  }
}

void keyPressed()
{
  //we hebben een toets ingedrukt.
  keysPressed[keyCode] = true;
}

void keyReleased()
{
  //we hebben een toets losgelaten.
  keysPressed[keyCode] = false;
}

int randomizer(float Amount) {
  float timerA = 0;
  int number = 1;
  boolean timer = true;
  if (timer) timerA++;
  if (timerA > 900) {
    number = (int)random(0, Amount);
    timer = false;
  }
  return number;
}
