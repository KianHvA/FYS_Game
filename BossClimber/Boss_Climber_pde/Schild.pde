class Schild{
  PVector schildPos;
  PVector schildSize;
  boolean schildOn = false;
  boolean spawnSchild = false;
  boolean schildAcitvated = false;
  
  Schild(){
    schildPos = new PVector(random(200, 600), random(0, 600));
    schildSize = new PVector(30, 40);
  }
  
  void update(){
    if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, schildPos.x, schildPos.y, schildSize.x, schildSize.y)){
      schildSize.x = 0;
      schildSize.y = 0;
    }
    
    if (schildSize.x == 0 && schildSize.y == 0 && keysPressed['S'] && !schildAcitvated){
      schildOn = true;
      schildAcitvated = true;
    }
  }
  
  void draw(){
    fill(255, 0, 0);
    rect(schildPos.x, schildPos.y, schildSize.x, schildSize.y);
  }
}
