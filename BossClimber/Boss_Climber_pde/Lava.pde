//Fee Fee: code
//Kian: sprite
class Lava {
  float y = 576;
  float b = width/12; //With of the walls
  float speed = 0.3; //Speed of rising lava
  float back = 2.4; //Spped lava drops
  float playerHeight = 20;
  float maxLava = 700; //Lowest point lava can get 
  
  boolean lavaBack = false;

  void draw() {
    rectMode(CORNER);
    noStroke();
    fill(#FAB800);
    image(level.lavaImg, b, y, width-2*b, height);
    if (!health.dead) {
      if (!dragon.fight) {
        y -= speed;
      }
    }

    //Player dies when off screen
    if (player.posPlayer.y + playerHeight >= y) {
      healthbar.doDamage(100);
    }

    // Next level, lava drops
    if (lavaBack) {
      y += back; 
      if (y > maxLava) {
        y -= 0;
      }
    }

    //Lava drops when next level is reached
    if (player.posPlayer.y <= 0 && !dragon.fight) {
      lavaBack = true;
    }
    
    //If new level starts, lava starts rising
    if (player.posPlayer.y >= height - playerHeight && !dragon.fight) {
      lavaBack = false;
      y -= speed;
      if (player.posPlayer.y <= 0 && !dragon.fight) {
        y = maxLava;
      }
    }
  }
}
