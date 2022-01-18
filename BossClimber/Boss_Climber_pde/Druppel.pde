//Dion
class Drop{
  CollisionHandler collisionHandler;
  float xSpeedDrop, ySpeedDrop, dropDia;
  PVector posPlayer = new PVector(player.posPlayer.x, player.posPlayer.y);
  color blue = color(0, 0, 255);
  boolean hasCollision = false;
  
  Drop(){
    dropDia = 10;
    collisionHandler = new CollisionHandler();
  }
  
  //Positions drop is same as positions player
  void shootDrop(float startX, float startY, float dropSpeedX, float dropSpeedY){
    posPlayer.x = startX;
    posPlayer.y = startY;
    xSpeedDrop = dropSpeedX;
    ySpeedDrop = dropSpeedY;
  }
    
  
  void dropUpdate(){
    posPlayer.y += ySpeedDrop;
    posPlayer.x += xSpeedDrop;
    
    //Collision with dragon
    collisionHandler.checkCollisionDragon(posPlayer.x, posPlayer.y, dropDia);
    hasCollision = collisionHandler.hitDragon;    
    
    if (hasCollision){
     sword.doneDamage = true;
     waterBottle.dropOn = false;
     dragon.healthbarDragon.doDamageDragon(1);
    }
  }
  
  void draw(){
    fill(blue);
    circle(posPlayer.x, posPlayer.y, dropDia);
  }
}
