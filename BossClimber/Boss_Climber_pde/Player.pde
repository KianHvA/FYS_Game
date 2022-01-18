//Tristan, Kian
//Fee Fee: sprites.
class Player {

  CollisionHandler collisionHandler;
  //variables
  PVector posPlayer = new PVector(width/1.8, height/1.2);
  PVector sizePlayer = new PVector(20, 20);//for collision 
  PVector sizeSprite = new PVector(sizePlayer.x, sizePlayer.y * (3/2)*2);//for sprite
  PVector velocity = new PVector(0, 0);
  float wallRepelForce = 3;
  final float GRAVITY = 0.4f;
  float jumpForce = 10;
  boolean hasJumped = false, hasDoubleJumped = false, hasCollision = false, wallCollisonR = false, wallCollisonL = false, moveLeft = false, moveRight = false, moveUp = false, moveDown = false;
  PImage left, left1, left2, right, right1, right2; //normaal
  PImage leftS, leftS1, leftS2, rightS, rightS1, rightS2; //shield
  PImage leftW, leftW1, leftW2, rightW, rightW1, rightW2; //waterfles
  PImage leftSW, leftSW1, leftSW2, rightSW, rightSW1, rightSW2; //sword
  PImage Active, leftActive, rightActive;
  PImage leftActiveS, rightActiveS;
  PImage leftActiveW, rightActiveW;
  PImage leftActiveSW, rightActiveSW;
  float timerLeft1 = 0, timerLeft2 = 0;
  float timerRight1 = 0, timerRight2 = 0;  
  final float SPEED = 5;
  boolean jump = false;
  boolean jumped = false;
  int jumpCooldown= 30;
  float jumpTimer1 = 0;
  int jumpAmount = 0;
  float walkAmount = 0;
  boolean checkSound = false;
  boolean playSound = false;
  final float TIMERANIMATIONS = 5;
  final int SIZESHIELD = 50;
  final int SHIELDCOORDINATES = 30;
  final color SHIELDCOLOR = #EBFA90;
  final int SHIELD1 = 250;
  final int SHIELD2 = 150;
  final int SHIELD3 = 100;
  final int SHIELD4 = 900;
  final int SHIELD5 = 600;
  final int SHIELD6 = 300;

  void setup() {
    //Loading in all the images.
    //left
    left = loadImage("Knight - Left.png");
    left1 = loadImage("Knight - Left - Walk1.png");
    left2 = loadImage("Knight - Left - Walk2.png");
    leftS = loadImage("Knight - Left - Shield.png");
    leftS1 = loadImage("Knight - Left - Walk1 - Shield.png");
    leftS2 = loadImage("Knight - Left - Walk2 - Shield.png");
    leftSW = loadImage("Knight - Left - Sword.png");
    leftSW1 = loadImage("Knight - Left - Walk1 - Sword.png");
    leftSW2 = loadImage("Knight - Left - Walk2 - Sword.png");
    leftW = loadImage("Knight - Left - Water.png");
    leftW1 = loadImage("Knight - Left - Walk1 - Water.png");
    leftW2 = loadImage("Knight - Left - Walk2 - Water.png");
    //right
    right = loadImage("Knight - Right.png");
    right1 = loadImage("Knight - Right - Walk1.png");
    right2 = loadImage("Knight - Right - Walk2.png");
    rightS = loadImage("Knight - Right - Shield.png");
    rightS1 = loadImage("Knight - Right - Walk1 - Shield.png");
    rightS2 = loadImage("Knight - Right - Walk2 - Shield.png");
    rightSW = loadImage("Knight - Right - Sword.png");
    rightSW1 = loadImage("Knight - Right - Walk1 - Sword.png");
    rightSW2 = loadImage("Knight - Right - Walk2 - Sword.png");
    rightW = loadImage("Knight - Right - Water.png");
    rightW1 = loadImage("Knight - Right - Walk1 - Water.png");
    rightW2 = loadImage("Knight - Right - Walk2 - Water.png");
    //Start
    Active = loadImage("Knight - Right.png");
    leftActive = loadImage("Knight - Left.png");
    rightActive = loadImage("Knight - Right.png");
    leftActiveS = loadImage("Knight - Left - Shield.png");
    rightActiveS = loadImage("Knight - Right - Shield.png");
    leftActiveSW = loadImage("Knight - Left - Sword.png");
    rightActiveSW = loadImage("Knight - Right - Sword.png");
    leftActiveW = loadImage("Knight - Left - Water.png");
    rightActiveW = loadImage("Knight - Right - Water.png");

    collisionHandler = new CollisionHandler();
  }

  void draw() {
    //modes
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);

    //player
    fill(menu.PLAYER);
    image(Active, posPlayer.x, posPlayer.y, sizeSprite.x, sizeSprite.y);
    //If the shield has taken damage you will be able to see more through it.
    if (schild.pickedUp && schild.schildLevens == 3) {
      fill(SHIELDCOLOR, SHIELD1);
      circle(player.posPlayer.x, player.posPlayer.y, SIZESHIELD);
    }
    if (schild.pickedUp && schild.schildLevens == 2) {
      fill(SHIELDCOLOR, SHIELD2);
      circle(player.posPlayer.x, player.posPlayer.y, SIZESHIELD);
    }
    if (schild.pickedUp && schild.schildLevens == 1) {
      fill(SHIELDCOLOR, SHIELD3);
      circle(player.posPlayer.x, player.posPlayer.y, SIZESHIELD);
    }
  }
  
  void movementUpdate()
  {
    //Check collision and set booleans to use down the line
    checkCollision(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.y);
    hasCollision = collisionHandler.hit;
    wallCollisonL = collisionHandler.hitWallLeft;
    wallCollisonR = collisionHandler.hitWallRight;
    if (!hasCollision) //If there is no collision gravity needs to slow you down
    {
      velocity.y += GRAVITY; //Werkt alleen als ik niet op een platform sta.
    } else {
      velocity.y = 0;
      player.collideWithPlatform();
    }
    //Collision with the walls
    if (wallCollisonR) {
      velocity.x = 0;
      velocity.x -= wallRepelForce;
    } else if (wallCollisonL) {
      velocity.x = 0;
      velocity.x += wallRepelForce;
    }
    //Handle movement on x-axes
    if (keysPressed[LEFT] && !platforms.moveStage  && !wallCollisonL && !wallCollisonR)
    {
      velocity.x = -SPEED;
      walkAmount++; //This increases the number you have walked for uses in the database.
      moveLeft = true;
    } else if (keysPressed[RIGHT] && !platforms.moveStage  && !wallCollisonL && !wallCollisonR)
    {
      velocity.x = SPEED;
      walkAmount++; //This increases the number you have walked for uses in the database.
      moveRight = true;
    } else 
    if (!hasCollision)
    {
      velocity.x = lerp(velocity.x, 0, 0.01);
      moveLeft = false;
      moveRight = false;
      moveUp = false;
      moveDown = true;
    } else {
      velocity.x = 0;
      moveLeft = false;
      moveRight = false;
      moveUp = false;
      moveDown = false;
    }
    //Swapping between sprites and the small animations for them are done here.
    if (!schild.pickedUp && !sword.pickedUp && !waterBottle.pickedUp) {//With nothing equiped.
      if (moveLeft && !moveRight) {
        Active = leftActive;
        if (timerLeft2 ==0) {
          timerLeft1++;
        }
        if (timerLeft1 >= TIMERANIMATIONS) {
          leftActive = left1;
          timerLeft2++;
        }
        if (timerLeft2 >= TIMERANIMATIONS) {
          leftActive = left2;
          timerLeft1 = 0;
          timerLeft2 = 0;
        }
      } 

      if (moveRight && !moveLeft) {
        Active = rightActive;
        if (timerRight2 ==0) {
          timerRight1++;
        }
        if (timerRight1 >= TIMERANIMATIONS) {
          rightActive = right1;
          timerRight2++;
        }
        if (timerRight2 >= TIMERANIMATIONS) {
          rightActive = right2;
          timerRight1 = 0;
          timerRight2 = 0;
        }
      } 
      if (!moveLeft && !moveRight) {
        Active = right;
      }
    }

    if (schild.pickedUp && !waterBottle.pickedUp && !sword.pickedUp) {//With the shield 
      if (moveLeft && !moveRight) {
        Active = leftActiveS;
        if (timerLeft2 ==0) {
          timerLeft1++;
        }
        if (timerLeft1 >= TIMERANIMATIONS) {
          leftActiveS = leftS1;
          timerLeft2++;
        }
        if (timerLeft2 >= TIMERANIMATIONS) {
          leftActiveS = leftS2;
          timerLeft1 = 0;
          timerLeft2 = 0;
        }
      }
      if (moveRight && !moveLeft) {
        Active = rightActiveS;
        if (timerRight2 ==0) {
          timerRight1++;
        }
        if (timerRight1 >= TIMERANIMATIONS) {
          rightActiveS = rightS1;
          timerRight2++;
        }
        if (timerRight2 >= TIMERANIMATIONS) {
          rightActiveS = rightS2;
          timerRight1 = 0;
          timerRight2 = 0;
        }
      }
      if (!moveLeft && !moveRight) {
        Active = rightS;
      }
    }

    if (!schild.pickedUp && !sword.pickedUp && waterBottle.pickedUp) {//With the waterbottle
      if (moveLeft && !moveRight) {
        Active = leftActiveW;
        if (timerLeft2 == 0) {
          timerLeft1++;
        }
        if (timerLeft1 >= TIMERANIMATIONS) {
          leftActiveW = leftW1;
          timerLeft2++;
        }
        if (timerLeft2 >= TIMERANIMATIONS) {
          leftActiveW = leftW2;
          timerLeft1 = 0;
          timerLeft2 = 0;
        }
      }
      if (moveRight && !moveLeft) {
        Active = rightActiveW;
        if (timerRight2 == 0) {
          timerRight1++;
        }
        if (timerRight1 >= TIMERANIMATIONS) {
          rightActiveW = rightW1;
          timerRight2++;
        }
        if (timerRight2 >= TIMERANIMATIONS) {
          rightActiveW = rightW2;
          timerRight1 = 0;
          timerRight2 = 0;
        }
      }
      if (!moveLeft && !moveRight) {
        Active = rightW;
      }
    }

    if (!schild.pickedUp && sword.pickedUp && !waterBottle.pickedUp) {//With the shield
      if (moveLeft && !moveRight && !sword.attacked) {
        Active = leftActiveSW;
        if (timerLeft2 == 0) {
          timerLeft1++;
        }
        if (timerLeft1 >= TIMERANIMATIONS) {
          leftActiveSW = leftSW1;
          timerLeft2++;
        }
        if (timerLeft2 >= TIMERANIMATIONS) {
          leftActiveSW = leftSW2;
          timerLeft1 = 0;
          timerLeft2 = 0;
        }
      }
      if (moveRight && !moveLeft) {
        Active = rightActiveSW;
        if (timerRight2 == 0) {
          timerRight1++;
        }
        if (timerRight1 >= TIMERANIMATIONS) {
          rightActiveSW = rightSW1;
          timerRight2++;
        }
        if (timerRight2 >= TIMERANIMATIONS) {
          rightActiveSW = rightSW2;
          timerRight1 = 0;
          timerRight2 = 0;
        }
      }
      if (!moveLeft && !moveRight && !sword.attacked) {
        Active = rightSW;
      }
      if (sword.attacked && sword.stabAnimation <= 100) {
        Active = sword.swordStab;
      }
    }


    //handle jump
    if (hasCollision && (keysPressed[UP] || keysPressed['A'])  && !platforms.moveStage && jump && !jumped)
    {
      jumpAmount++;
      jumped = true;
    }
    if (!hasCollision && !hasDoubleJumped && jump && keysPressed[UP] && velocity.y > 0 && Doublejump.cooldown < 10  && !platforms.moveStage && !wallCollisonL && !wallCollisonR)
    {
      velocity.y = -jumpForce;
      jumpAmount++;
      moveUp = true;
      hasDoubleJumped = true;
    }
    if (jumped) {
      hasCollision = false;
      velocity.y = -jumpForce;
      moveUp = true;
      jump = false;
      jumped = false;
      if (music.music) {
        jumpSound.play();
      }
    }
    if (!jump) {
      jumpTimer1++;
    }
    if (jumpTimer1 == jumpCooldown) {
      jump = true;
      jumpTimer1 = 0;
    }

    if (healthbar.shieldDamage && schild.schildActivated && schild.schildLevens == 3) {
      //ellipseMode(CENTER);
      fill(SHIELDCOLOR, SHIELD4);
      circle(player.posPlayer.x, player.posPlayer.y, SHIELDCOORDINATES);
      schild.schildLevens = 2;
      schild.hit = true;
      healthbar.shieldDamage = false;
    }
    if (healthbar.shieldDamage && schild.schildActivated && schild.schildLevens == 2) {
      fill(SHIELDCOLOR, SHIELD5);
      circle(player.posPlayer.x, player.posPlayer.y, SHIELDCOORDINATES);
      schild.schildLevens = 1;
      schild.hit = true;
      healthbar.shieldDamage = false;
    }
    if (healthbar.shieldDamage && schild.schildActivated && schild.schildLevens == 1) {
      fill(SHIELDCOLOR, SHIELD6);
      circle(player.posPlayer.x, player.posPlayer.y, SHIELDCOORDINATES);
      schild.schildLevens = 0;
      schild.hit = true;
      healthbar.shieldDamage = false;
      schild.pickedUp = false;
    }
    if (sword.pickedUp && keysPressed['A']) {
      sword.attack();
    }

    if (waterBottle.pickedUp && keysPressed['S'] && cooldown == 0) {//Shooting druppel
      drops.shootDrop(posPlayer.x, posPlayer.y, 0, -4);
      waterBottle.dropOn = true;
      waterBottle.pickedUp = false;
    }

    //Add velocity to posPlayer
    posPlayer.x += velocity.x;
    posPlayer.y += velocity.y;
  }
  
  //Collision checks
  void collideWithPlatform()
  {
    if (collisionHandler.platformHitPos.y > posPlayer.y) {
      posPlayer.y = posPlayer.y - GRAVITY;

      collisionHandler.preplatformHitPos = collisionHandler.platformHitPos;
    } else {
      hasCollision = false;
      posPlayer.y = posPlayer.y + (GRAVITY*sizePlayer.y);
    }
  }
  
  void checkCollision(float objectX, float objectY, float objectRadius) {
    collisionHandler.checkCollision(objectX, objectY, objectRadius);
  }
}
