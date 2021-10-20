class Health {  
  PFont f = createFont("Arial", 16, true); //TypeStyle = Arial
  float invincible; //Using invincibility to make sure you cannot one shot yourself
  boolean hit; //Idem
  boolean regen = false; //For regeneration purposes
  boolean dead = false; //To make sure you don't get resurrected because of the health regeneration 
  float regenTimer; //It takes 5 seconds of no damage until you're health regeneration starts

  void update() {
    if (dead) {
      regenTimer++;
      if (healthbar.health == 100) regen = false;
      if (hit == true) invincible++;
      if (invincible == 90) hit = false;
      for (int i =0; i != fireballs.length; i++) {
        if (Flamethrower.hasCollision && !hit || fireballs[i].hasCollision && !hit) {
          hit = true;
          regen = true;
          healthbar.health -= 50;
          regenTimer = 0;
        }
      }
      if (regenTimer > 300 && regen) healthbar.health++;
    }
  }

  void draw() {
    if (healthbar.health < 1) {
      //println("hoi"); Used for checks
      rectMode(CENTER); 
      fill(0);
      rect(width/2, height/2, width, height); //Black screen if you know a better way pleaso do it
      textFont(f, 36); //size of the texts
      fill(255); //color
      text("GAME OVER", width/2, height/2);
      dead = true;
    }
  }
}





class HealthBar {  //class + naam van de class (Zoals bovenaan staat)//

  float x, y, w, h;
  float health = 100;
  HealthBar(float Tx, float Ty, float Tw, float Th ) {
    this.x = Tx;
    this.y = Ty;
    this.w = Tw;
    this.h = Th;
  }

  void draw() {
    health = constrain(health, 0, 100);
    noFill();
    stroke(255);
    rect(x, y, w, h);

    colorMode(RGB, 150);
    float c = map(health, 0, 100, 0, w);
    float d = map(health, 0, 100/2, 0, 255);
    float f = map(health, 0, 100, 255, 0);
    fill(f, d, 0);
    noStroke();
    rect(x+1, y+1, c, h-1);
    colorMode(RGB, 400);
  }
}
