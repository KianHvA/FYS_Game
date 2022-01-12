//Ömer
class Achievements {
   
   PVector text;
  PVector text2;
  PVector[] textInstr = {new PVector(50, 50), new PVector(150, 47), new PVector(50, 100), new PVector(130, 97), new PVector(50, 250), new PVector(137, 261),
                          new PVector(50, 300), new PVector(50, 330), new PVector(450, 340), new PVector(50, 400), new PVector(395, 510)};
  PVector example;
  PVector example2;
  PVector example3;
  PVector sizes;
  PVector buttonSize = new PVector(325, 75);
  PVector rect = new PVector(0, 250);
  PVector rect2 = new PVector(360, 0);
  PVector rect3 = new PVector(670, 0);
  PVector rect4 = new PVector(525, 420);
  PVector rect5 = new PVector(525, 500);
  PVector rect6 = new PVector(650, 330);
  PVector[] rectSizeHorizontal = {new PVector(325, 75), new PVector(425, 50)};
  PVector buttonText = new PVector(420, 430);
  PVector[] explainText = {new PVector (50, 150), new PVector(55, 170), new PVector(440, 150), new PVector(465, 170), new PVector(770, 190), new PVector(795, 210)};
  PVector[] posSign = {new PVector(650, 510), new PVector(width/12, 400), new PVector(width/12 * 10, 310)};
  PVector sizeSign;
  PVector rectSize;
  PVector rectSizeVertical;
  int textSize;
  float exampleSpeedX, exampleSpeedY, respawning, secondRespawn, standWidth, standHeight, imageSize, endExample, endExample2, endExample3X, endExample3Y;
  float positiveSpeed, negativeSpeed;
  boolean summary = false;
  boolean manual = false;
  boolean powerExpl = false;
  PImage moveL, moveL1, moveR, moveR1, moveUp, equip, equip1, equip2;
  boolean off = false;


   Achievements() {
    text = new PVector(50, 50);
    example = new PVector(700, 30);
    example2 = new PVector(500, 80);
    example3 = new PVector(300, 230);
    sizes = new PVector(25, 25);
    sizeSign = new PVector(80, 50);
    rectSize = new PVector(width, 25);
    rectSizeVertical = new PVector(25, 275);
    standWidth = 20;
    standHeight = 40;
    textSize = 10;
    exampleSpeedX = 2;
    exampleSpeedY = 2;
    respawning = 700;
    secondRespawn = 500;
   
   }

}
