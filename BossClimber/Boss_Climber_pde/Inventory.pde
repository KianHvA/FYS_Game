//Tristan:  Inventory display
//Fee Fee: Inventory full
//Ömer: Zwaard inplementatie
class Inventory {
  int breedte = width/13;
  int hoogte = height/12;
  PImage shieldF /*shield front*/, shieldB /*shield back*/, swordI, doubleJump, waterflesI /*I staat erachter omdat anders de pickedUp ding raar doet*/;
  boolean inventoryFull = false;

  void setup() {
    shieldF = loadImage("Shield - Front.png");
    shieldB = loadImage("Shield - Back.png");
    swordI = loadImage("Sword.png");
    waterflesI = loadImage("Waterfles.png");
    doubleJump = loadImage("Jump - Boost.png");
  }
  
  void draw() {
    stroke(200);
    strokeWeight(4);

    ellipseMode(CORNER);
    textAlign(CENTER, CENTER);
    //fill(255);
    //text("S", width-55, height-70);
    fill(0);
    ellipse(width-60, height-60, 50, 50);

    if (inventoryFull) {
      //println("Full");
    } else {
      //println("Empty");
    }


    //if (Doublejump.pickedUp) {
    //  rectMode(CENTER);
    //  noStroke();
    //  fill(147);
    //  imageMode(CENTER);
    //  image(doubleJump, width-35, height-35, 40, 50);
    //  //rect(width-35, height-35, 50, 50);
    //  inventoryFull = true;
    //  //schild.pickedUp = false;
    //  //sword.pickedUp = false;
    //  //waterfles.pickedUp = false;
    //} else {
    //  inventoryFull = false;
    //}

    if (waterfles.pickedUp) {
      rectMode(CENTER);
      noStroke();
      fill(0, 0, 255);
      image(waterflesI, width-52, height-55, 35, 40);
      //rect(width-35, height-35, 10, 40);
      inventoryFull = true;
      //schild.pickedUp = false;
      //sword.pickedUp = false;
      //Doublejump.pickedUp = false;
    } else {
      inventoryFull = false;
    }

    if (schild.pickedUp) {
      rectMode(CENTER);
      noStroke();
      fill(255, 0, 0);
      image(shieldF, width-52, height-54, 35, 40);
      //rect(width-breedte, height-(hoogte * 2.5), 30, 40);
      //rect(width-35, height-35, 30, 40);
      inventoryFull = true;
      //sword.pickedUp = false;
      //Doublejump.pickedUp = false;
      //waterfles.pickedUp = false;
    } else {
      inventoryFull = false;
    }
    
     if (sword.pickedUp) {
      rectMode(CENTER);
      noStroke();
      fill(255, 0, 0);
      image(swordI, width-45, height-55, 15, 50);
      inventoryFull = true;
      //schild.pickedUp = false;
      //Doublejump.pickedUp = false;
      //waterfles.pickedUp = false;
    } else {
      inventoryFull = false;
    }
    
  }
}
