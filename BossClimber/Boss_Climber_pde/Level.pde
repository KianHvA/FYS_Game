//Tigo
class Level {
  float background = 0;
  int NPLATFORM = 4;
  PImage lavaImg;
  PImage lavaSlicedImg0;
  PImage lavaSlicedImg1;
  PImage lavaSlicedImg2;
  PImage lavaSlicedImg3;
  PImage lavaSlicedImg4;
  PImage lavaSlicedImg5;
  PImage lavaSlicedImg6;
  PImage lavaSlicedImg7;
  PImage lavaSlicedImg8;
  PImage lavaSlicedImg9;
  PImage lavaSlicedImg10;


  void setup() {
    lavaImg = loadImage("lava.png");
    lavaSlicedImg0 = loadImage("Lava_Sliced/lava_01.png");
    lavaSlicedImg1 = loadImage("Lava_Sliced/lava_02.png");
    lavaSlicedImg2 = loadImage("Lava_Sliced/lava_03.png");
    lavaSlicedImg3 = loadImage("Lava_Sliced/lava_04.png");
    lavaSlicedImg4 = loadImage("Lava_Sliced/lava_05.png");
    lavaSlicedImg5 = loadImage("Lava_Sliced/lava_06.png");
    lavaSlicedImg6 = loadImage("Lava_Sliced/lava_07.png");
    lavaSlicedImg7 = loadImage("Lava_Sliced/lava_08.png");
    lavaSlicedImg8 = loadImage("Lava_Sliced/lava_09.png");
    lavaSlicedImg9 = loadImage("Lava_Sliced/lava_10.png");
    lavaSlicedImg10 = loadImage("Lava_Sliced/lava_11.png");


    //size(800, 600);
    background (background);
    platforms.draw();
  }
  void draw() {
    if (On) {
      platforms.draw();
    }
    muur();
  }
}
