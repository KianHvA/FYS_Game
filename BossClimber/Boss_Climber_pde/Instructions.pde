class Instructions {
  PVector text;
  PVector text2;
  PVector example;
  PVector example2;
  PVector example3;
  PVector sizes;
  PVector[] posSign = {new PVector(650, 510), new PVector(width/12, 400), new PVector(width/12 * 10, 310)};
  PVector sizeSign;
  int textSize;
  float exampleSpeedX, exampleSpeedY, respawning, secondRespawn, standWidth, standHeight;
  boolean manual = false;
  PImage moveL, moveL1, moveR, moveR1, moveUp, equip, equip1, equip2;

  Instructions() {
    text = new PVector(50, 50);
    example = new PVector(700, 40);
    example2 = new PVector(500, 40);
    example3 = new PVector(300, 40);
    sizes = new PVector(25, 25);
    sizeSign = new PVector(80, 50);
    standWidth = 20;
    standHeight = 40;
    textSize = 10;
    exampleSpeedX = 2;
    exampleSpeedY = 2;
    respawning = 700;
    secondRespawn = 500;
    moveL = loadImage("JoyConButtonY.png");
    moveL1 = loadImage("Knight - Left - Walk1.png");
    moveR = loadImage("JoyConButtonA.png");
    moveR1 = loadImage("Knight - Right - Walk1.png");
    moveUp = loadImage("JoyConButtonX.png");
    equip = loadImage("JoyConButtonA.png");
    equip1 = loadImage("Knight - Left.png");
    equip2 = loadImage("Knight - Left - Shield.png");
  }

  void updateInstructions() {
    example.x -= exampleSpeedX;
    example2.x += exampleSpeedX;
    example3.y += exampleSpeedY;

    if (example.x <= 500) {
      example.x = respawning;
    }

    if (example2.x >= 700) {
      example2.x = secondRespawn;
    }

    if (example3.y >= 50) {
      exampleSpeedY = -2;
    }
    if (example3.y <= -50) {
      exampleSpeedY = 2;
    }
  }

  void sign() {//Sign, the player (maybe) knows what to do.
    if (platforms.moveAmount < 2) {
      fill(#A57005);
      rect(posSign[0].x + 30, posSign[0].y + 30, standWidth, standHeight);
      rect(posSign[0].x, posSign[0].y, sizeSign.x, sizeSign.y);

      fill(255);
      textSize(50);
      text("^", text.x + 640, text.y + 472);
      text("|", text.x + 640, text.y + 472);

      fill(#A57005);
      rect(posSign[1].x + 30, posSign[1].y + 30, standWidth, standHeight);
      rect(posSign[1].x, posSign[1].y, sizeSign.x, sizeSign.y);

      fill(255);
      textSize(35);
      imageMode(CENTER);
      image(moveL, posSign[1].x + 15, posSign[1].y + 30, standWidth * 1.5, standHeight);
      text("=", posSign[1].x + 45, posSign[1].y + 30);
      image(moveL1, posSign[1].x + 66, posSign[1].y + 30, standWidth, standHeight);

      fill(#A57005);
      rect(width - 55, height - 120, standWidth, standHeight);
      rect(width - 85, height - 150, sizeSign.x, sizeSign.y * 2);
      textSize(35);
      imageMode(CENTER);
      image(equip, width - 70, height - 130, standWidth * 1.5, standHeight);
      fill(255);
      text("=", width-40, height-130);
      image(equip1, width - 70, height - 90);
      text(">", width-50, height - 90);
      image(equip2, width-30, height - 90);
    }
  }

  void draw() {
    background(0);

    fill(125);
    rect(text.x + 350, text.y + 450, sizes.x + 300, sizes.y + 50);

    fill(125);//Example of movement.
    ellipse(example.x, example.y, sizes.x, sizes.y);
    ellipse(example2.x, example2.y + 50, sizes.x, sizes.y);
    ellipse(example3.x, example3.y + 200, sizes.x, sizes.y);

    textSize(30);//All text instructions
    fill(255);
    text("Press <   to move to the left:", text.x, text.y);
    text("--", text.x + 100, text.y - 3);
    text("Press   > to move to the right:", text.x, text.y + 50);
    text("--", text.x + 80, text.y + 47);
    text("Press ^ to jump:", text.x, text.y + 200);
    text("|", text.x + 87, text.y + 211);
    text("If you have a powerup in your inventory,", text.x, text.y + 250);
    text("press S to use the powerup.", text.x, text.y + 280);
    text("Goal: Chase the dragon by climbing the building!", text.x, text.y + 350);

    textSize(40);
    text("Press A to start", text.x + 220, text.y + 460);
  }
}
