class Lava {
  float y=576;
  float b = width/12;
  float speed = 0.3;
  float back = 3;

  void draw() {
    rectMode(CORNER);
    noStroke();
    fill(#FAB800);
    image(level.lavaImg, b, y, width-2*b, height);
    //rect(b, y, width-2*b, height);
    if (!health.dead) {
      if (!dragon.fight) {
        if (player.posPlayer.y < height - height/8) {
          y -= speed;
        }
      }

      if (player.posPlayer.y+20 >= y) {
        healthbar.doDamage(100);
      }

      if (player.posPlayer.y <= 0 && !dragon.fight) {
        y = 700;
      }

      if (platforms.moveAmount == 8) {
        speed = 0.2;
      }

      if (platforms.moveAmount == 16) {
        speed = 0.4;
      }

      if (platforms.moveAmount == 32) {
        speed = 0.8;
      }
    }
  }
}
