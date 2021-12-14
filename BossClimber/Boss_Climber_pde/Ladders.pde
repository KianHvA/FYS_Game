//Tigo
//zorgen dat er nieuwe ladders en ladder lijnen spawnen.

void ladders() {
  for (float z = 805; z>0; z = z- 200) {//linkerladders
  float newZ = z+platforms.levelMove;
    stroke(172, 175, 19);
    strokeWeight(5);
    line(width/2-117, newZ, width/2-118, newZ+90);
    line(width/2-99, newZ, width/2-100, newZ+90);
   
    rectMode(CORNERS);
    fill(0);
    rect(width/2-118, newZ, width/2-100, newZ+95); //rect voor collisions
   
    for (float a = 500; a>0; a=a-10) {//lijnen voor de linker ladders
      if (a<100||a>200 && a<300||a>400 && a<500) {
        float newA = a+platforms.levelMove;
        line(width/2-118, newA, width/2-100, newA);
      }
    }
  }

  for (float i = 805; i>0; i=i-200) {//rechterladders
  float newI = i+platforms.levelMove;
    line(width/2+117, newI, width/2+117, newI-90);
    line(width/2+99, newI, width/2+99, newI-90);
    
    rectMode(CORNERS);
    fill(0);
    rect(width/2+117, newI, width/2+99, newI-90);//rect voor collisions
    
    for (float b = 600; b>110; b=b-10) {//lijnen voor de rechterladders
      if (b>100 && b<200||b>310 && b<400||b>510 && b<600) {
        float newB = b+platforms.levelMove;
        line(width/2+117, newB, width/2+99, newB);
      }
    }
  }
}
