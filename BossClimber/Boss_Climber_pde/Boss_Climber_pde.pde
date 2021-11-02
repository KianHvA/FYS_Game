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
ArrayList<Druppel> druppels;
ScoreHandler scoreHandler;
Inventory inventory;
int cooldown = 100;
int fireballCount = 300;
int spawnCountDruppel = 500;
int RspawnCountDruppel = 500; //oorspronkelijke functie
final int maxToetsen = 1024; //kan niet worden aangepast.
float halfX = width/2;
float halfY = height/2;
float xDragon = 152, yDragon = 50, sizeDragon = 46;
int fireballAmount = 3;
boolean fire = false;
boolean fire2 = false;
boolean fire3 = false;
boolean[] keysPressed = new boolean[maxToetsen]; //als ik op een toets druk, wordt een van de waarden in deze array van false naar true gezet.
float powerUpTimer1 = 0, powerUpTimer2 = 0;
boolean powerUpActive = false;

void setup() 
{
  size(800, 600);
  rectMode(CENTER);
  frameRate(60);
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
  level.setup();
  scoreHandler.setup();
  for (int i = 0; i < fireballs.length; i++) { 
    fireballs[i] = new Fireball();
    fireballs[i].setup();
  }
  flamethrower.setup();
  waterfles = new Waterfles();
  druppels = new ArrayList<Druppel>();
  sword = new Sword();
}

void update()
{
  dragon.update();
  flamethrower.update();
  player.movementUpdate();
  Doublejump.update();
  collisionHandler.update();
  health.update();
  waterfles.updateWaterfles();
  sword.updateSword();
  menu.restart();
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
  if (fireballs[0].playerCollision) {//Damage fireball
    fire = false;
  }  
  if (fireballs[1].posFireball.y >= height || fireballs[1].playerCollision) {
    fire2 = false;
  }
  if (fireballs[1].playerCollision) {//Damage fireball
    fire2 = false;
  }
  if (fireballs[2].playerCollision) {
    fire3 = false;
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

  if (waterfles.druppelOn && spawnCountDruppel == 0) {//Moet nog worden aangepast!
    druppels.add(new Druppel());
    waterfles.druppelOn = false;
    waterfles.pickedUp = false;
    cooldown = 100;
  }

  //println(spawnCountDruppel);
  //for (int i =0; i != fireballs.length; i++) { 
  // fireballs[i].movementUpdate();
  //}
  //for (int i = 0; i != fireballs.length; i++) {
  //fireballs[i].respawn();
  //}

  //println(fireballCount);
}

void draw()
{
  background(0);
  if (menu.start ==false) {
    level.draw();
    menu.draw();
    menu.highlight();
  }
  if (menu.start == true) {

    update();
    level.draw();
    if (fire == true) {
      fireballs[0].draw();
    }
    if (fire2 == true) {  
      fireballs[1].draw();
    }

    if (fire3 == true) {  
      fireballs[2].draw();
    }


    for (int d = druppels.size() - 1; d >= 0; d--) {
      if (druppels.size() >= 3) {
        waterfles.druppelOff = true;
        waterfles.druppelOn = true;
        spawnCountDruppel = 500;
      }
      Druppel druppel = druppels.get(d);
      druppel.druppelUpdate();
      druppel.draw();
    }

    flamethrower.draw();
    player.draw();
    platforms.draw();
    Doublejump.draw();
    healthbar.draw();
    waterfles.draw();
    dragon.draw();

    //teken alle UI hier zodat het op de voorgrond komt
    scoreHandler.draw();
    inventory.draw();
    
    //game overscherm
    healthbar.draw();
    health.draw();
    
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
