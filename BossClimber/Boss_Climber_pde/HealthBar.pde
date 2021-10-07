class HealthBar {  //class + naam van de class (Zoals bovenaan staat)//

  float x,y,w,h;
  HealthBar(float Tx, float Ty ,float Tw, float Th ) {
    this.x = Tx;
    this.y = Ty;
    this.w = Tw;
    this.h = Th;
  }
  float health;

  void draw() {
    health = 100;
    health = constrain(health, 0, 100);
    noFill();
    stroke(255);
    rect(x,y,w,h);

    colorMode(RGB, 150);
    float c = map(health, 0, 100, 0, w);
    float d = map(health, 0, 100/2, 0, 255);
    float f = map(health, 0, 100, 255, 0);
    fill(f, d, 0);
    noStroke();
    rect(x+1, y+1, c, h-1);
    colorMode(RGB, 400);
  }
}
