class Inventory {
  int breedte = width/13;
  int hoogte = height/12;

  boolean inventoryFull = false;


  void draw() {
    stroke(200);
    strokeWeight(4);

    ellipseMode(CORNER);
    textAlign(CENTER, CENTER);
    fill(255);
    text("S", width-55, height-70);
    fill(0);
    ellipse(width-60, height-60, 50, 50);
    
    if (inventoryFull){
      println("Full");
    } else {
      println("Empty");
    }
    

    if (Doublejump.pickedUp) {
      rectMode(CENTER);
      noStroke();
      fill(147);
      rect(width-35, height-35, 50, 50);
      inventoryFull = true;
    } else {
      inventoryFull = false;
    }
    
    if (waterfles.pickedUp) {
      rectMode(CENTER);
      noStroke();
      fill(0, 0, 255);
      rect(width-35, height-35, 10, 40);
      inventoryFull = true;
    }else {
      inventoryFull = false;
    }
    
    if (schild.pickedUp) {
      rectMode(CENTER);
      noStroke();
      fill(255, 0, 0);
      rect(width-35, height-35, 30, 40);
      inventoryFull = true;
    }else {
      inventoryFull = false;
    }
  }
}
