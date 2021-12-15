//Tigo
class Level {
  int NPLATFORM = 4;
  float backgroundC = 0;
   PImage lavaImg;

  void setup() {
    lavaImg = loadImage("lava.png");
    //size(800, 600);
    background (backgroundC);
    platforms.draw();
  }
  void draw() {
    if (On) {
      platforms.draw();
    }
    muur();
  }
}
