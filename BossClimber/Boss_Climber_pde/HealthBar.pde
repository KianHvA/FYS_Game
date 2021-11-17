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
  boolean invincibleB = false;
  int amount = 4;
  boolean amount2 = false, amount1 = false, amount0 = false;
  float amount2C = 0, amount1C = 0, amount0C = 0;
  PImage img1, img2, img3;
  PImage dead1, dead2, dead3;
  
  void setup() {
    /*
   img1 = loadImage(".data/Hart full.png"); 
   img2 = loadImage(".data/Hart full.png"); 
   img3 = loadImage(".data/Hart full.png"); 
   dead1 = loadImage(".data/Hart empty.png");
   dead2 = loadImage(".data/Hart empty.png");
   dead3 = loadImage(".data/Hart empty.png");
   */
  }


  void update() {
    if (!dead) {
      regenTimer++;
      if (healthbar.healthPlayer == 100) regen = false;

      if (hit == true) invincible++;

      if (invincible > 300) {
        invincibleB = false;
        hit = false;
      }

      if (flamethrower.hasCollision && !hit && !invincibleB) {
        println("auw");
        hit = true;
        //regen = true;
        healthbar.healthPlayer -= 50;
        regenTimer = 0;
      }
      
      if(hit) invincibleB = true;
      
      if(amount2 && !hit) {
       hit = true; 
      }
      
      if(amount1 && !hit) {
       hit = true; 
      }
      
      if(amount0 && !hit) {
       hit = true; 
      }

      //if (fireballs[0].playerCollision && !hit && !invincibleB|| fireballs[1].playerCollision && !hit && !invincibleB|| fireballs[2].playerCollision && !hit&& !invincibleB) {//Fireball hits player and get some damage!
      //  hit = true;
      //  //regen = true;
      //  regenTimer = 0;
      //} else {
      //  hit = false;
      //  fireballs[0].playerCollision = false;
      //  fireballs[1].playerCollision = false;
      //  fireballs[2].playerCollision = false;
      //}
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
    if (healthbar.healthPlayer < 1 && amount >= 0) {
      amount--;
      healthbar.healthPlayer = 100;
    }
    switch(amount) {
    case 4:/*3 but because of the mulptiplier with damage it can't get to 0*/
      fill(255);
      ellipseMode(CORNER);
      ellipse(20, height - 50, 10, 10);
      ellipse(20, height - 90, 10, 10);
      ellipse(20, height - 130, 10, 10);
      //image(img1, 20, height-50);
      break;
    case 3: /*2 but because of the multiplier with damage it can't get to 0*/
      amount2 = true;
      fill(255);
      ellipseMode(CORNER);
      ellipse(20, height - 50, 10, 10);
      ellipse(20, height - 90, 10, 10);
      break;
    case 2: /*1 but because of the multiplier with damage it can't get to 0*/
      amount1 = true;
      fill(255);
      ellipseMode(CORNER);
      ellipse(20, height - 50, 10, 10);
      break;
    default: /*0 but because of the multiplier with damage it can't get to 0*/
      amount0 = true;
    }
    if (amount2) {
      amount2C++;
    }
    if (amount1) {
      amount1C++;
    }
    if (amount0) {
      amount0C++;
    }
    //println(amount2C);
    //println(invincibleB);
    if (amount2C > 1 && amount2C < 400) invincibleB = true;
    else if (amount2C > 400) invincibleB = false;
    if (amount1C > 1 && amount1C < 400) invincibleB = true;
    else if (amount1C > 400) invincibleB = false;
    if (amount0C > 1 && amount0C < 400) invincibleB = true;
    else if (amount0C > 400) invincibleB = false;

    if (healthbar.healthPlayer < 1 && amount <= 1 || player.posPlayer.y > 600) {
      halfX = xBegin;
      halfY = yBegin;
      //println("hoi"); Used for checks
      rectMode(CENTER); 
      fill(0);
      rect(halfX, halfY, width, height); //Black screen if you know a better way pleaso do it
      textFont(f, 36); //size of the texts
      fill(255); //color
      text("GAME OVER", halfX, halfY);
      text("Score: " + scoreHandler.score, halfX, halfY + 30);
      dead = true;
      menu.restart = true;
    }
  }
}

class HealthBar {  //class + naam van de class (Zoals bovenaan staat)//

  boolean shieldDamage;
  float x, y, w, h;
  float healthPlayer = 100;
  HealthBar(float Tx, float Ty, float Tw, float Th ) {
    this.x = Tx;
    this.y = Ty;
    this.w = Tw;
    this.h = Th;
    healthPlayer = 100;
  }


  void doDamage(float damage) {
    if (!health.invincibleB) {
      healthPlayer -= damage /* * health.amount work in progress it just insta kills you now */;
    } else shieldDamage = true;
  }
  void draw() {
    healthPlayer = constrain(healthPlayer, 0, 100);
    noFill();
    stroke(255);
    rect(x, y, w, h);

    colorMode(RGB, 150);
    float c = map(healthPlayer, 0, 100, 0, w);
    float d = map(healthPlayer, 0, 100/2, 0, 255);
    float f = map(healthPlayer, 0, 100, 255, 0);
    fill(f, d, 0);
    noStroke();
    rect(x+1, y+1, c, h-1);
    colorMode(RGB, 400);
  }
}

class HealthBarDragon {  //class + naam van de class (Zoals bovenaan staat)//

  float x, y, w, h;
  HealthBarDragon(float Tx, float Ty, float Tw, float Th ) {
    this.x = Tx;
    this.y = Ty;
    this.w = Tw;
    this.h = Th;
    //dragon.dragonHealth = dragon.dragonHealth;
  }


  void doDamageDragon(float damage) {
    if (!health.invincibleB) {
      dragon.dragonHealth -= damage /* * health.amount work in progress it just insta kills you now */;
    }
  }
  void draw() {
    dragon.dragonHealth = constrain(dragon.dragonHealth, 0, dragon.dragonHealth);
    noFill();
    stroke(255);
    rect(x, y, w, h);

    colorMode(RGB, 150);
    float c = map(dragon.dragonHealth, 0, dragon.dragonHealth, 0, w);
    float d = map(dragon.dragonHealth, 0, dragon.dragonHealth/2, 0, 255);
    float f = map(dragon.dragonHealth, 0, dragon.dragonHealth, 255, 0);
    fill(f, d, 0);
    noStroke();
    rect(x+1, y+1, c, h-1);
    colorMode(RGB, 400);
    if(dragon.dragonHealth == 0) dragon.dragonHealth = 0;
  }
}
