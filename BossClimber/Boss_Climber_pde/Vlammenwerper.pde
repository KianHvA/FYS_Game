class Vlammenwerper {
  PVector source = new PVector(platforms.x/random(1, 5), platforms.y + platforms.platformThickness/2);
  PVector[] spawn = new PVector[20];
  float x1 = width/12, x2 = width/12;
  int i = 0;

  void setup() {
    for (int y = 660; y>150; y = y- 200) {
      int y1= y + 25;
      int y2 = y1 + 25;
      noStroke();
      quad(x1, y, x1, y1, x2+120, y2+platforms.platformThickness, x2+120, y1+platforms.platformThickness);
    }
  }
}
