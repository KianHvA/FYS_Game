class Instructions{
  PVector text;
  PVector example;
  PVector example2;
  PVector example3;
  PVector sizes;
  int textSize;
  float exampleSpeedX, exampleSpeedY, respawning, secondRespawn;
  boolean manual = false;
  
  Instructions(){
    text = new PVector(50, 50);
    example = new PVector(700, 40);
    example2 = new PVector(500, 40);
    example3 = new PVector(300, 40);
    sizes = new PVector(25, 25);
    textSize = 10;
    exampleSpeedX = 2;
    exampleSpeedY = 2;
    respawning = 700;
    secondRespawn = 500;
  }
  
  void updateInstructions(){
    example.x -= exampleSpeedX;
    example2.x += exampleSpeedX;
    example3.y += exampleSpeedY;
    
    if (example.x <= 500){
      example.x = respawning;
    }
    
    if (example2.x >= 700){
      example2.x = secondRespawn;
    }
    
    if (example3.y >= 50){
      exampleSpeedY = -2;
    }
    if (example3.y <= -50){
      exampleSpeedY = 2;
    }
  }
  
  void draw(){
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
