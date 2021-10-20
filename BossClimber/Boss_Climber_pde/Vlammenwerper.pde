class Vlammenwerper {
  //PVector source = new PVector(platforms.x/random(1, 5), platforms.y + platforms.platformThickness/2);
  //PVector[] spawn = new PVector[20];
  float x1 = width/6, x2 = width/6;
  float x3 = width/6 + width/2, x4 = width/6 + width/2;
  int i = 0;
  PVector sizeVlam = new PVector(22, 80);
  float timer1 = 0, timer2 = 0;
  int distance = 660, from = 150, minus = 7;
  int  distBetween = 200, idk = 0;
  boolean live = false, hasCollision = false;

  void setup() {
    //links
    for (int y = distance; y >from; y = y - distBetween) {
      int y1 = y + minus;
      int y2 = y1 + minus;
      noStroke();
      fill(255);
      quad(x1, y, x1, y1, x2+60, y2 + (platforms.platformThickness/4), x2+60, y1 + (platforms.platformThickness/4) - 10);
    }
    //rechts 
    //for (int y = 660; y>150; y = y+ 200) {
    //  int y1= y + 7;
    //  int y2 = y1 + 7;
    //  noStroke();
    //  fill(255);
    //  quad(x3, y, x3, y1, x4+60, y2 + (platforms.platformThickness/4), x4+60, y1 + (platforms.platformThickness/4) - 10);
    //}
  }

  void draw() {
    //links
    for (int y = distance; y >from; y = y - distBetween) {
      int y1 = y + minus;
      int y2 = y1 + minus;
      noStroke();
      fill(255);
      quad(x1, y, x1, y1, x2+60, y2 + (platforms.platformThickness/4), x2+60, y1 + (platforms.platformThickness/4) - 10);
    }
  }

  void update() {
    for (int y = distance; y>from; y = y- distBetween) {
      int y1= y - 6;
      noStroke();
      if (timer2 == 0) {
        timer1++;
        //println(timer1);
      } 
      if (timer1 > 900) {
        rectMode(CENTER);
        fill(#FA9108);
        rect(x1 + width/25, y1, sizeVlam.x, sizeVlam.y);
        live = true;
        timer2++;
        timer1 = 910;
        //println(timer2);
      } 
      if (timer2 == 180) {
        timer1 = 0;
        timer2 = 0;
        live = false;
      }
      if (live) {
        collisionHandler.checkCollisionPlayer(x1, y1, sizeVlam.x);
        hasCollision = collisionHandler.hit;
      }
      if (hasCollision) idk++;
    }
  }
}
