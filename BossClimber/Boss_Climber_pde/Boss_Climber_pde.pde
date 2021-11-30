//prototype IG-103-2

//import de.bezier.data.sql.*;

Menu menu;
Player player;
CollisionHandler collisionHandler;
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
UI UI;
HealthBarDragon HealthbarDragon;
HighScore Highscore;
int cooldown = 100;
int fireballCount = 300;
int spawnCountDruppel = 500;
int RspawnCountDruppel = 500; //oorspronkelijke functie
int resetWaterflesCount = 600;
final int maxToetsen = 1024; //kan niet worden aangepast.
float halfX = width/2;
float halfY = height/2;
float xDragon = 152, yDragon = 10, sizeDragon = 100;
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

void setup() 
{
  size(800, 600);
  rectMode(CENTER);
  frameRate(60);
  smooth(0);
  menu = new Menu();
  level = new Level();
  player = new Player();
  platforms = new Platform();
  collisionHandler = new CollisionHandler();
  health = new Health();
  healthbar = new HealthBar(10, height - 20, 250, 10);
  Doublejump = new DoubleJump();
  fireballs = new Fireball[fireballAmount];
  flamethrower = new Flamethrower();
  dragon = new Dragon(xDragon, yDragon, sizeDragon);
  scoreHandler = new ScoreHandler();
  inventory = new Inventory();
  instruction = new Instructions();
  schild = new Schild();
  UI = new UI();
  Highscore = new HighScore();
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
}

void update()
{
  dragon.update();
  flamethrower.update();
  
  Doublejump.update();
  collisionHandler.update();
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
        waterfles = new Waterfles();
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

  if (fireballCount >= 0) {
    fireballCount--;
  }

  if (fireballCount == 200) {//Counter fireballs
    fire = true;
  }
  if (fireballCount == 100) {
    fire2 = true;
  }
  if (fireballCount == 0) {
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

  if (fireballs[0].posFireball.y >= height || fireballs[0].playerCollision) {//Fires = false, last statement = reset of fireballs
    fire = false;
  }
  if (fireballs[0].playerCollision) {//Damage fireball && respawning fireball
    fire = false;
    fireballs[0].playerCollision = false;
    fireballCount = 300;
    fireballs[0].respawn();
    fireballs[0].posFireball = fireballs[0].RposFireball;
  }  
  if (fireballs[1].posFireball.y >= height || fireballs[1].playerCollision) {
    fire2 = false;
  }
  if (fireballs[1].playerCollision) {//Damage fireball && respawning fireball
    fire2 = false;
    fireballs[1].playerCollision = false;
    fireballCount = 300;
    fireballs[1].respawn();
    fireballs[1].posFireball = fireballs[1].RposFireball;
  }
  if (fireballs[2].playerCollision) {//Damage fireball && respawning fireball
    fire3 = false;
    fireballs[2].playerCollision = false;
    fireballCount = 300;
    fireballs[2].respawn();
    fireballs[2].posFireball = fireballs[2].RposFireball;
  }

  if (fireballCount == 550) {//Counter fireballs
    fire4 = true;
  }
  if (fireballCount == 450) {
    fire5 = true;
  }
  if (fireballCount == 350) {
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

  if (fireballs[3].posFireball.y >= height || fireballs[3].playerCollision) {//Fires = false, last statement = reset of fireballs
    fire4 = false;
  }
  if (fireballs[3].playerCollision) {//Damage fireball && respawning fireball
    fire = false;
    fireballs[3].playerCollision = false;
    fireballCount = 600;
    fireballs[3].respawn();
    fireballs[3].posFireball = fireballs[3].RposFireball;
  }  
  if (fireballs[4].posFireball.y >= height || fireballs[4].playerCollision) {
    fire5 = false;
  }
  if (fireballs[4].playerCollision) {//Damage fireball && respawning fireball
    fire5 = false;
    fireballs[4].playerCollision = false;
    fireballCount = 600;
    fireballs[4].respawn();
    fireballs[4].posFireball = fireballs[4].RposFireball;
  }
  if (fireballs[5].playerCollision) {//Damage fireball && respawning fireball
    fire6 = false;
    fireballs[5].playerCollision = false;
    fireballCount = 600;
    fireballs[5].respawn();
    fireballs[5].posFireball = fireballs[5].RposFireball;
  }
  
  if (fireballs[0].fireballDruppel(fireballs[0].posFireball.x, fireballs[0].posFireball.y, fireballs[0].sizeFireball.x, 
      druppels.startX, druppels.startY, druppels.druppelDia)){//Collision fireball & druppel
    fire = false;
    fireballCount = 300;
    fireballs[0].respawn();
  }
  if (fireballs[1].fireballDruppel(fireballs[1].posFireball.x, fireballs[1].posFireball.y, fireballs[1].sizeFireball.x, 
      druppels.startX, druppels.startY, druppels.druppelDia)){//Collision fireball & druppel
    fire2 = false;
    fireballCount = 300;
    fireballs[1].respawn();
  }
  if (fireballs[2].fireballDruppel(fireballs[2].posFireball.x, fireballs[2].posFireball.y, fireballs[2].sizeFireball.x, 
      druppels.startX, druppels.startY, druppels.druppelDia)){//Collision fireball & druppel
    fire3 = false;
    fireballCount = 300;
    fireballs[2].respawn();
  }
   if (fireballs[3].fireballDruppel(fireballs[3].posFireball.x, fireballs[3].posFireball.y, fireballs[3].sizeFireball.x, 
      druppels.startX, druppels.startY, druppels.druppelDia)){//Collision fireball & druppel
    fire4 = false;
    fireballs[3].respawn();
  }

  if (fireballs[2].posFireball.y >= height || fireballs[0].posFireball.y >= height || fireballs[1].posFireball.y >= height) {
    fire3 = false;
    //fireballs[0].posFireball.x = fireballs[0].RposFireball.x;
    //fireballs[1].posFireball.x = fireballs[1].RposFireball.x;
    //fireballs[2].posFireball.x = fireballs[2].RposFireball.x;
    //fireballs[0].posFireball.y = fireballs[0].RposFireball.y;
    //fireballs[1].posFireball.y = fireballs[1].RposFireball.y;
    //fireballs[2].posFireball.y = fireballs[2].RposFireball.y;
    fireballCount = 300;
    fireballs[0].respawn();
    fireballs[0].posFireball = fireballs[0].RposFireball;
    fireballs[1].respawn();
    fireballs[1].posFireball = fireballs[1].RposFireball;
    fireballs[2].respawn();
    fireballs[2].posFireball = fireballs[2].RposFireball;
  }

  if (fireballs[3].posFireball.y >= height || fireballs[4].posFireball.y >= height || fireballs[5].posFireball.y >= height) {
    fireballCount = 600;
    fireballs[3].respawn();
    fireballs[3].posFireball = fireballs[3].RposFireball;
    fireballs[4].respawn();
    fireballs[4].posFireball = fireballs[4].RposFireball;
    fireballs[5].respawn();
    fireballs[5].posFireball = fireballs[5].RposFireball;
  }
  //println(fireballCount);
  //if (dragon.fireBallRain) { //werkt niet ga er nog naar kijken
  //  for (int i = 0; i > fireballs.length; i++) {
  //    fireballs[i].posFireball.x = 150;
  //    fireballs[i].posFireball.y = 50;
  //    fireballs[i].draw();
  //  }
  //}

  //println(fireballCount);



  //println(fireballs[0].playerCollision);


  if (cooldown > 0) {
    cooldown--;
  }

  if (spawnCountDruppel > 0) {
    spawnCountDruppel--;
  }

  if (waterfles.druppelOn) {//Moet nog worden aangepast!
    druppels.druppelUpdate();
    waterfles.pickedUp = false;
    dragon.waterFles = false;
    cooldown = 100;
  }
  
  if (druppels.startY <= 0){
    waterfles.druppelOn = false;
   if (resetWaterflesCount >= 0){//Timer when waterfles is spawning again.
    resetWaterflesCount--;
   }
  }
  
  if (resetWaterflesCount <= 0){
    resetWaterflesCount = 600;
    waterfles.resetWaterfles();
  }
 
  //println(spawnCountDruppel);
  //for (int i =0; i != fireballs.length; i++) { 
  // fireballs[i].movementUpdate();
  //}
  //for (int i = 0; i != fireballs.length; i++) {
  //fireballs[i].respawn();
  //}

  //println(fireballCount);
  
  player.movementUpdate();
}

void draw()
{
  background(0);
  
  if (menu.start ==false) {
    textAlign(CORNER, CORNER);
    level.draw();
    menu.draw();
    //menu.highlight();
    textSize(72);
    text("BOSS CLIMBER", 147, 200); 
    
     if (keysPressed['D']){
      instruction.manual = true;
    }
  
     if (instruction.manual){//Player reads instructions.
        instruction.updateInstructions();
        instruction.draw();
      }
    }
  
  if (menu.start == true) {
    update();
    level.draw();
    if (fire == true) {//Draws fireballs!
      fireballs[0].draw();
    }
    if (fire2 == true) {  
      fireballs[1].draw();
    }

    if (fire3 == true) {  
      fireballs[2].draw();
    }
    
    if (fire4 == true){
      fireballs[3].draw();
    }
    
    if (fire5 == true){
      fireballs[4].draw();
    }
    
    if (fire6 == true){
      fireballs[5].draw();
    }

    flamethrower.draw();
    player.draw();
    platforms.draw();
    if (platforms.drawBossRoom) {
      player.draw();
    }
    Doublejump.draw();
    healthbar.draw();
    health.draw();
    waterfles.draw();
    schild.draw();
    dragon.draw();
    sword.draw();
    
    if (waterfles.druppelOn) {//Shooting
      druppels.draw();
    }

    //teken alle UI hier zodat het op de voorgrond komt
    UI.draw();
    scoreHandler.draw();
    inventory.draw();
    Highscore.draw();

    //game overscherm
    //healthbar.draw();
    //health.draw();
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
