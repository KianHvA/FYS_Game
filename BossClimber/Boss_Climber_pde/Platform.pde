//platforms hoger laten spawnen

class Platform { 
  int NPLATFORMS = 100;
  Platform platforms;
  int newZ;
  int newY;
  int levelMove;
  float w = 200;
  float h = 15; 
  int platformThickness = 25;
  float rGet = random(1, 5);
  int i = 0;
  int j = 0;
  int ySpeed = 10;
  boolean moveStage = false;
  int moveAmount = 1;
  PVector[] vertexesL= new PVector[20 * moveAmount];
  PVector[] vertexesR= new PVector[20 * moveAmount];
  float moveY = 0;
  boolean drawBossRoom = false;

  void draw() {

    if (player.posPlayer.y <= moveY && !dragon.fight) {
      player.moveLeft = true;
      player.moveRight = false;
      moveStage = true;
      player.posPlayer.y = -10;
      player.posPlayer.x = 600;
    }
    if (moveStage) {
      levelMove++;
    }
    if (levelMove >= 600) {
      scoreHandler.score((int)random(10, 30) * levelMove);
      moveStage = false;
      moveAmount++;
      levelMove = 0;
      println(moveAmount);
    }
    if (moveAmount % 4 == 0) {
      drawBossRoom = true;
      //Bossplatform();
      //dragon.bossFight.startFight();
      //dragon.bossFight.startFight();
    }
    if (moveAmount % 3 == 0) {
      //dragon.FireballRain.spawn();
    }

    newZ = 801 + levelMove; 
    newY = 660 + levelMove; 
    //linksboven = 1 
    //links onder = 2 
    //rechtsonder = 3 
    //linksboven = 4
    float x1 = width/12;
    float x2 = width/2;

    fill(147, 147, 147);
    for (int y = newY; y>0; y = y- 200) {
      int y1= y + 25;
      int y2 = y1 + 25;

      noStroke();
      fill(147, 147, 147);
      quad(x1, y, x1, y1, x2+120, y2+platformThickness, x2+120, y1+platformThickness);
      if(bossFightRoom){x2--;}
      if (i == vertexesL.length) {
        i = 0;
        //quad(x1, y, x1, y1, x2+120, y2+platformThickness, x2+120, y1+platformThickness);
      }
      vertexesL[i] = new PVector(x1, y);
      vertexesL[i + 1] = new PVector(x1, y1);
      vertexesL[i + 2] = new PVector(x2+120, y2+platformThickness);
      vertexesL[i + 3] = new PVector(x2+120, y1+platformThickness);
      vertexesL[i + 4] = new PVector(x1, y);
      i += 5;
    }
    for (int z = newZ; z>0; z = z- 200) {//rechterplatform
      fill(147, 147, 147);
      quad(x2-120, z, x2-120, z+25, width-66, z, width-66, z-25);
      if(bossFightRoom){x2++;}

      if (j == vertexesR.length) {
        j = 0;
      }
      vertexesR[j] = new PVector(width-66, z-platformThickness);
      vertexesR[j + 1] = new PVector(x2-120, z);
      vertexesR[j + 2] = new PVector(x2-120, z+platformThickness);
      vertexesR[j + 3] = new PVector(width-66, z);
      vertexesR[j + 4] = new PVector(width-66, z-platformThickness);
      j += 5;
      fill(147, 147, 147);

      if (drawBossRoom) { 
        Bossplatform();
      }
    }
  }
}
