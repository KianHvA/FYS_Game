class Inventory {
  int breedte = width/13;
  int hoogte = height/12;



  void draw() {
    stroke(200);
    strokeWeight(4);
    
    ellipseMode(CORNER);
    textAlign(CENTER, CENTER);
    fill(255);
    text("S", width-breedte, height-(hoogte * 2.5));
    fill(0);
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
      fill(0, 0, 255);
      rect(width-(breedte/4 * 2.8), height-(hoogte * 2.4), 10, 40);
    }
    if (schild.pickedUp) {
      rectMode(CORNER);
      noStroke();
      fill(255, 0, 0);
      rect(width-breedte, height-(hoogte * 2.5), 30, 40);
    }
  }
}
