//Tigo
class Level {
  float background = 0;
  int NPLATFORM = 4;
  PImage lavaImg;
  PImage[] lavaSlicedImg = new PImage[11];


  void setup() {
    lavaImg = loadImage("lava.png");
    lavaSlicedImg[0] = loadImage("Lava_Sliced/lava_01.png");
    lavaSlicedImg[1] = loadImage("Lava_Sliced/lava_02.png");
    lavaSlicedImg[2] = loadImage("Lava_Sliced/lava_03.png");
    lavaSlicedImg[3] = loadImage("Lava_Sliced/lava_04.png");
    lavaSlicedImg[4] = loadImage("Lava_Sliced/lava_05.png");
    lavaSlicedImg[5] = loadImage("Lava_Sliced/lava_06.png");
    lavaSlicedImg[6] = loadImage("Lava_Sliced/lava_07.png");
    lavaSlicedImg[7] = loadImage("Lava_Sliced/lava_08.png");
    lavaSlicedImg[8] = loadImage("Lava_Sliced/lava_09.png");
    lavaSlicedImg[9] = loadImage("Lava_Sliced/lava_10.png");
    lavaSlicedImg[10] = loadImage("Lava_Sliced/lava_11.png");


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
