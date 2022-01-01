//Dion
class WaterBottle{
  CollisionHandler collisionHandler;
  Drop drops;
  float bottleX = spawnPointsPUPS.underR.x, bottleY = spawnPointsPUPS.underR.y, bottleWidth, bottleHeight, resetBottleX, resetBottleY, bottleScore, bottleScoreCount, resetBottleWidth, resetBottleHeight;
  boolean dropOn = false;
  boolean spawnWaterfles = false;
  boolean dropOff = false;
  boolean pickedUp = false; //Needed for inventory
  boolean catchWaterBottle = true;
  boolean reset = false;
  boolean fight = false;
  boolean timedReset = false;
  boolean seeScoreBottle = false;

  WaterBottle() {
    collisionHandler = new CollisionHandler();
    drops = new Drop();
    //flesX = random(200, 600);
    //flesY = random(0, 600);
    bottleWidth = 20;
    bottleHeight = 20;
    bottleScore = 25;
    bottleScoreCount = 100;
    resetBottleHeight = 20;
    resetBottleWidth = 20;
  }

  void updateWaterBottle() {
    if (dragon.fight && !pickedUp && !fight) {
      if (dragon.fight && !pickedUp && !fight && !dropOn) {
        bottleX = spawnPointsPUPS.fightM.x;
        bottleY = spawnPointsPUPS.fightM.y;
        fight = true;
       }
      }

      if (schild.pickedUp && pickedUp  /*|| Doublejump.pickedUp*/ || sword.pickedUp && pickedUp) {
        pickedUp = false;
        reset = true;
        timedReset = true;
      }
      
      if (!schild.pickedUp){
      if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, bottleX, bottleY, bottleWidth, bottleHeight)) {//Collision player & waterfles
        bottleX = width * 2;
        bottleY = height * 2;
        pickedUp = true;
        scoreHandler.score += bottleScore;
        fight = false;
        seeScoreBottle = true;
      }
      }
      
      if (reset /*&& !schild.pickedUp && !Doublejump.pickedUp && !sword.pickedUp && !pickedUp*/) {
        resetWaterBottle();
        fight = false;
        timedReset = false;
        reset = false;
      }

      if (seeScoreBottle) {
        bottleScoreCount--;
      }

      if (bottleScoreCount < endSeeScore) {
        seeScoreBottle = false;
        bottleScoreCount = resetSeeScore;
      }

      //if (sword.swordX == width * 2 && sword.swordY == height *2 && schild.schildPos.x == width *2 && schild.schildPos.y == height * 2 || flesX == width *2 && flesY == height *2 && schild.schildPos.x == width *2 && schild.schildPos.y == height * 2 || flesX == width *2 && flesY == height *2 && sword.swordX == width * 2 && sword.swordY == height *2) {
        //reset = true;
        //sword.reset = true;
        //schild.reset = true;
      //}
  }

  void resetWaterBottle() {//Reset nieuwe waterfles
    pickedUp = false;
    bottleScoreCount = resetSeeScore;
    if (!dragon.fight || dragon.fight) {
      bottleX = spawnPointsPUPS.location.x;
      bottleY = spawnPointsPUPS.location.y;
    }
    bottleWidth = resetBottleWidth;
    bottleHeight = resetBottleHeight;
    drops.posPlayer.x = player.posPlayer.x;
    drops.posPlayer.y = player.posPlayer.y;
    drops.hasCollision = false;
  }

  void draw() {
    fill(0, 0, 255);
    image(inventory.waterflesI, bottleX, bottleY, bottleWidth, bottleHeight);

    if (seeScoreBottle) {
      fill(255);
      textSize(30);
      text("+ 25", player.posPlayer.x, player.posPlayer.y - 40);
    }
  }
}
