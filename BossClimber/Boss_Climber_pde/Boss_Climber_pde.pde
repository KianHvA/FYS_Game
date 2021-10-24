Menu menu;
Player player;
CollisionHandler collisionHandler;
Platform platforms;
Health health;
HealthBar healthbar;
DoubleJump Doublejump;
Level level;
Fireball[] fireballs;
Flamethrower Flamethrower;
Dragon Dragon1;
Waterfles waterfles;
ArrayList<Druppel> druppels;
int cooldown = 100;
int spawnCountDruppel = 500;
final int maxToetsen = 1024; //kan niet worden aangepast.
boolean[] keysPressed = new boolean[maxToetsen]; //als ik op een toets druk, wordt een van de waarden in deze array van false naar true gezet.

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
  healthbar = new HealthBar(width - 250/2 - 10, height - 10/2 - 10, 250, 10);
  Doublejump = new DoubleJump();
  fireballs = new Fireball[20];
  Flamethrower = new Flamethrower();
  Dragon1 = new Dragon(152, 50, 46);
  level.setup();
  for (int i =0; i != fireballs.length; i++) { 
    fireballs[i] = new Fireball();
  }
  Flamethrower.setup();
  waterfles = new Waterfles();
  druppels = new ArrayList<Druppel>();
}

void update()
{
  Flamethrower.update();
  player.movementUpdate();
  Doublejump.update();
  collisionHandler.update();
  health.update();
  waterfles.updateWaterfles();
  
  if (cooldown > 0){
    cooldown--;
  }
  
  if (spawnCountDruppel > 0){
    spawnCountDruppel--;
  }
  
  if (waterfles.druppelOn && spawnCountDruppel == 0){//Moet nog worden aangepast!
    druppels.add(new Druppel());
    waterfles.druppelOn = false;
    cooldown = 100;
  }
  //println(spawnCountDruppel);
  for (int i =0; i != fireballs.length; i++) { 
    fireballs[i].movementUpdate();
  }
  for (int i = 0; i != fireballs.length; i++) {
    fireballs[i].respawn();
  }
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
    for (int i =0; i < fireballs.length; i++) { 
      fireballs[i].draw();
    }
    Flamethrower.draw();
    platforms.draw();
    level.draw();
    player.draw();
    Doublejump.draw();
    healthbar.draw();
    Dragon1.draw();
    health.draw();
    waterfles.draw();
    
    for (int d = druppels.size() - 1 ; d >= 0; d--){
    if (druppels.size() >= 3){
      waterfles.druppelOff = true;
      waterfles.druppelOn = true;
      spawnCountDruppel = 500;
    }
     Druppel druppel = druppels.get(d);
     druppel.druppelUpdate();
     druppel.draw();
    }
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
