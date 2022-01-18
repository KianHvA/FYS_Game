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

float playerPosRect = 15;
float playerPosReset = 40;
float background;
float xPosRect = 0;
float xPosRect1 = 1;
float rectClosingNumber = 100;
float yPosRect = 50;
float yPosLava = 10;
float yPosLava1 = 100;
boolean bossFightRoom = false;
int lavaNumber = 78;
int lavaCenter = 39; // picture width/2 so the picture is not in the center
int randomNumber = 0;
int randomNumber1= 1;
int randomNumber2 = 2;

int totalTime = 100; //100 frames * 60 fps = 6000 milliseconds
int savedTime;
int savedTime2;
int savedTime3;
boolean timer = false;
boolean timer2 = false;
boolean timer3 = false;

int lavaY = 0;
boolean lavaTrigger = false;
int randomNumberLava;
int randomNumberLava1;
int randomNumberLava2;
int minLava=0;
int maxLava=10;
int maxLavaLength = 100;
float greyColor = 147; 
int wallGetal = 12;
float exclamationHeight = 200;
float exclamationNumber = 8;
float exclamationSize = 200;
float exclamationR = 255;
float exclamationGB = 0;
float LavaY2 = 200;
float lavaImgHeight = 55;
boolean lavaUp = false;
boolean lavaDown = false;


void Bossplatform() {
  dragon.healthbarDragon.draw();
  dragon.fight = bossFightRoom;
  //if (Platform.draw.moveAmount) {
  fill(greyColor);
  //background(0);
  rectMode(CORNER);
  rect(xPosRect, height-yPosRect, xPosRect1, height);//platform in bossroom
  xPosRect1 = xPosRect1 + rectClosingNumber;
  noStroke();
  fill(#FAB800);
  wall();

  bossFightRoom = true;
  if (bossFightRoom) {
    On = false; // the normal level gets turned off
    BossFightLava();
  }


  //for collision
  //change vertexes in both arrays to match the bossplatform
  for (int i = 0; i < platforms.vertexesL.length; i += 5) {
    platforms.vertexesL[i] = new PVector(xPosRect, height-yPosRect);
    platforms.vertexesL[i+1] = new PVector(xPosRect1, height-yPosRect);
    platforms.vertexesL[i+2] = new PVector(xPosRect, height);
    platforms.vertexesL[i+3] = new PVector(xPosRect1, height);
    platforms.vertexesL[i+4] = new PVector(xPosRect, height-yPosRect);
  }
  for (int i = 0; i < platforms.vertexesR.length; i += 5) {
    platforms.vertexesR[i] = new PVector(xPosRect, height-yPosRect);
    platforms.vertexesR[i+1] = new PVector(xPosRect1, height-yPosRect);
    platforms.vertexesR[i+2] = new PVector(xPosRect, height);
    platforms.vertexesR[i+3] = new PVector(xPosRect1, height);
    platforms.vertexesR[i+4] = new PVector(xPosRect, height-yPosRect);
  }

  if (player.posPlayer.y>height-playerPosRect && bossFightRoom)
  {
    player.posPlayer.y=height-playerPosReset;
  }
}

void BossFightLava() {
  fill(#FAB800);
  //in the next lines of code there are 3 timers and 3 random numbers these are used for spawning lava
  if (!timer) {
    int passedTime = savedTime++;

    if (passedTime > 10) {

      timer = true;
      timer2 = false;
      timer3 = false;
      savedTime = 0;

      //these 3 randomnumbers decide where to spawn lava

      randomNumber = int(random(minLava, maxLava));
      randomNumber1 = int(random(minLava, maxLava));
      if (randomNumber1==randomNumber) {
        randomNumber1=int(random(minLava, maxLava));
      }

      randomNumber2 = int(random(minLava, maxLava));
      if (randomNumber2==randomNumber1||randomNumber2==randomNumber) {
        randomNumber=int(random(minLava, maxLava));
      }
    }
  }
  //these timers are used too get time between the lava spawns and exclamation marks
  if (!timer2 && timer) { 
    int passedTime2 = savedTime2++;

    if (passedTime2 > totalTime) {

      timer2 = true;
      lavaTrigger = true;
      savedTime2 = 0;
    }
  }
  if (lavaTrigger) {
    int passedTime3 = savedTime3++;

    if (passedTime3 > totalTime) {

      lavaTrigger = false;
      timer = false;
      timer2 = false;
      savedTime3 = 0;
    }
  }

  for (int i=0; i<bossfightlava.length; i++) {

    bossfightlava[i] = width/wallGetal+(lavaNumber*i);
    //println(bossfightlava[i]);


    if (timer && !lavaTrigger) {
      //the exclamation marks will be drawn at the position where the lava spawns
      textSize(exclamationSize);
      fill(exclamationR, exclamationGB, exclamationGB);

      text("!", bossfightlava[randomNumber]+lavaCenter, height-exclamationHeight);
      text("!", bossfightlava[randomNumber1]+lavaCenter, height-exclamationHeight);
      text("!", bossfightlava[randomNumber2]+lavaCenter, height-exclamationHeight);
      println(bossfightlava[randomNumber]+exclamationNumber);


      randomNumberLava = this.randomNumber;
      randomNumberLava1 = this.randomNumber1;
      randomNumberLava2 = this.randomNumber2;
      lavaY = 0;
      lavaUp = true;
      lavaDown = false;
    }
    for (int j = 0; j<level.lavaSlicedImg.length; j++) {
      image(level.lavaSlicedImg[j], bossfightlava[j]+lavaCenter, height+lavaImgHeight, lavaNumber, LavaY2);
    }

    if (lavaTrigger) {
      //the lava spawns after the timer which triggers lavaTrigger

      image(level.lavaSlicedImg[randomNumberLava], bossfightlava[randomNumberLava]+lavaCenter, height-lavaY, lavaNumber, LavaY2);
      image(level.lavaSlicedImg[randomNumberLava1], bossfightlava[randomNumberLava1]+lavaCenter, height-lavaY, lavaNumber, LavaY2);
      image(level.lavaSlicedImg[randomNumberLava2], bossfightlava[randomNumberLava2]+lavaCenter, height-lavaY, lavaNumber, LavaY2);
      
      //the lava goes up until it reached its max height
      if (lavaUp) {
        if (lavaY<=maxLavaLength) {
          lavaY++;
        }
        //if it reached its max height the lava will go down
        if (lavaY==maxLavaLength) {
          lavaUp = false;
          lavaDown = true;
        }
      }
      if (lavaDown) {
        lavaY--;
      }
      //the lines of code below are to damage the player when they get hit by lava
      for (int j = 0; j<level.lavaSlicedImg.length; j++) {
        if (player.posPlayer.y>height-lavaY&&player.posPlayer.x<bossfightlava[randomNumberLava]+lavaNumber&&player.posPlayer.x>bossfightlava[randomNumberLava]) {
          healthbar.doDamage(100);
        } else if (player.posPlayer.y>height-lavaY&&player.posPlayer.x<bossfightlava[randomNumberLava1]+lavaNumber&&player.posPlayer.x>bossfightlava[randomNumberLava1]) {
          healthbar.doDamage(100);
        } else if (player.posPlayer.y>height-lavaY&&player.posPlayer.y>+height-lavaY+LavaY2&&player.posPlayer.x<bossfightlava[randomNumberLava2]+lavaNumber&&player.posPlayer.x>bossfightlava[randomNumberLava2]) {
          healthbar.doDamage(100);
        }
      }
    }
  }
}

//some code I made but we removed it

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
