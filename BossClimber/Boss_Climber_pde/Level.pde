class Level {
  int NPLATFORM = 4;
  Platform[] platform = new Platform[NPLATFORM];;// array om platformen te maken
  


  void setup() {
    size(800, 600);
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
