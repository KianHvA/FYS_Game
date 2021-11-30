class Druppel{
  float xSpeedDruppel, ySpeedDruppel, startX, startY, druppelDia;
  boolean hasCollision = false;
  
  Druppel(){
    xSpeedDruppel = 4;
    ySpeedDruppel = -4;
    druppelDia = 10;
    player.posPlayer.x = startX;
    player.posPlayer.y = startY;
  }
  
  void druppelUpdate(){
    startY += ySpeedDruppel;
    
    collisionHandler.checkCollisionDragon(startX, startY, druppelDia);
    hasCollision = collisionHandler.hitDragon;    
    
    if (hasCollision){
     waterfles.druppelOn = false;
     damageDragon = true;
    }
  }
  
  void draw(){
    fill(0, 0, 255);
    circle(startX, startY, druppelDia);
    println(startX);
  }
}
