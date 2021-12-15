//Tigo
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
final int START_AMOUNT_OF_PLATFORMS = 0;
final int MAX_AMOUNT_OF_PLATFORMS = 5;

float xxpos = 1;
float xxposMove = 10;
float playerUp = height-15;
float playerYPos = height-40;
boolean bossFightRoom = false;
float c = 147; //platform kleur
float platThick = 20;
float xPos1 = 0;


void Bossplatform() {
  dragon.fight = bossFightRoom;
  //if (Platform.draw.moveAmount) {
  fill(c);
  rectMode(CORNER);
  rect(xPos1, height-platThick, xxpos, height);
  xxpos = xxpos + xxposMove;
  muur();
  bossFightRoom = true;
  if (bossFightRoom) {
    On = false;
  }

  //for collision
  //change vertexes in both arrays to match the bossplatform
  for (int i = START_AMOUNT_OF_PLATFORMS; i < platforms.vertexesL.length; i += MAX_AMOUNT_OF_PLATFORMS) {
    platforms.vertexesL[i] = new PVector(xPos1, height-platThick);
    platforms.vertexesL[i+1] = new PVector(xxpos, height-platThick);
    platforms.vertexesL[i+2] = new PVector(xPos1, height);
    platforms.vertexesL[i+3] = new PVector(xxpos, height);
    platforms.vertexesL[i+4] = new PVector(xPos1, height-platThick);
  }
  for (int i = START_AMOUNT_OF_PLATFORMS; i < platforms.vertexesR.length; i += MAX_AMOUNT_OF_PLATFORMS) {
    platforms.vertexesR[i] = new PVector(xPos1, height-platThick);
    platforms.vertexesR[i+1] = new PVector(xxpos, height-platThick);
    platforms.vertexesR[i+2] = new PVector(xPos1, height);
    platforms.vertexesR[i+3] = new PVector(xxpos, height);
    platforms.vertexesR[i+4] = new PVector(xPos1, height-platThick);
  }

  if (player.posPlayer.y>playerUp && bossFightRoom)
  {
    player.posPlayer.y=playerYPos;
  }
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
