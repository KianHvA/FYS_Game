//Dion
class Instructions {
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
  PVector posImgWater = new PVector(150, 80);
  PVector posImgShield = new PVector(500, 80);
  PVector posImgSword = new PVector(820, 70);
  PVector imgSwordSize = new PVector(20, 100);
  PVector powerTextW = new PVector(100, 50);
  PVector powerTextShield = new PVector(485, 50);
  PVector powerTextSword = new PVector(800, 50);
  PVector buttonText = new PVector(420, 430);
  PVector[] explainText = {new PVector (50, 150), new PVector(55, 170), new PVector(440, 150), new PVector(465, 170), new PVector(770, 190), new PVector(795, 210)};
  PVector[] posSign = {new PVector(650, 510), new PVector(width/12, 400), new PVector(width/12 * 10, 310)};
  PVector sizeSign;
  PVector rectSize;
  PVector rectSizeVertical;
  int textSize;
  float exampleSpeedX, exampleSpeedY, respawning, secondRespawn, standWidth, standHeight, imageSize, endExample, endExample2, endExample3X, endExample3Y;
  float positiveSpeed, negativeSpeed;
  float startTextSize;
  float instructionSize;
  boolean manual = false;
  boolean powerExpl = false;
  PImage moveL, moveL1, moveR, moveR1, moveUp, equip, equip1, equip2;
  boolean off = false;

  Instructions() {
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
    imageSize = 50;
    moveL = loadImage("JoyConLeftRight.png");
    moveL1 = loadImage("Knight - Left - Walk1.png");
    moveR1 = loadImage("Knight - Right.png");
    //moveR = loadImage("JoyConButtonA.png");
    //moveR1 = loadImage("Knight - Right - Walk1.png");
    moveUp = loadImage("JoyConUp.png");
    equip = loadImage("JoyConButtonA.png");
    equip1 = loadImage("Knight - Left.png");
    equip2 = loadImage("Knight - Left - Shield.png");
    endExample = 500;
    endExample2 = 700;
    endExample3X = 40;
    endExample3Y = -50;
    positiveSpeed = 2;
    negativeSpeed = -2;
    startTextSize = 40;
    instructionSize = 30;
  }

  //Moving animations which shows the movement if an button is pushed (these are instructions!)
  void updateInstructions() {
    example.x -= exampleSpeedX;
    example2.x += exampleSpeedX;
    example3.y += exampleSpeedY;

    if (example.x <= endExample) {
      example.x = respawning;
    }

    if (example2.x >= endExample2) {
      example2.x = secondRespawn;
    }

    if (example3.y >= endExample3X) {
      exampleSpeedY = negativeSpeed;
    }
    if (example3.y <= endExample3Y) {
      exampleSpeedY = positiveSpeed;
    }
  }

  void sign() {//Sign, the player (maybe) knows what to do.
  
    if (player.posPlayer.y <= 10) {
      off = true;
    }
    if (platforms.moveAmount < 2 && player.posPlayer.y <= 580 && !off) {
      fill(#A57005);
      rect(posSign[0].x + 30, posSign[0].y + 30 + platforms.levelMove, standWidth, standHeight);
      rect(posSign[0].x, posSign[0].y + platforms.levelMove, sizeSign.x, sizeSign.y);

      fill(255);
      textSize(50);
      text("^", text.x + 640, text.y + 472 + platforms.levelMove);
      text("|", text.x + 640, text.y + 472 + platforms.levelMove);

      fill(#A57005);
      rect(posSign[1].x + 30, posSign[1].y + 30 + platforms.levelMove, standWidth, standHeight);
      rect(posSign[1].x, posSign[1].y + platforms.levelMove, sizeSign.x, sizeSign.y);

      fill(255);
      textSize(35);
      imageMode(CENTER);
      image(moveL, posSign[1].x + 15, posSign[1].y + 25 + platforms.levelMove, standWidth * 1.5, standHeight);
      text("=", posSign[1].x + 45, posSign[1].y + 30 + platforms.levelMove);
      image(moveL1, posSign[1].x + 66, posSign[1].y + 30 + platforms.levelMove, standWidth, standHeight);

      fill(#A57005);
      rect(width - 55, height - 120 + platforms.levelMove, standWidth, standHeight);
      rect(width - 85, height - 150 + platforms.levelMove, sizeSign.x, sizeSign.y * 2);
      textSize(35);
      imageMode(CENTER);
      image(equip, width - 70, height - 130 + platforms.levelMove, standWidth * 1.5, standHeight);
      fill(255);
      text("=", width-40, height-130);
      image(equip1, width - 70, height - 90);
      text(">", width-50, height - 90);
      image(equip2, width-30, height - 90);

      text("=", width-40, height-130 + platforms.levelMove);
      image(equip1, width - 70, height - 90 + platforms.levelMove);
      text(">", width-50, height - 90 + platforms.levelMove);
      image(equip2, width-30, height - 90 + platforms.levelMove);
      
      fill(#A57005);
      rect(posSign[2].x + 30, posSign[2].y + 30 + platforms.levelMove, standWidth, standHeight);
      rect(posSign[2].x, posSign[2].y + platforms.levelMove, sizeSign.x, sizeSign.y);

      fill(255);
      textSize(35);
      imageMode(CENTER);
      image(moveUp, posSign[2].x + 15, posSign[2].y + 25 + platforms.levelMove, standWidth * 1.5, standHeight * 1.1);
      text("= ^", posSign[2].x + 55, posSign[2].y + 30 + platforms.levelMove);
    }
  }

  //Explanation power-ups
  void powerUpInstructions() {
    if (/*platforms.moveAmount < 2 && player.posPlayer.y <= 580 && !off*/powerExpl) {
      background(black);

      rectMode(CORNER);
      fill(gray);
      rect(rect.x, rect.y, rectSize.x, rectSize.y);
      rect(rect2.x, rect2.y, rectSizeVertical.x, rectSizeVertical.y);
      rect(rect3.x, rect3.y, rectSizeVertical.x, rectSizeVertical.y);

      rectMode(CENTER);
      rect(rect4.x, rect4.y, buttonSize.x, buttonSize.y);

      //Images power-ups
      image(inventory.waterflesIOutline, posImgWater.x, posImgWater.y, imageSize+1, imageSize+1);
      image(inventory.waterflesI, posImgWater.x, posImgWater.y, imageSize, imageSize);
      
      image(inventory.shieldOutline, posImgShield.x, posImgShield.y, imageSize+1, imageSize+1);
      image(inventory.shieldF, posImgShield.x, posImgShield.y, imageSize, imageSize);
      
      image(inventory.swordIOutline, posImgSword.x, posImgSword.y, imgSwordSize.x+1, imgSwordSize.y+1);
      image(inventory.swordI, posImgSword.x, posImgSword.y, imgSwordSize.x, imgSwordSize.y);

      fill(white);
      textSize(instructionSize);
      text("Water Bottle", powerTextW.x, powerTextW.y);
      text("Shield", powerTextShield.x, powerTextShield.y);
      text("Sword", powerTextSword.x, powerTextShield.y);
      text("Press A to start", buttonText.x, buttonText.y);

      textSize(15);
      text("Shoot a drop and extinguish the fireballs.", explainText[0].x, explainText[0].y);
      text("This does also damage on the dragon.", explainText[1].x, explainText[1].y);
      text("Protects you from fireballs", explainText[2].x, explainText[2].y);
      text("and flamethrowers.", explainText[3].x, explainText[3].y);
      text("Defeat the dragon with", explainText[4].x, explainText[4].y);
      text("this power-up.", explainText[5].x, explainText[5].y);
    }
  }

  void draw() {
    //if (manual) {
      background(black);

      fill(gray);
      rect(rect5.x, rect5.y, rectSizeHorizontal[0].x, rectSizeHorizontal[0].y);
      rect(rect6.x, rect6.y, rectSizeHorizontal[1].x, rectSizeHorizontal[1].y);
      
      //Example of movement.
      fill(gray);
      image(moveL1, example.x, example.y, sizes.x, sizes.y);
      image(moveR1, example2.x, example2.y, sizes.x, sizes.y);
      image(moveR1, example3.x, example3.y, sizes.x, sizes.y);

      //All text instructions
      textSize(instructionSize);
      fill(white);
      text("Press <   to move to the left:", textInstr[0].x, textInstr[0].y);
      text("--", textInstr[1].x, textInstr[1].y);
      text("Press   > to move to the right:", textInstr[2].x, textInstr[2].y);
      text("--", textInstr[3].x, textInstr[3].y);
      text("Press ^ to jump:", textInstr[4].x, textInstr[4].y);
      text("|", textInstr[5].x, textInstr[5].y);
      text("If you have a powerup in your inventory,", textInstr[6].x, textInstr[6].y);
      text("press S to use the power-up.", textInstr[7].x, textInstr[7].y);
      text("Press S to see the power-ups", textInstr[8].x, textInstr[8].y);
      text("Goal: Chase the dragon by climbing the building!", textInstr[9].x, textInstr[9].y);

      textSize(startTextSize);
      text("Press A to start", textInstr[10].x, textInstr[10].y);
   // }
  }
}
