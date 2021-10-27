class Health {  
  PFont f = createFont("Arial", 16, true); //TypeStyle = Arial
  float invincible; //Using invincibility to make sure you cannot one shot yourself
  boolean hit = false; //Idem
  boolean regen = false; //For regeneration purposes
  boolean dead = false; //To make sure you don't get resurrected because of the health regeneration 
  float regenTimer; //It takes 5 seconds of no damage until you're health regeneration starts
  float xBegin = 400; //x coordinates off the rect for dead screen
  float yBegin = 300; //y coordinates off the rect for dead screen
  final float RxBegin = width/2; //x coordinates off the rect for dead screen used for reseting it
  final float RyBegin = height/2; //y coordinates off the rect for dead screen used for reseting it


  void update() {
    if (!dead) {
      regenTimer++;
      if (healthbar.health == 100) regen = false;

      if (hit == true) invincible++;

      if (invincible > 90) hit = false;

      if (flamethrower.hasCollision && !hit) {
        println("auw");
        hit = true;
        //regen = true;
        healthbar.health -= 50;
        regenTimer = 0;
      }
      
      if (fireballs[0].playerCollision && !hit|| fireballs[1].playerCollision && !hit || fireballs[2].playerCollision && !hit){//Fireball hits player and get some damage!
        hit = true;
        //regen = true;
        healthbar.health -= 10;
        regenTimer = 0;
      }
      else{
        hit = false;
        fireballs[0].playerCollision = false;
        fireballs[1].playerCollision = false;
        fireballs[2].playerCollision = false;
      }

      //for (int i =0; i != fireballs.length; i++) {
      //  if (fireballs[i].hasCollision && !hit) {
      //    println("b");
      //    hit = true;
      //    //regen = true;
      //    healthbar.health -= 1;
      //    regenTimer = 0;
      //  }
      //}


      //if (regenTimer > 300 && regen) healthbar.health++;
    }
  }

  void draw() {
    if (healthbar.health < 1) {
      halfX = xBegin;
      halfY = yBegin;
      //println("hoi"); Used for checks
      rectMode(CENTER); 
      fill(0);
      rect(halfX, halfY, width, height); //Black screen if you know a better way pleaso do it
      textFont(f, 36); //size of the texts
      fill(255); //color
      text("GAME OVER", halfX, halfY);
      dead = true;
      menu.restart = true;
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
    health = 100;
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
