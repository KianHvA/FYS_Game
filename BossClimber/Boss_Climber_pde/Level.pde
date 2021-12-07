//Tigo
class Level {
  int NPLATFORM = 4;


  void setup() {
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
