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

  void draw() {

    if (player.posPlayer.y <= moveY && !dragon.fight) {
      moveStage = true;
      player.posPlayer.y = 1;
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
    if (moveAmount % 3 == 0) {
      dragon.bossFight.startFight();
      dragon.FireballRain.spawn();
      dragon.bossFight.startFight();
    }

    newZ = 801 + levelMove + 200; 
    newY = 660 + levelMove + 200;
    if (moveAmount % 3 != 0) {
      //linksboven = 1 
      //links onder = 2 
      //rechtsonder = 3 
      //linksboven = 4
      float x1 = width/12;
      float x2 = width/2;

      fill(147, 147, 147);

      for (int y = newY; y > -200; y -= 200) {
        int y1= y + platformThickness;
        int y2 = y1 + platformThickness;

        noStroke();
        fill(147, 147, 147);
        quad(x1, y, x1, y1, x2+120, y2+platformThickness, x2+120, y1+platformThickness);
        if (i == vertexesL.length) {
          i = 0;
          quad(x1, y, x1, y1, x2+120, y2+platformThickness, x2+120, y1+platformThickness);
        }
        vertexesL[i] = new PVector(x1, y);
        vertexesL[i + 1] = new PVector(x1, y1);
        vertexesL[i + 2] = new PVector(x2+120, y2+platformThickness);
        vertexesL[i + 3] = new PVector(x2+120, y1+platformThickness);
        vertexesL[i + 4] = new PVector(x1, y);
        i += 5;
      }
      //rechterplatform
      for (int z = newZ; z>-200; z -= 200) {

        fill(147, 147, 147);
        quad(x2-120, z, x2-120, z+25, width-66, z, width-66, z-25);
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

        //Bossplatform();
      }
    } else //this happends when boss fight is happening to set up the stage
    {
      quad(0, height-5, 0, height, width, height-5, width, height);
      for (int i = 0; i < vertexesL.length; i+=5) {
        vertexesL[i] = new PVector(0, height-5);
        vertexesL[i + 1] = new PVector(0, height);
        vertexesL[i + 2] = new PVector(width, height-5);
        vertexesL[i + 3] = new PVector(x2+120, y1+platformThickness);
        vertexesL[i + 4] = new PVector(0, height-5);
      }
    }
  }
  void update() {
  }
}
