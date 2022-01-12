//prototype IG-103-2

import samuelal.squelized.*;
import java.util.Properties;
import processing.sound.*;
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
WaterBottle waterBottle;
Drop drops;
ScoreHandler scoreHandler;
Inventory inventory;
Instructions instruction;
Schild schild;
HighScore Highscore;
SpawnPointsPUPS spawnPointsPUPS;
Lava lava;
ParticleSystem ps;
Music music;
SoundFile file;
SoundFile bossFightMusic1;
SoundFile mainMenuMusic1;
SoundFile GameMusic1;
int cooldown = 100;
int fireballCount = 1200;
int bossFireballCount = 1200;
int spawnCountDrop = 500;
int RspawnCountDrop = 500; //oorspronkelijke functie
int resetWaterflesCount = 600;
int aantalCoins = 2;
final int maxToetsen = 1024; //kan niet worden aangepast.
float halfX = width/2;
float halfY = height/2;
float xDragon = 152, yDragon = 10, sizeDragon = 100;
float textX = width/2;
float textY = height/2;
float fireballHitCount = 100;
float endDrop = 0;
int fireballAmount = 12;
int aantalFires = 12;
int firstFireballWave = 3;
int secondFireballWave = 6;
int zeroFireball = 0;
int firstFireball = 1000;
int secondFireball = 800;
int thirdFireball = 600;
int fourthFireball = 400;
int fifthFireball = 200;
int sixthFireball = 0;
int resetFireballCount = 1200;
int newFireballWave = 50000;
int negative = -1;
int endCoolDown = 0;
int extinguishFireball = 0;
int achievementFireballComplete = 1;
int fireballAchievementCount = 300;
final int endFireballAchievement = 0;
int[]bossfightlava = new int[11];

public int endSeeHit = 0;
public int endSeeScore = 0;
public int resetSeeScore = 100;
int resetCoolDown = 100;
int resetFireballHitCount = 100;
int endSpawnDrop = 0;
int bossFightAmount = 2;
boolean[] fire = new boolean[aantalFires];
boolean[] keysPressed = new boolean[maxToetsen]; //als ik op een toets druk, wordt een van de waarden in deze array van false naar true gezet.
float powerUpTimer1 = 0, powerUpTimer2 = 0;
boolean powerUpActive = false;
boolean damageDragon = false;
boolean respawnWaterfles = false;
boolean On = true;
boolean seeHitFireball = false;
boolean achievementFireball = false;
boolean achievementQuery = false;
boolean seeFireballAchievement = false;
boolean onceRunSQL = false;
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
  music = new Music();
  //file = new SoundFile(this, "Footsteps Sound Effects !!! Metal steps.wav");
  //bossFightMusic1 = new SoundFile(this, "battle-of-the-dragons-8037.mp3");
  //mainMenuMusic1 = new SoundFile(this, "cinematic-dramatic-11120.mp3");
  //GameMusic1 = new SoundFile(this, "carried-by-the-wind-calm-classical-orchestral-2754.mp3");

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

  for (int i=0; i<bossfightlava.length; i++) {
    bossfightlava[i] = 0;
  }

  flamethrower.setup();
  health.setup();
  dragon.setup();
  waterBottle = new WaterBottle();
  drops = new Drop();
  sword = new Sword();
  sword.setup();
  inventory.setup();
  player.setup();
  Highscore.setup();


  fireballs[6].posFireball.x = dragon.startx;//Start locations of boss fireballs!
  fireballs[6].posFireball.y = dragon.starty;

  fireballs[7].posFireball.x = dragon.startx;//Start locations of boss fireballs!
  fireballs[7].posFireball.y = dragon.starty;

  fireballs[8].posFireball.x = dragon.startx;//Start locations of boss fireballs!
  fireballs[8].posFireball.y = dragon.starty;

  fireballs[9].posFireball.x = dragon.startx;//Start locations of boss fireballs!
  fireballs[9].posFireball.y = dragon.starty;

  fireballs[10].posFireball.x = dragon.startx;//Start locations of boss fireballs!
  fireballs[10].posFireball.y = dragon.starty;

  fireballs[11].posFireball.x = dragon.startx;//Start locations of boss fireballs!
  fireballs[11].posFireball.y = dragon.starty;

  music.setup();



  /*if (platforms.moveAmount == 1){//Achievement when boss is defeated.
   java.lang.String defeatBossQuery = "INSERT INTO achievement (description, difficulty) VALUES ('Defeat the boss', 'COMPLETE!')";
   myConnection.updateQuery(defeatBossQuery);
   }*/

  if (extinguishFireball == achievementFireballComplete) {
    seeFireballAchievement = true;
    java.lang.String fireballQuery = "INSERT INTO achievement (description, difficulty) VALUES ('Extinguish 5 fireballs', 'COMPLETE')";
    myConnection.updateQuery(fireballQuery);
    println("Yes");
  }
  //ParticleSystem.setup();
}



void update()
{
  music.update();
  dragon.update();
  flamethrower.update();
  Doublejump.update();
  health.update();
  waterBottle.updateWaterBottle();
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
        spawnCountDrop = RspawnCountDrop;
        //waterfles = new Waterfles();
        break;
      case 2:
        sword = new Sword();
        break;
      case 3:
        waterBottle = new WaterBottle();
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

  for (int i = 0; i < fireballs.length; i++) {
    fireballs[i].achievementUpdateFireball();
  }

  if (!dragon.fight) {
    if (fireballCount >= zeroFireball) {
      fireballCount--;
    }

    if (fireballCount == firstFireball) {//Counter fireballs
      fire[0] = true;
    }
    if (fireballCount == secondFireball) {
      fire[1] = true;
    }
    if (fireballCount == thirdFireball) {
      fire[2] = true;
    }

    //First 3 fireballs including movement update && collision.
    for (int i = 0; i < firstFireballWave; i++) {
      if (fire[i]) {
        fireballs[i].movementUpdate();
      }

      if (fireballs[i].playerCollision || fireballs[i].posFireball.y >= height) {
        fire[i] = false;
        fireballCount = resetFireballCount;
        fireballs[i].respawn();
        fireballs[i].posFireball = fireballs[i].RposFireball;
      }

      if (fireballs[i].playerCollision) {
        seeHitFireball = true;
        schild.reset = true;
      }
    }

    if (scoreHandler.score >= newFireballWave) {//Score >= 50000 ---> spawning more fireballs!
      if (fireballCount == fourthFireball) {//Counter fireballs
        fire[3] = true;
      }
      if (fireballCount == fifthFireball) {
        fire[4] = true;
      }
      if (fireballCount == sixthFireball) {
        fire[5] = true;
      }

      //3 new fireballs including movement update && collision.
      for (int i = 3; i < secondFireballWave; i++) {
        if (fire[i]) {
          fireballs[i].movementUpdate();
        }

        if (fireballs[i].playerCollision || fireballs[i].posFireball.y >= height) {
          fire[i] = false;
          fireballCount = resetFireballCount;
          fireballs[i].respawn();
          fireballs[i].posFireball = fireballs[i].RposFireball;
        }

        if (fireballs[i].playerCollision) {
          seeHitFireball = true;
          schild.reset = true;
        }
      }
    }

    //Fireballs colliding with drop.
    for (int i = 0; i < fireballs.length; i++) {
      if (fireballs[i].fireballDrop(fireballs[i].posFireball.x, fireballs[i].posFireball.y, fireballs[i].sizeFireball.x, 
        drops.posPlayer.x, drops.posPlayer.y, drops.dropDia)) {
        fire[i] = false;
        fireballCount = resetFireballCount;
        fireballs[i].respawn();
        achievementFireball = true;
      }
    }

    //Moving stage means no fireballs.
    if (platforms.moveStage == true||!On) {
      fire[0] = false;
      fire[1] = false;
      fire[2] = false;
      fire[3] = false;
      fire[4] = false;
      fire[5] = false;
      fireballCount = resetFireballCount;
    }

    if (seeHitFireball) {
      if (seeHitFireball && schild.pickedUp) {
        fireballHitCount = negative;
      }
      fireballHitCount--;
    }

    if (fireballHitCount < endSeeHit) {
      seeHitFireball = false;
      fireballs[0].playerCollision = false;
      fireballs[1].playerCollision = false;
      fireballs[2].playerCollision = false;
      fireballs[3].playerCollision = false;
      fireballs[4].playerCollision = false;
      fireballs[5].playerCollision = false;
      fireballHitCount = resetFireballHitCount;
    }
  }

  //Boss battle fireballs.
  if (bossFightRoom) {//While boss fight
    if (bossFireballCount >= zeroFireball) {
      bossFireballCount--;
    }

    if (bossFireballCount == firstFireball) {
      fire[6] = true;
    }
    if (bossFireballCount == secondFireball) {
      fire[7] = true;
    }
    if (bossFireballCount == thirdFireball) {
      fire[8] = true;
    }
    if (bossFireballCount == fourthFireball) {
      fire[9] = true;
    }
    if (bossFireballCount == fifthFireball) {
      fire[10] = true;
    }
    if (bossFireballCount == sixthFireball) {
      fire[10] = true;
    }

    //Boss fireballs including movement update && collision.
    for (int i = 6; i < fireballs.length; i++) {
      if (fire[i]) {
        fireballs[i].movementUpdate();
      }

      if (fireballs[i].playerCollision) {
        seeHitFireball = true;
      }

      if (fireballs[i].playerCollision || fireballs[i].wallCollisonR) {
        fire[i] = false;
        fireballs[i].wallCollisonR = false;
        fireballs[i].respawn();
      }
    }

    if (seeHitFireball) {
      fireballHitCount--;
    }

    if (fireballHitCount < endSeeHit) {
      seeHitFireball = false;
      fireballs[6].playerCollision = false;
      fireballs[7].playerCollision = false;
      fireballs[8].playerCollision = false;
      fireballs[9].playerCollision = false;
      fireballs[10].playerCollision = false;
      fireballs[11].playerCollision = false;
      fireballHitCount = resetFireballHitCount;
    }

    if (dragon.dragonHealth <= 0 && bossFightRoom) {//Resets fireballs for next fight if boss fight is over!
      fire[6] = false;
      fire[7] = false;
      fire[8] = false;
      fire[9] = false;
      fire[10] = false;
      fire[11] = false;

      fireballs[6].bossOn = false;
      fireballs[7].bossOn = false;
      fireballs[8].bossOn = false;
      fireballs[9].bossOn = false;
      fireballs[10].bossOn = false;
      fireballs[11].bossOn = false;

      fireballs[6].respawn();
      fireballs[7].respawn();
      fireballs[8].respawn();
      fireballs[9].respawn();
      fireballs[10].respawn();
      fireballs[11].respawn();

      bossFireballCount = resetFireballCount;
    }
  }

  if (cooldown > endCoolDown) {
    cooldown--;
  }

  if (spawnCountDrop > endSpawnDrop) {
    spawnCountDrop--;
  }

  if (waterBottle.dropOn) {//When shooting the druppel.
    drops.dropUpdate();
    waterBottle.pickedUp = false;
    dragon.waterFles = false;
    cooldown = resetCoolDown;
  }

  if (drops.posPlayer.y <= endDrop || drops.hasCollision) {//Druppel off screen or hits dragon:
    waterBottle.dropOn = false;
    waterBottle.resetWaterBottle();
  }

  if (scoreHandler.seeScoreDragon) {
    scoreHandler.seeScoreDragonCount--;
  }

  if (scoreHandler.seeScoreDragonCount < endSeeScore) {
    scoreHandler.seeScoreDragon = false;
    scoreHandler.seeScoreDragonCount = resetSeeScore;
  }

  if (achievementFireball) {
    extinguishFireball++;
    achievementFireball = false;
  }
  println(extinguishFireball);

  //Achievement completed!

  if (seeFireballAchievement) {
    fireballAchievementCount--;
    fill(125);
    rect(platforms.achievementX, platforms.achievementY, platforms.achievementWidth, platforms.achievementHeight);
    textSize(20);
    fill(255);
    text("Achievement complete!", platforms.achievementTextX, platforms.achievementTextY);
  }

  if (fireballAchievementCount <= endFireballAchievement) {
    achievementQuery = false;
    seeFireballAchievement = false;
  }

  player.movementUpdate();
  spawnPointsPUPS.update();
  platforms.bossAchievement();
  //if (Highscore.gameFinished) {
  //  Properties props = new Properties();
  //  props.setProperty("user", "dreijed1");
  //  props.setProperty("password", "kerPVqZtWlI8M4");
  //  myConnection = new MySQLConnection("jdbc:mysql://oege.ie.hva.nl/zdreijed1?serverTimezone=UTC", props);//Connection database.
  //}
  if (onceRunSQL) {
    
    onceRunSQL = false;
  }
}

public void executeSQL(java.lang.String defeatBossQuery, boolean oneGame) {  
  if (oneGame) {
    myConnection.updateQuery(defeatBossQuery);
    println("Exicute SQl");
    oneGame = false;
  }
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
      music.menuMusic();
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

      dragon.bossFight.End();
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

      if (fire[0] == true) {//Draws fireballs!
        fireballs[0].draw();
      }
      if (fire[1] == true) {  
        fireballs[1].draw();
      }

      if (fire[2] == true) {  
        fireballs[2].draw();
      }

      if (fire[3] == true) {
        fireballs[3].draw();
      }

      if (fire[4] == true) {
        fireballs[4].draw();
      }

      if (fire[5] == true) {
        fireballs[5].draw();
      }

      if (fire[6] == true) {//Boss fireballs!
        fireballs[6].bossOn = true;
        fireballs[6].draw();
      }

      if (fire[7] == true) {
        fireballs[7].bossOn = true;
        fireballs[7].draw();
      }

      if (fire[8] == true) {
        fireballs[8].bossOn = true;
        fireballs[8].draw();
      }

      if (fire[9] == true) {
        fireballs[9].bossOn = true;
        fireballs[9].draw();
      }

      if (fire[10] == true) {
        fireballs[10].bossOn = true;
        fireballs[10].draw();
      }

      if (fire[11] == true) {
        fireballs[11].bossOn = true;
        fireballs[11].draw();
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
      waterBottle.draw();
      schild.draw();
      dragon.draw();
      sword.draw();
      lava.draw();
      healthbar.draw();
      health.draw();


      if (waterBottle.dropOn) {//Shooting
        drops.draw();
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

  if (Highscore.ending && keysPressed['D']) {
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
