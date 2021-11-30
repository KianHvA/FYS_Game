// Welkom in de bossplatform class in deze class word de boss room gemaakt.

//int bpX, bpY, bpW, bpH;


//int x1 = width/12;
//int x2 = width/2;
//int rw = 200;
//int rh = 25;
//int ry = 3*rh;
//int qx1 = x1+rw;
//int qh = ry+rh;
//int qh2 = qh+rh;
//PVector[] vertexesBossPlatform = new PVector[8];
//int newX1, newX2, newRW, newRH, newRY, newQX1, newQH, newQH2;
//int levelMove = 0;
float xxpos = 1;
boolean bossFightRoom = false;
void Bossplatform() {

  //if (Platform.draw.moveAmount) {
    fill(147, 147, 147);
    //background(0);
    rectMode(CORNER);
    rect(0, height-20, xxpos, height);
    xxpos=xxpos+10;
    muur();
    boolean bossFightRoom=true;
    On=false;

    
 if (player.posPlayer.y<height-15 && bossFightRoom){player.posPlayer.y=height-40;}
  }
//}

//if(bossFightRoom){
//playerpos
//dragonpos
//powerups uit



//bpX = width/12;
//bpY = 50+platforms.levelMove;
//bpW = 30;
//bpH = 10;

//fill(#64ED16);
//rect(bpX, bpY, bpW, bpH);

//fill(#64ED16);
//  fill(147, 147, 147);
//  noStroke();
//  if (mouseY <= 50) {
//    levelMove++;
//  }
//  if (levelMove >= 400) {
//    levelMove = 400;
//  }
//  newRW = rw + levelMove; 
//  newRH = rh + levelMove;
//  newRY = ry + levelMove;
//  newQX1 = qx1 + levelMove;
//  newQH = qh + levelMove;
//  newQH2 = qh2+ levelMove;

//  //bewegende quads
//  quad(x1, newRY, qx1, newRY, qx1, newQH, x1, newQH);
//  quad(qx1, newRY, qx1, newQH, width/2+120, newQH2, width/2+120, newQH);

//  //statische quads
//  quad(x1, ry, qx1, ry, qx1, qh, x1, qh);


//  int i = 0;
//  vertexesBossPlatform[i] = new PVector(x1, ry);
//  vertexesBossPlatform[i+1] = new PVector(qx1, ry);
//  vertexesBossPlatform[i+2] = new PVector(qx1, qh);
//  vertexesBossPlatform[i+3] = new PVector(width/2+120, qh+rh);
//  vertexesBossPlatform[i+4] = new PVector(width/2+120, qh);
//  vertexesBossPlatform[i+5] = new PVector(qx1, ry);
//  vertexesBossPlatform[i+6] = new PVector(x1, qh);
//  vertexesBossPlatform[i+7] = new PVector(x1, ry);
