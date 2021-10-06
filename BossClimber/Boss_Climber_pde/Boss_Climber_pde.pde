Player player;
CollisionHandler collisionHandler;
BaseLevelSegment[] platforms = new BaseLevelSegment[2];
HealthBar healthbar;
Jumpboost jumpboost;

final int maxToetsen = 1024; //kan niet worden aangepast.
boolean[] keysPressed = new boolean[maxToetsen]; //als ik op een toets druk, wordt een van de waarden in deze array van false naar true gezet.

void setup() 
{
  size(800, 600);
  rectMode(CENTER);
  player = new Player();
  platforms[0] = new BaseLevelSegment(new PVector(width /3, height-100), 100, 10, 0);
  platforms[1] = new BaseLevelSegment(new PVector(width /2, height-200), 100, 10, 0);
  collisionHandler = new CollisionHandler();//hallo
  healthbar = new HealthBar();
  jumpboost = new Jumpboost();
  
}

void update()
{
  player.movementUpdate();
  jumpboost.update();
}

void draw()
{
  update();   
  healthbar.draw();
  background(0);
  for (int i = 0; i < platforms.length; i++)
    {
         BaseLevelSegment platform = platforms[i];
         platform.draw();
    }
    
    player.draw();
    jumpboost.draw();
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
