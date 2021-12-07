//Tristan
class DoubleJump {
  PVector timerDJ = new PVector(0, 0); //Timer DoubleJump (DJ).
  boolean pickedUp = false;
  boolean hasCollision = false;
  PVector Location = spawnPointsPUPS.upperR;
  final PVector SIZEPOWERUP = new PVector(40, 50);
  final float SIZE = 50;
  float cooldown = 0; //Timer
  boolean reset = false;
  final float COOLDOWNAMOUNT1 = 100; //Max time cooldown.
  final float COOLDOWNAMOUNT2 = 900; //Max time cooldown.
  boolean fight = false; //If the fight starts the location only needs to be randomized once.

  void draw() {
    DoubleJumpEq(); //Invoking the equip function.
    fill(255);
    image(inventory.doubleJump, Location.x, Location.y, SIZEPOWERUP.x, SIZEPOWERUP.y); //Loading of the picture.
    //Timer between jumps
    if(player.hasDoubleJumped == true) cooldown++;
    if(cooldown == COOLDOWNAMOUNT1) {
     player.hasDoubleJumped = false;
     cooldown = 0;
    }
  }
  
  void update() {
    //If the bossfight starts the locations need to be re-randomized so you can reach everything
    if(dragon.fight && !pickedUp && !fight) {
      delay(30);
      Location = spawnPointsPUPS.location;
      fight = true;
    }
    //Only one puwer-up at a time
    if (waterfles.pickedUp || schild.pickedUp || sword.pickedUp) {
      pickedUp = false;
      reset = true;
    }
    //Invoking the collision function
    collisionHandler.checkCollisionPlayer(Location.x, Location.y, SIZE);
    {
      hasCollision = collisionHandler.hitPlayer;
      if (hasCollision) {
        pickedUp = true;
      }
    }
    //When DoubleJump gets taken out of the inventory it should reset when the inventory is empty
    if (reset && !schild.pickedUp && !Doublejump.pickedUp && !sword.pickedUp && !waterfles.pickedUp) {
     reset();
     reset = false;
    }
  }

  void DoubleJumpEq() {
    if (pickedUp) {
      Location = new PVector(width * 2, height * 2); //Putting the picture outside the screen
      timerDJ.x++;
    }
    if (timerDJ.x == COOLDOWNAMOUNT2 * 3) {
      timerDJ.x = 0;
      pickedUp = false;
    }
    if (!pickedUp) {
      timerDJ.y++;
    }
    if (timerDJ.y == COOLDOWNAMOUNT2 * 3) {
      reset();
      timerDJ.y = 0;
    }
  }

  void reset() {
    //Location is randomized between on of the four points
    Location = spawnPointsPUPS.location;
    fight = false;
    draw();
  }
}
