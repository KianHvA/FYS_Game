Player player;
CollisionHandler collisionHandler;
Platform platforms;
HealthBar healthbar;
Jumpboost jumpboost;
Level level;

final int maxToetsen = 1024; //kan niet worden aangepast.
boolean[] keysPressed = new boolean[maxToetsen]; //als ik op een toets druk, wordt een van de waarden in deze array van false naar true gezet.

void setup() 
{
  size(800, 600);
  rectMode(CENTER);
  level = new Level();
  player = new Player();
  platforms = new Platform();
  collisionHandler = new CollisionHandler();
  healthbar = new HealthBar(width - 250/2 - 10, height - 10/2 - 10, 250, 10);
  jumpboost = new Jumpboost();
}

void update()
{
  level.setup();
  player.movementUpdate();
  jumpboost.update();
}

void draw()
{
  update();   

  background(0);
  platforms.draw();
  level.draw();
  player.draw();
  jumpboost.draw();
  healthbar.draw();
  ellipse(collisionHandler.closestX, collisionHandler.closestY, 20, 20);
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
