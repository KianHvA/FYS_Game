class Waterfles{
  float flesX, flesY, flesB, flesH, resetFlesX, resetFlesY;
  boolean druppelOn = false;
  boolean spawnWaterfles = false;
  boolean druppelOff = false;
  boolean pickedUp = false; //Needed for inventory
  
  Waterfles(){
    flesX = random(200, 600);
    flesY = random(0, 600);
    flesB = 10;
    flesH = 40;
    resetFlesX = random(200, 600);
    resetFlesY = random(200, 600);
  }
  
  void updateWaterfles(){
    if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, flesX, flesY, flesB, flesH)){
      flesB = 0;
      flesH = 0;
      pickedUp = true;
      scoreHandler.score((int)random(10,30));
    }
    
    if (flesB == 0 && flesH == 0 && keysPressed['S'] && !druppelOff && cooldown == 0){
      druppelOn = true;
    }
  }
  
 void resetWaterfles(){
    flesX = resetFlesX;
    flesY = resetFlesY;
    flesB = 10;
    flesH = 40;
    druppelOn = false;
    druppelOff = false;
 }
  
  void draw(){
    fill(0, 0, 255);
    rect(flesX, flesY, flesB, flesH);
  }
}
