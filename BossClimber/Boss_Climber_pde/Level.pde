class Level {
  int NPLATFORM = 4;


  void setup() {
    size(800, 600);
      background (0);
      platforms.draw();
  }
  void draw() {
      ladders();
      platforms.draw();
      muur();
  }
}
