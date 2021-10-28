//platforms hoger laten spawnen

class Platform { 
  int NPLATFORMS = 100;
  Platform platforms;
  int newZ;
  int newY;
  int levelMove;
  float w = 200;
  float h = 15; 
  float platformThickness = 25;
  float rGet = random(1, 5);
  PVector[] vertexesL = new PVector[20];
  PVector[] vertexesR = new PVector[40];
  int i = 0;
  int j = 0;
  int ySpeed = 10;
  boolean moveStage;
  int moveAmount;

  void draw() {


    if (player.posPlayer.y <= bpY) {
      moveStage = true;
    }
    if (moveStage) {
      levelMove++;
      
    }
    if (levelMove >= 600) {
      
      moveStage = false;
      moveAmount++;
      levelMove = 0;
      //println(moveAmount);
    }

    //if ((player.posPlayer.y >= bpY-20) && (player.posPlayer.y <=bpY+bpH)&&(player.posPlayer.x >=bpX)&&(player.posPlayer.x<=bpX+bpW)) {
    //  levelMove++;
    //}
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
      //if (mouseY <= 50){levelMove = 200;}
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
      for (int z = newZ; z>0; z = z- 200) {//rechterplatform
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

        Bossplatform();
      }
    }
  }
  void update() {
    //if (posPlayer.x < 300 && posplayer.y >100){
    //}
  }
}



//class Platform { 
//  int NPLATFORMS = 100;
//  Platform platforms;
//  float x = random(200, 550); 
//  float y = random(200, 550); 
//  float w = 200;
//  float h = 15; 
//  float platformThickness = 25;
//  float rGet = random(1, 5);
//  PVector[] vertexesL = new PVector[10];
//  PVector[] vertexesR = new PVector[20];
//  int i = 0;
//  int j = 0;
//  int ySpeed = 10;
//  int z = 801;

//  void draw() {
//    //linksboven = 1 
//    //links onder = 2 
//    //rechtsonder = 3 
//    //linksboven = 4
//    float x1 = width/12;
//    float x2 = width/2;

//    fill(147, 147, 147);
//    Bossplatform();

//    for (int y = 260; y>=260; y = y+ 200) {
//      if (mouseY<100) {
//        y++;
//      }
//      int y1= y + 25;
//      int y2 = y1 + 25;
//      //if(mouseY<100){y=y+10;}
//      noStroke();
//      if (y<1000) {
//        quad(x1, y, x1, y1, x2+120, y2+platformThickness, x2+120, y1+platformThickness);
//        if (i == vertexesL.length) {
//          i = 0;
//          quad(x1, y, x1, y1, x2+120, y2+platformThickness, x2+120, y1+platformThickness);
//          //if(mouseY<100){y=y+10;}
//        }
//        vertexesL[i] = new PVector(x1, y);
//        vertexesL[i + 1] = new PVector(x1, y1);
//        vertexesL[i + 2] = new PVector(x2+120, y2+platformThickness);
//        vertexesL[i + 3] = new PVector(x2+120, y1+platformThickness);
//        vertexesL[i + 4] = new PVector(x1, y);
//        i += 5;

//        for (int z = 1; z>0; z = z+ 200) {//rechterplatform

//          if (z<1000) {
//            quad(x2-120, z, x2-120, z+25, width-66, z, width-66, z-25);
//          }

//          if (j == vertexesR.length) {
//            j = 0;
//          }
//          vertexesR[j] = new PVector(width-66, z-platformThickness);
//          vertexesR[j + 1] = new PVector(x2-120, z);
//          vertexesR[j + 2] = new PVector(x2-120, z+platformThickness);
//          vertexesR[j + 3] = new PVector(width-66, z);
//          vertexesR[j + 4] = new PVector(width-66, z-platformThickness);
//          j += 5;
//        }
//      }
//    }
//  }
//  void platforms() {
//  }
//}
