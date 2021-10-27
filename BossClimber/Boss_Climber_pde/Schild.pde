class Schild{
//  PVector schildPos;
//  PVector schildSize;
//  boolean schildOn = false;
//  boolean spawnSchild = false;
//  boolean schildAcitvated = false;
  
//  Schild(){
//    schildPos = new PVector(random(200, 600), random(0, 600));
//    schildSize = new PVector(30, 40);
//  }
  
//  void update(){
//    if (collisionHandler.circleRect(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, schildPos.x, schildPos.y, schildSize.x, schildSize.y)){
//      schildSize.x = 0;
//      schildSize.y = 0;
//    }
    
//    if (schildSize.x == 0 && schildSize.y == 0 && keysPressed['S'] && !schildAcitvated){
//      schildOn = true;
//      schildAcitvated = true;
//    }
//  }
  
//  void draw(){
//    SchildEq();
//    GRAVITYSchild = 0.98;
//    Location.y += GRAVITYSchild;
//    fill(255, 0, 0);
//    rect(schildPos.x, schildPos.y, schildSize.x, schildSize.y);
    
//       size = 50;
//  }


//void SchildEq() {
//  if (pickedUp) {
//    Location = new PVector(width * 2, height * 2);
//    GRAVITYSchild = 0;
//    timerSD.x++;
    
//  }
//  if (timerSD.x == 900) {
//    timerSD.x = 0;
//    pickedUp = false;
//  }
//  if (!pickedUp) {
//    timerSD.y++;
//  }
//  if (timerSD.y == 900) {
//    reset();
//    timerSD.y = 0;
//  }
//}
//void reset() {
// Location = new PVector(200,200);
// rect(schildPos.x, schildPos.y, schildSize.x, schildSize.y);
//}
  
}
