int keyMax = 1024;
boolean[] keysPressed = new boolean[keyMax];
Player pla;

void setup() {
  pla = new Player();
  size(500, 500);
}


void draw() {
  pla.movementUpdate();
  background(150);
  co.checkCollision();
  plat.platform();
  pla.player();
}

void keyPressed() {
  if (keyCode >=keyMax) return;
  keysPressed[keyCode] = true;
}

void keyReleased() {
  if (keyCode >=keyMax) return;
  keysPressed[keyCode] = false; 
}
