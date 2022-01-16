//Dion
class WaterBottle{
  CollisionHandler collisionHandler;
  Drop drops;
  float bottleX = spawnPointsPUPS.underR.x, bottleY = spawnPointsPUPS.underR.y, bottleWidth, bottleHeight, resetBottleX, resetBottleY, bottleScore, bottleScoreCount, resetBottleWidth, resetBottleHeight,
        farAwayX, farAwayY;
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
    bottleWidth = 20;
    bottleHeight = 20;
    bottleScore = 25;
    bottleScoreCount = 100;
    resetBottleHeight = 20;
    resetBottleWidth = 20;
    resetBottleX = 100;
    resetBottleY = 400;
    farAwayX = 2048;
    farAwayY = 1152;
  }

  void updateWaterBottle() {
     if (dragon.fight && !pickedUp && !fight) {
       if (dragon.fight && !pickedUp && !fight && !dropOn) {
        bottleX = spawnPointsPUPS.fightM.x;
        bottleY = spawnPointsPUPS.fightM.y;
        fight = true;
       }
      }

      if (schild.pickedUp && pickedUp || sword.pickedUp && pickedUp) {
        pickedUp = false;
        reset = true;
        timedReset = true;
      }
      
      if (!schild.pickedUp){
        if (bottlePlayer(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, player.sizePlayer.y, bottleX, bottleY, bottleWidth, bottleHeight)) {//Collision player & waterfles
          bottleX = farAwayX;
          bottleY = farAwayY;
          pickedUp = true;
          scoreHandler.score += bottleScore;
          fight = false;
          seeScoreBottle = true;
        }
      }
      
      if (reset) {
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
     }

  void resetWaterBottle() {//Reset new waterbottle
    pickedUp = false;
    bottleScoreCount = resetSeeScore;
    if (!dragon.fight || dragon.fight) {
      bottleX = resetBottleX;
      bottleY = resetBottleY;
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
  
  //Collision player & waterbottle
  boolean bottlePlayer(float bx, float by, float bw, float bh, float px, float py, float pw, float ph){
    if (bx <= px + pw && bx + bw >= px &&
        by <= py + ph && by + bh >= py){
      return true;
    }
     return false;
  }
}
