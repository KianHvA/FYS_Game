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
  menu.setup();
  level.setup();
  for (int i =0; i != fireballs.length; i++) { 
    fireballs[i] = new Fireball();
  }
  Flamethrower.setup();
}

void update()
{
  Flamethrower.update();
  player.movementUpdate();
  Doublejump.update();
  collisionHandler.update();
  health.update();
  //for (int i =0; i != fireballs.length; i++) { 
  //  fireballs[i].movementUpdate();
  //}
  //for (int i = 0; i != fireballs.length; i++) {
  //  fireballs[i].respawn();
  //}
}

void draw()
{
  background(0);
  if (menu.start ==false) {
    level.draw();
    menu.draw();
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
