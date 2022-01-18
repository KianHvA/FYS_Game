//Tristan:  Inventory display
//Fee Fee: Inventory full
//Ömer: Sword implementation
class Inventory {
  PImage shieldF /*shield front*/, shieldB /*shield back*/, swordI, waterflesI /*I staat erachter omdat anders de pickedUp ding raar doet*/;
  PImage shieldOutline, swordIOutline, waterflesIOutline /*Outlines for the powerups*/;
  final int CORRECTION1 = 60;
  final int YELLIPSE1 = 50;
  final int CORRECTION2 = 52;
  final int CORRECTION3 = 55;
  final int YELLIPSE2 = 35;
  final int YELLIPSE3 = 40;
  final int CORRECTION4 = 54;
  final int CORRECTION5 = 45;
  final int CORRECTION6 = 55;
  final int YELLIPSE4 = 15;


  void setup() {
    //Loading of all the pictures
    shieldF = loadImage("Shield - Front.png");
    shieldB = loadImage("Shield - Back.png");
    swordI = loadImage("Sword.png");
    waterflesI = loadImage("Waterfles.png");

    shieldOutline = loadImage("ShieldOutline.png");
    swordIOutline = loadImage("SwordOutline.png");
    waterflesIOutline = loadImage("WaterflesOutline.png");
  }

  void draw() {
    //Making the stroke extra thick so it stands out more on the side.
    stroke(200);
    strokeWeight(4);
    //Drawing the inventory ellips in which the powerups will be displayed.
    ellipseMode(CORNER);
    textAlign(CENTER, CENTER);
    fill(0);
    ellipse(width - CORRECTION1, height - CORRECTION1, YELLIPSE1, YELLIPSE1);
    
    //We just draw a new picture inside the ellipse so that the player notices that he/she grabbed it.
    if (waterBottle.pickedUp) {//Inventory code for the waterbottle.
      rectMode(CENTER);
      noStroke();
      fill(0, 0, 255);
      image(waterflesI, width - CORRECTION2, height - CORRECTION3, YELLIPSE2, YELLIPSE3);
    
    if (schild.pickedUp) {//Inventory code for the shield.
      rectMode(CENTER);
      noStroke();
      fill(255, 0, 0);
      image(shieldF, width - CORRECTION2, height - CORRECTION4, YELLIPSE2, YELLIPSE3);
    
    if (sword.pickedUp) {//Inventory code for the sword.
      rectMode(CENTER);
      noStroke();
      fill(255, 0, 0);
      image(swordI, width - CORRECTION5, height - CORRECTION5, YELLIPSE4, YELLIPSE1);
    }
  }
}
