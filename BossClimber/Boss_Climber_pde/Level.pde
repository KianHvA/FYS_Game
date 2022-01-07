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
    lavaSlicedImg0 = loadImage("Lava_Sliced.lava01");
    lavaSlicedImg1 = loadImage("Lava_Sliced.lava02");
    lavaSlicedImg2 = loadImage("Lava_Sliced.lava03");
    lavaSlicedImg3 = loadImage("Lava_Sliced.lava04");
    lavaSlicedImg4 = loadImage("Lava_Sliced.lava05");
    lavaSlicedImg5 = loadImage("Lava_Sliced.lava06");
    lavaSlicedImg6 = loadImage("Lava_Sliced.lava07");
    lavaSlicedImg7 = loadImage("Lava_Sliced.lava08");
    lavaSlicedImg8 = loadImage("Lava_Sliced.lava09");
    lavaSlicedImg9 = loadImage("Lava_Sliced.lava10");
    lavaSlicedImg10 = loadImage("Lava_Sliced.lava11");


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
