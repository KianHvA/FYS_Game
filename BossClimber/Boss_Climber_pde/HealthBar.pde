class HealthBar {

  void draw() {
    background(0);
    noFill();
    stroke(255);
    rect(50, 70, 400, 50);
    
    colorMode(RGB, 150);
    float c = map(mouseX, 0, width, 0, 400);
    float d = map(mouseX, 0, width/2, 0, 255);
    float f = map(mouseX, 0, 2*width/2, 255, 0);
    fill(f, d, 0);
    noStroke();
    rect(51, 71, c, 49);
    colorMode(RGB, 400);
  }
}
