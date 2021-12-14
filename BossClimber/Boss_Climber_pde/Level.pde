//Tigo
class Level {
  int NPLATFORM = 4;
   PImage lavaImg;

  void setup() {
    lavaImg = loadImage("lava.png");
    //size(800, 600);
    background (0);
    platforms.draw();
  }
  void draw() {
    if (On) {
      platforms.draw();
    }
    muur();
  }
}
