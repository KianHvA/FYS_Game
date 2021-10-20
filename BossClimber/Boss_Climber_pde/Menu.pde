class Menu {
  PFont f = createFont("Arial", 16, true); //TypeStyle = Arial
  boolean start = false, drawn = false;
  PVector placement1 = new PVector(150, 250);

  void setup() {
    rectMode(CORNER);
    fill(125);
    rect(150, 250, 200, 100);
    rectMode(CENTER);
    textFont(f, 36); //size of the texts
    fill(255); //color
    text("Play", 220, 310);
  }

  void draw() {
    rectMode(CORNER);
    fill(125);
    rect(placement1.x, placement1.y, 200, 100);
    rectMode(CENTER);
    textFont(f, 36); //size of the texts
    fill(255); //color
    text("Play (a)", placement1.x + 70, placement1.y + 60);
    drawn = true;
    
    if (keysPressed[65]) {
      start = true;
    }
    if (start == true) {
      placement1.x = -100;
      placement1.y = -100;
    }
  }
}
