class Platform { 
  int NPLATFORMS = 100;
  Platform platforms;
  float x = random(200, 550); 
  float y = random(200, 550); 
  float w = 200;
  float h = 15; 
  float rGet = random(1, 5);
  PVector[] Vertexes = new PVector[64];

  void draw() {
    //linksboven = 1 
    //links onder = 2 
    //rechtsonder = 3 
    //linksboven = 4
    float x1 = width/12;
    float x2 = width/2;
    fill(147, 147, 147);
    Bossplatform();
    for (int y = 660; y>150; y = y- 200) {
      int y1= y +25;
      int y2 = y1 + 25;
      noStroke();
      quad(x1, y, x1, y1, x2+120, y2+25, x2+120, y1+25);
      for (int i = 0; i < Vertexes.length; i = i + 4) {
        Vertexes[i] = new PVector(x1, y);
        Vertexes[i + 1] = new PVector(x1, y1);
        Vertexes[i + 2] = new PVector(x2+120, y2+25);
        Vertexes[i + 3] = new PVector(x2+120, y1+25);
      }
      for (int z = 801; z>0; z = z- 200) {//rechterplatform
        quad(x2-120, z, x2-120, z+25, width-66, z, width-66, z-25);
      }
    }
  }
}
