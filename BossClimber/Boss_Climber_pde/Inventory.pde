class Inventory {
  int breedte = width/13;
  int hoogte = height/12;
  PImage shieldF /*shield front*/, shieldB /*shield back*/, sword, waterflesI /*I staat erachter omdat anders de pickedUp ding raar doet*/;

  void setup() {
    shieldF = loadImage("Shield - Front.png");
    shieldB = loadImage("Shield - Back.png");
    sword = loadImage("Sword.png");
    waterflesI = loadImage("Waterfles.png");
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

      if (inventoryFull) {
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
          image(waterflesI, width-(breedte/4 * 2.8), height-(hoogte * 2.4), 10, 40);
        //rect(width-(breedte/4 * 2.8), height-(hoogte * 2.4), 10, 40);
          rect(width-35, height-35, 10, 40);
        inventoryFull = true;
      } else {
        inventoryFull = false;
      }

      if (schild.pickedUp) {
        rectMode(CENTER);
        noStroke();
        fill(255, 0, 0);
          image(shieldF, width-breedte, height-(hoogte * 2.5), 30, 40);
        //rect(width-breedte, height-(hoogte * 2.5), 30, 40);
          rect(width-35, height-35, 30, 40);
        inventoryFull = true;
      } else {
        inventoryFull = false;
      }
    }
  }
}
