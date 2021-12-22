//Tigo
//platforms hoger laten spawnen

class Platform { 
  final int RIGHTPLATFORM_DISTANCE_FROM_WALL = 85;
  final int DRAGON_HEALTH = 3;
  final int BOSSROOM_TRIGGER = 4;
  final int DRAGON_HEALTH_REGEN_TRIGGER = 5;
  int NPLATFORMS = 100;
  Platform platforms;
  int startZ = 801;
  int startY = 660;
  float newZ;
  float newY;
  float levelMove;
  float w = 200;
  float h = 15; 
  int platformThickness = 25;
  float rGet = random(1, 5);
  int i = 0;
  int j = 0;
  int ySpeed = 10;
  int seeScoreStageCount = 100;
  boolean moveStage = false;
  int startMoveAmount = 1;
  int moveAmount = 3;
  int maxMoveAmount = 20;
  PVector[] vertexesL= new PVector[30];
  PVector[] vertexesR= new PVector[30];
  float moveY = 0;
  boolean drawBossRoom = false;
  boolean seeScoreStage = false;
  float finalMoveAmount = 0;

  void draw() {
    if (player.posPlayer.y <= moveY && !dragon.fight) {
      player.moveLeft = true;
      player.moveRight = false;
      moveStage = true;
      player.posPlayer.y = -10;
      player.posPlayer.x = width - width / 6;
    }
    if (moveStage) {
      levelMove++;
      seeScoreStage = true;
      scoreHandler.score += 1;
    }
    if (levelMove >= 600) {
      scoreHandler.score((int)random(10, 30) * (int)levelMove);
      moveStage = false;
      moveAmount++;
      levelMove = 0;
      println(moveAmount);
    }
    if (moveAmount == maxMoveAmount) {
      moveAmount = startMoveAmount;
    }
    if (moveAmount % BOSSROOM_TRIGGER == 0) {
      drawBossRoom = true;
      //Bossplatform();
      //dragon.bossFight.startFight();
      //dragon.bossFight.startFight();
    }
    if (moveAmount % DRAGON_HEALTH_REGEN_TRIGGER == 0) {
      dragon.dragonHealth = DRAGON_HEALTH;
    }
    levelMove += 0.01;
    newZ = startZ + levelMove; 
    newY = startY + levelMove; 
    //links boven = 1 
    //links onder = 2 
    //rechts onder = 3 
    //rechts boven = 4
    float x1 = width/12;
    float x2 = width/2;
    float platColor = 147;

    fill(platColor);

    for (float y = newY; y>-200; y = y- 200) {
      float y1= y + 25;
      float y2 = y1 + 25;

      noStroke();
      fill(147, 147, 147);
      quad(x1, y, x1, y1, x2+120, y2+platformThickness, x2+120, y1+platformThickness);
      if (bossFightRoom) {
        x2--;
      }
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

    for (float z = newZ; z>-200; z = z- 200) {//rechterplatform
      fill(147, 147, 147);
      quad(x2-120, z, x2-120, z+25, width-RIGHTPLATFORM_DISTANCE_FROM_WALL, z, width-RIGHTPLATFORM_DISTANCE_FROM_WALL, z-25);
      if (bossFightRoom) {
        x2++;
      }

      if (j == vertexesR.length) {
        j = 0;
      }
      vertexesR[j] = new PVector(width-RIGHTPLATFORM_DISTANCE_FROM_WALL, z-platformThickness);
      vertexesR[j + 1] = new PVector(x2-120, z);
      vertexesR[j + 2] = new PVector(x2-120, z+platformThickness);
      vertexesR[j + 3] = new PVector(width-RIGHTPLATFORM_DISTANCE_FROM_WALL, z);
      vertexesR[j + 4] = new PVector(width-RIGHTPLATFORM_DISTANCE_FROM_WALL, z-platformThickness);
      j += 5;
      fill(147, 147, 147);
      dragon.bossFight.End();
      if (drawBossRoom) { 
        Bossplatform();
        dragon.bossFight.End();
      }
      if (health.dead) finalMoveAmount = moveAmount;
    }
    
    if (seeScoreStage){
      seeScoreStageCount--;
      fill(255);
      textSize(30);
      text("+ 587", player.posPlayer.x, player.posPlayer.y - 40);
    }
    
    if (seeScoreStageCount < 0){
      seeScoreStage = false;
      seeScoreStageCount = 100;
    }
  }
}
