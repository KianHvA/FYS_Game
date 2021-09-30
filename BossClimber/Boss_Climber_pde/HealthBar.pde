class HealthBar {  //class + naam van de class (Zoals bovenaan staat)//

float health;

  void draw() {
    health = 100;
    health = constrain(health, 0, 100);
    background(0);
    noFill();
    stroke(255);
    rect(50, 70, 400, 50);
    
    colorMode(RGB, 150);
    float c = map(health, 0, 100, 0, 400);
    float d = map(health, 0, 100/2, 0, 255);
    float f = map(health, 0, 100, 255, 0);
    fill(f, d, 0);
    noStroke();
    rect(51, 71, c, 49);
    colorMode(RGB, 400);
  }
}
