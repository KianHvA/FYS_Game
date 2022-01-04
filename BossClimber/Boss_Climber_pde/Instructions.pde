//Dion
class Instructions {
  PVector text;
  PVector text2;
  PVector example;
  PVector example2;
  PVector example3;
  PVector sizes;
  PVector[] posSign = {new PVector(650, 510), new PVector(width/12, 400), new PVector(width/12 * 10, 310)};
  PVector sizeSign;
  PVector rectSize;
  PVector rectSize2;
  int textSize;
  float exampleSpeedX, exampleSpeedY, respawning, secondRespawn, standWidth, standHeight, imageSize, endExample, endExample2, endExample3X, endExample3Y;
  float positiveSpeed, negativeSpeed;
  boolean manual = false;
  boolean powerExpl = false;
  PImage moveL, moveL1, moveR, moveR1, moveUp, equip, equip1, equip2;
  boolean off = false;

  Instructions() {
    text = new PVector(50, 50);
    example = new PVector(700, 30);
    example2 = new PVector(500, 80);
    example3 = new PVector(300, 40);
    sizes = new PVector(25, 25);
    sizeSign = new PVector(80, 50);
    rectSize = new PVector(width, 25);
    rectSize2 = new PVector(25, 455);
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
  }

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

  void powerUpInstructions() {//Explanation power-ups
    if (/*platforms.moveAmount < 2 && player.posPlayer.y <= 580 && !off*/powerExpl) {
      background(0);

      rectMode(CORNER);
      fill(125);
      rect(text.x - 50, text.y + 200, rectSize.x, rectSize.y);
      rect(text.x + 310, text.y - 50, rectSize2.x, rectSize2.y - 180);
      rect(text.x + 620, text.y - 50, rectSize2.x, rectSize2.y - 180);

      rectMode(CENTER);
      rect(text.x + 475, text.y + 370, sizes.x + 300, sizes.y + 50);

      image(inventory.waterflesI, text.x + 100, text.y + 30, imageSize, imageSize);//Images power-ups
      image(inventory.shieldF, text.x + 450, text.y + 30, imageSize, imageSize);
      image(inventory.swordI, text.x + 770, text.y + 20, imageSize, imageSize + 50);

      fill(255);
      textSize(30);
      text("Water Bottle", text.x + 50, text.y);
      text("Shield", text.x + 435, text.y);
      text("Sword", text.x + 750, text.y);
      text("Press A to start", text.x + 370, text.y + 380);

      textSize(15);
      text("Shoot a drop and extinguish the fireballs.", text.x, text.y + 100);
      text("This does also damage on the dragon.", text.x + 5, text.y + 120);
      text("Protects you from fireballs", text.x + 390, text.y + 100);
      text("and flamethrowers.", text.x + 415, text.y + 120);
      text("Defeat the dragon with", text.x + 720, text.y + 140);
      text("this power-up.", text.x + 745, text.y + 160);
    }
  }

  void draw() {
    if (/*platforms.moveAmount < 2 && player.posPlayer.y <= 580 && !off*/manual) {
      background(0);

      fill(125);
      rect(text.x + 475, text.y + 450, sizes.x + 300, sizes.y + 50);
      rect(text.x + 600, text.y + 280, sizes.x + 400, sizes.y + 25);

      fill(125);//Example of movement.
      image(moveL1, example.x, example.y, sizes.x, sizes.y);
      image(moveR1, example2.x, example2.y, sizes.x, sizes.y);
      image(moveR1, example3.x, example3.y + 190, sizes.x, sizes.y);

      textSize(30);//All text instructions
      fill(255);
      text("Press <   to move to the left:", text.x, text.y);
      text("--", text.x + 100, text.y - 3);
      text("Press   > to move to the right:", text.x, text.y + 50);
      text("--", text.x + 80, text.y + 47);
      text("Press ^ to jump:", text.x, text.y + 200);
      text("|", text.x + 87, text.y + 211);
      text("If you have a powerup in your inventory,", text.x, text.y + 250);
      text("press S to use the power-up.", text.x, text.y + 280);
      text("Press S to see the power-ups", text.x + 400, text.y + 290);
      text("Goal: Chase the dragon by climbing the building!", text.x, text.y + 350);

      textSize(40);
      text("Press A to start", text.x + 345, text.y + 460);
    }
  }
}
