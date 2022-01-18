//Fee Fee
class Health {  
  PFont f = createFont("Arial", 16, true); //TypeStyle = Arial
  float invincible; //Using invincibility to make sure you cannot one shot yourself
  boolean hit = false;
  boolean regen = false; //For regeneration purposes
  boolean dead = false; //To make sure you don't get resurrected because of the health regeneration
  
  //Coordinates off the rect for dead screen
  float xBegin = 400; 
  float yBegin = 300; 
  
  //x coordinates off the rect for dead screen used for reseting it
  final float RxBegin = width/2; 
  final float RyBegin = height/2;
  boolean invincibleB = false;
  int amount = 4;
  boolean amount2 = false, amount1 = false, amount0 = false; //Amount of lives
  PImage img1, img2, img3;
  PImage dead1, dead2, dead3;

  void setup() {
    //Loading the pictures
    img1 = loadImage("Hart full.png"); 
    img2 = loadImage("Hart full.png"); 
    img3 = loadImage("Hart full.png"); 
    dead1 = loadImage("Hart empty.png");
    dead2 = loadImage("Hart empty.png");
    dead3 = loadImage("Hart empty.png");
  }


  void update() {
    
    if (!dead) { //As long as the player is alive
      if (healthbar.healthPlayer == 100) regen = false;

      if (hit) {
        invincibleB = true; //This boolean refers to invincility
      }

      if (invincibleB) {
        invincible++; //Invincible period
      }
      //Stop being invincible
      if (invincible > 300) {
        invincibleB = false;
        hit = false;
        invincible = 0;
      }
    }
  }

  void draw() {
    switch(amount) {
    case 4:/*3 but because of the mulptiplier with damage it can't get to 0*/
      fill(255);
      imageMode(CORNER);
      image(img1, 5, height-80, 50, 50);
      image(img2, 5, height-130, 50, 50);
      image(img3, 5, height-180, 50, 50);
      break;
    case 3: /*2 but because of the multiplier with damage it can't get to 0*/
      amount2 = true;
      fill(255);
      imageMode(CORNER);
      image(img1, 5, height-80, 50, 50);
      image(img2, 5, height-130, 50, 50);
      image(dead3, 5, height-180, 50, 50);
      break;
    case 2: /*1 but because of the multiplier with damage it can't get to 0*/
      amount1 = true;
      fill(255);
      imageMode(CORNER);
      image(img1, 5, height-80, 50, 50);
      image(dead2, 5, height-130, 50, 50);
      image(dead3, 5, height-180, 50, 50);
      break;
    default: /*0 but because of the multiplier with damage it can't get to 0*/
      amount0 = true;
    }

    if (healthbar.healthPlayer < 1 && amount <= 1 || player.posPlayer.y > 600 || amount0) { //Player is out of lives or walked out of the screen to die.
      halfX = xBegin;
      halfY = yBegin;

      //println("hoi"); Used for checks
      //rectMode(CORNER); 
      //fill(0);
      ////rect(halfX, halfY, width, height); //Black screen if you know a better way pleaso do it
      //textFont(f, 36); //size of the texts
      //fill(255); //color
      //text("GAME OVER", halfX, halfY);
      //text("Score: " + scoreHandler.score, halfX, halfY + 30);
      //rectMode(CENTER); 
      //fill(0);
      //rect(halfX, halfY, width, height); //Black screen if you know a better way pleaso do it
      //textFont(f, 36); //size of the texts
      //fill(255); //color
      //text("GAME OVER", halfX, halfY);
      //text("Score: " + scoreHandler.score, halfX, halfY + 30);
 
      fill(0);
      rect(halfX, halfY, width, height);
      textFont(f, 36);
      fill(255);
      text("GAME OVER", halfX, halfY);
      text("Score: " + scoreHandler.score, halfX, halfY + 30);
      dead = true;
    }
  }
}

class HealthBar {
  boolean shieldDamage; //If the shield is equiped it takes the damage.
  float x, y, w, h;
  float healthPlayer = 1;
  HealthBar(float Tx, float Ty, float Tw, float Th ) {
    this.x = Tx;
    this.y = Ty;
    this.w = Tw;
    this.h = Th;
    healthPlayer = 1;
  }


  void doDamage(float damage) {
    if (!health.invincibleB) {
      healthPlayer -= damage; // function to do damage.
    } else shieldDamage = true;
  }
  void draw() {
    healthPlayer = constrain(healthPlayer, 0, 3); //Player has an maximum amount of health.
  }
}

class HealthBarDragon {
  float x, y, w, h;
  HealthBarDragon(float Tx, float Ty, float Tw, float Th ) {
    this.x = Tx;
    this.y = Ty;
    this.w = Tw;
    this.h = Th;
  }


  void doDamageDragon(float damage) {
      dragon.dragonHealth -= damage; //Function to do damage to the dragon.
  }
  void draw() {
    noFill();
    stroke(255);
    float c = map(dragon.dragonHealth, 0, dragon.dragonHealthS, 0, w);
    fill(255, 0, 0);
    noStroke();
    rectMode(CENTER);
    rect(width/2, 10, c, h - 1);
    if (dragon.dragonHealth == 0) dragon.dragonHealth = 0;

    dragon.dragonHealth = constrain(dragon.dragonHealth, 0, dragon.dragonHealth);
    noFill();
    stroke(255);
    rectMode(CENTER);
    rect(width/2, 10, w, h);
  }
}
