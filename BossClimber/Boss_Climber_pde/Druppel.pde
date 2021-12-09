//Dion
class Druppel{
  CollisionHandler collisionHandler;
  float xSpeedDruppel, ySpeedDruppel, druppelDia;
  PVector posPlayer = new PVector(player.posPlayer.x, player.posPlayer.y);
  boolean hasCollision = false;
  
  Druppel(){
    druppelDia = 10;
    collisionHandler = new CollisionHandler();
  }
  
  void shootDruppel(float startX, float startY, float druppelSpeedX, float druppelSpeedY){
    posPlayer.x = startX;
    posPlayer.y = startY;
    xSpeedDruppel = druppelSpeedX;
    ySpeedDruppel = druppelSpeedY;
  }
    
  
  void druppelUpdate(){
    posPlayer.y += ySpeedDruppel;
    posPlayer.x += xSpeedDruppel;
    
    collisionHandler.checkCollisionDragon(posPlayer.x, posPlayer.y, druppelDia);
    hasCollision = collisionHandler.hitDragon;    
    
    if (hasCollision){
     waterfles.druppelOn = false;
     HealthbarDragon.doDamageDragon(1);
    }
  }
  
  void draw(){
    fill(0, 0, 255);
    circle(posPlayer.x, posPlayer.y, druppelDia);
  }
}
