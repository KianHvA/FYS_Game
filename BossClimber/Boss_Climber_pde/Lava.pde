class Lava {
  float y=576;
  float b = width/12;
  float speed = 0.3;
  float back = 2.4;
  boolean lavaBack = false;
  boolean lavaStop = false;
  boolean lavaUp = false;

  void draw() {
    rectMode(CORNER);
    noStroke();
    fill(#FAB800);
    rect(b, y, width-2*b, height);

    if (!dragon.fight) {
      y -= speed;
    }

    if (player.posPlayer.y+20 >= y) {
      healthbar.doDamage(100);
    }

    if (lavaBack) {
      y += back; 
      if (y > 700) {
        y -= 0;
      }
    }

    if (player.posPlayer.y <= 0 && !dragon.fight) {
      lavaBack = true;
    }
    if (player.posPlayer.y >= height-20 && !dragon.fight) {
      lavaBack = false;
      println("Lava stop");
      y -= speed;
      println("Lava spawn");
    }

    //    if (platforms.moveAmount == 8) {
    //      speed = 0.2;
    //    }

    //    if (platforms.moveAmount == 16) {
    //      speed = 0.4;
    //    }

    //    if (platforms.moveAmount == 32) {
    //      speed = 0.8;
  }
}
