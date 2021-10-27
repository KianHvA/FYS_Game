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
Waterfles waterfles;
Schild schild;
ArrayList<Druppel> druppels;
ScoreHandler scoreHandler;
int cooldown = 100;
int fireballCount = 300;
int spawnCountDruppel = 500;
final int maxToetsen = 1024; //kan niet worden aangepast.
float halfX = width/2; //Needed because other function (xBegin) is non-static and can't get it to static
float halfY = height/2; //Needed because other function (yBegin) is non-static and can't get it to static
boolean fire = false;
boolean fire2 = false;
boolean fire3 = false;
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
  fireballs = new Fireball[3];
  flamethrower = new Flamethrower();
  dragon = new Dragon(152, 50, 46);
  scoreHandler = new ScoreHandler();
  level.setup();
  scoreHandler.setup();
<<<<<<< Updated upstream
  for (int i = 0; i < fireballs.length; i++) { 
=======
  menu.start = false;
  for (int i =0; i != fireballs.length; i++) { 
>>>>>>> Stashed changes
    fireballs[i] = new Fireball();
    fireballs[i].setup();
  }
  flamethrower.setup();
  waterfles = new Waterfles();
  schild = new Schild();
  druppels = new ArrayList<Druppel>();
}

void update()
{
  flamethrower.update();
  player.movementUpdate();
  Doublejump.update();
  collisionHandler.update();
  health.update();
  waterfles.updateWaterfles();
<<<<<<< Updated upstream
  schild.update();
  
<<<<<<< Updated upstream
    if (fireballCount >= 0){
    fireballCount--;
  }
=======
  menu.restart();
>>>>>>> Stashed changes
  
  if (fireballCount == 200){//Counter fireballs
    fire = true;
  }
  if (fireballCount == 100){
    fire2 = true;
  }
  if (fireballCount == 0){
    fire3 = true;    
  }
  
  if (fire == true){//Boolean fires == true ---> movementUpdate();
    fireballs[0].movementUpdate();
  }
  if (fire2 == true){
    fireballs[1].movementUpdate();
  }
  if (fire3 == true){
    fireballs[2].movementUpdate();
  }
  
  if (fireballs[0].posFireball.y >= height){//Fires = false, last statement = reset of fireballs
    fire = false;
  }
  if (fireballs[1].posFireball.y >= height){
    fire2 = false;
  }
  if (fireballs[2].posFireball.y >= height){
    fire3 = false;
    fireballCount = 300;
    fireballs[0].respawn();
    fireballs[1].respawn();
    fireballs[2].respawn();
  }
=======
>>>>>>> Stashed changes
  
  if (cooldown > 0) {
    cooldown--;
  }

  if (spawnCountDruppel > 0) {
    spawnCountDruppel--;
  }

  if (waterfles.druppelOn && spawnCountDruppel == 0) {//Moet nog worden aangepast!
    druppels.add(new Druppel());
    waterfles.druppelOn = false;
    cooldown = 100;
  }
  //println(spawnCountDruppel);
  //for (int i =0; i != fireballs.length; i++) { 
   // fireballs[i].movementUpdate();
  //}
  //for (int i = 0; i != fireballs.length; i++) {
    //fireballs[i].respawn();
  //}
  
  println(fireballCount);
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
    
    if (fire == true){
      fireballs[0].draw();
    }
    if (fire2 == true){  
      fireballs[1].draw();
    }
  
    if (fire3 == true){  
      fireballs[2].draw();
    }
    
    flamethrower.draw();
    platforms.draw();
    level.draw();
    player.draw();
    Doublejump.draw();
    healthbar.draw();
    dragon.draw();
    waterfles.draw();
    schild.draw();
    fireUpdate();
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
    //teken alle UI hier zodat het op de voorgrond komt
    scoreHandler.draw();
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
