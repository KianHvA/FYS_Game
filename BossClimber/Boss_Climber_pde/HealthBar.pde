class Health {  
  PFont f = createFont("Arial", 16, true); // Arial, 16 point, anti-aliasing on;
  float invincible;
  boolean hit;

  void update() {
    if (hit == true) invincible++;
    if (invincible == 90) hit = false;
    for (int i =0; i != fireballs.length; i++) {
      if (vlammenwerper.hasCollision && !hit || fireballs[i].hasCollision && !hit) {
        hit = true;
        healthbar.health -= 50;
      }
    }
  }

  void draw() {
    if (healthbar.health < 1) {
      println("hoi");
      rectMode(CENTER);
      fill(0);
      rect(width/2, height/2, width, height);
      textFont(f, 36);
      fill(255);
      text("GAME OVER", width/2, height/2);
    }
  }
}





class HealthBar {  //class + naam van de class (Zoals bovenaan staat)//

  float x, y, w, h;
  float health = 100;
  HealthBar(float Tx, float Ty, float Tw, float Th ) {
    this.x = Tx;
    this.y = Ty;
    this.w = Tw;
    this.h = Th;
  }

  void draw() {
    health = constrain(health, 0, 100);
    noFill();
    stroke(255);
    rect(x, y, w, h);

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
