//Fee Fee: code
//Kian: sprite
class Lava {
  float y = 576;
  float b = width/12; //With of the walls
  float speed = 0.3; //Speed of rising lava
  float back = 2.4;
  float playerHeight = 20;
  boolean lavaBack = false;
  boolean lavaStop = false;
  boolean lavaUp = false;

  void draw() {
    rectMode(CORNER);
    noStroke();
    fill(#FAB800);
    image(level.lavaImg, b, y, width-2*b, height);
    if (!health.dead) {
      if (!dragon.fight) {
        if (player.posPlayer.y < height - height/8) {
          y -= speed;
        }
      }

      if (player.posPlayer.y+playerHeight >= y) {
        healthbar.doDamage(100);
      }

      // Next level, lava drops
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
        y -= speed;
        if (player.posPlayer.y <= 0 && !dragon.fight) {
          y = 700;
        }
      }
    }
  }
}
