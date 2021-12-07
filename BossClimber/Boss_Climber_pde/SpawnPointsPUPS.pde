//Kian, Tristan
class SpawnPointsPUPS {
  //spawning locations Powerups
  PVector underL = new PVector(650, 450);
  PVector underR = new PVector(100, 400);
  PVector upperL = new PVector(650, 100);
  PVector upperR = new PVector(100, 200);
  int random = 0;
  PVector location = new PVector(0, 0);
  void update() {
    if (!dragon.fight) {
      random = (int)random(1, 4);
      if (random == 1) {
        location = underL;
      } else if (random == 2) {
        location = underR;
      } else if (random == 3) {
        location = upperL;
      } else if (random == 4) {
        location = upperR;
      }
    } else {
      random = (int)random(1, 2);
      if (random == 1) {
        location = underL;
      } else if (random == 2) {
        location = underR;
      }
    }
  }
}
