class Inventory {
  int breedte = width/13;
  int hoogte = height/12;



  void draw() {
    stroke(200);
    strokeWeight(4);
    fill(0);
    ellipseMode(CORNER);
    ellipse(width-breedte, height-(hoogte * 2.5), 50, 50);

    if (Doublejump.pickedUp) {
      rectMode(CORNER);
      noStroke();
      fill(147);
      rect(width-breedte, height-(hoogte * 2.5), 50, 50);
    }
    if (waterfles.pickedUp) {
      rectMode(CORNER);
      noStroke();
      fill(0,0, 255);
      rect(width-(breedte/4 * 2.8), height-(hoogte * 2.4), 10, 40);
    }
  }
}
