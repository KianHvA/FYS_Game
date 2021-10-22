class Druppel{
  float xSpeedDruppel, startX, startY, druppelDia;
  
  Druppel(){
    xSpeedDruppel = 4;
    startX = player.posPlayer.x;
    startY = player.posPlayer.y;
    druppelDia = 10;
  }
  
  void druppelUpdate(){
    startX += xSpeedDruppel;
  }
  
  void draw(){
    fill(0, 0, 255);
    circle(startX, startY, druppelDia);
  }
}
