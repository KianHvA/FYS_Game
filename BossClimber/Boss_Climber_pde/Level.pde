class Level {
  Platform [] platform;// array om platformen te maken
  int NPLATFORM = 4;


  void setup() {
    size(800, 600);
    platform = new Platform[NPLATFORM];
    for (int i=0; i<NPLATFORM; i++) {
      platform[i] = new Platform();
      background (0);
    }
  }
  void draw() {

    for (int i = 0; i < NPLATFORM; i++) {
      ladders();
      platform[i].teken();
      muur();
    }
  }
}
