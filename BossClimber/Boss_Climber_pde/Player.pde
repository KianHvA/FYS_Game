//Tristan, Kian
class Player {

  CollisionHandler collisionHandler;
  //variables
  PVector posPlayer = new PVector(width/1.8, height/1.2);
  PVector sizePlayer = new PVector(20, 20);//for collision 
  PVector sizeSprite = new PVector(sizePlayer.x, sizePlayer.y * (3/2)*2);//for sprite
  PVector velocity = new PVector(0, 0);
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
  float jumpTimer1 = 0;
  int jumpAmount = 0;
  float walkAmount = 0;
  boolean checkSound = false;
  boolean playSound = false;

  void setup() {
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

    //player
    fill(menu.player);
    imageMode(CENTER);
    image(Active, posPlayer.x, posPlayer.y, sizeSprite.x, sizeSprite.y);
    //ellipse(posPlayer.x, posPlayer.y, sizePlayer.x, sizePlayer.y);
    if (schild.pickedUp && schild.schildLevens == 3) {
      fill(#EBFA90, 250);
      circle(player.posPlayer.x, player.posPlayer.y, 50);
    }
    if (schild.pickedUp && schild.schildLevens == 2) {
      fill(#EBFA90, 150);
      circle(player.posPlayer.x, player.posPlayer.y, 50);
    }
    if (schild.pickedUp && schild.schildLevens == 1) {
      fill(#EBFA90, 100);
      circle(player.posPlayer.x, player.posPlayer.y, 50);
    }
  }
  void movementUpdate()
  {
    //check collision and set booleans to use down the line
    checkCollision(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.y);
    hasCollision = collisionHandler.hit;
    wallCollisonL = collisionHandler.hitWallLeft;
    wallCollisonR = collisionHandler.hitWallRight;
    if (!hasCollision)
    {
      velocity.y += GRAVITY; //werkt alleen als ik niet op een platform sta.
    } else {
      velocity.y = 0;
      player.collideWithPlatform();
    }
    if (wallCollisonR) {
      velocity.x = 0;
      velocity.x -= 3;
    } else if (wallCollisonL) {
      velocity.x = 0;
      velocity.x += 3;
    }
    //handle movement on x-axes
    if (keysPressed[LEFT] /*&& !collisionHandler.hitWallLeft*/ && !platforms.moveStage  && !wallCollisonL && !wallCollisonR)
    {
      velocity.x = -SPEED;
      walkAmount++;
      moveLeft = true;
    } else if (keysPressed[RIGHT] /*&& !collisionHandler.hitWallRight*/  && !platforms.moveStage  && !wallCollisonL && !wallCollisonR)
    {
      velocity.x = SPEED;
      walkAmount++;
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
    if (!schild.pickedUp && !sword.pickedUp && !waterBottle.pickedUp) {
      if (moveLeft && !moveRight) {
        Active = leftActive;
        if (timerLeft2 ==0) {
          timerLeft1++;
        }
        if (timerLeft1 >= 5) {
          leftActive = left1;
          timerLeft2++;
        }
        if (timerLeft2 >= 5) {
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
        if (timerRight1 >= 5) {
          rightActive = right1;
          timerRight2++;
        }
        if (timerRight2 >= 5) {
          rightActive = right2;
          timerRight1 = 0;
          timerRight2 = 0;
        }
      } 
      if (!moveLeft && !moveRight) {
        Active = right;
      }
    }

    if (schild.pickedUp && !waterBottle.pickedUp && !sword.pickedUp) {
      if (moveLeft && !moveRight) {
        Active = leftActiveS;
        if (timerLeft2 ==0) {
          timerLeft1++;
        }
        if (timerLeft1 >= 5) {
          leftActiveS = leftS1;
          timerLeft2++;
        }
        if (timerLeft2 >= 5) {
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
        if (timerRight1 >= 5) {
          rightActiveS = rightS1;
          timerRight2++;
        }
        if (timerRight2 >= 5) {
          rightActiveS = rightS2;
          timerRight1 = 0;
          timerRight2 = 0;
        }
      }
      if (!moveLeft && !moveRight) {
        Active = rightS;
      }
    }

    if (!schild.pickedUp && !sword.pickedUp && waterBottle.pickedUp) {
      if (moveLeft && !moveRight) {
        Active = leftActiveW;
        if (timerLeft2 ==0) {
          timerLeft1++;
        }
        if (timerLeft1 >= 5) {
          leftActiveW = leftW1;
          timerLeft2++;
        }
        if (timerLeft2 >= 5) {
          leftActiveW = leftW2;
          timerLeft1 = 0;
          timerLeft2 = 0;
        }
      }
      if (moveRight && !moveLeft) {
        Active = rightActiveW;
        if (timerRight2 ==0) {
          timerRight1++;
        }
        if (timerRight1 >= 5) {
          rightActiveW = rightW1;
          timerRight2++;
        }
        if (timerRight2 >= 5) {
          rightActiveW = rightW2;
          timerRight1 = 0;
          timerRight2 = 0;
        }
      }
      if (!moveLeft && !moveRight) {
        Active = rightW;
      }
    }

    if (!schild.pickedUp && sword.pickedUp && !waterBottle.pickedUp) {
      if (moveLeft && !moveRight && !sword.attacked) {
        Active = leftActiveSW;
        if (timerLeft2 ==0) {
          timerLeft1++;
        }
        if (timerLeft1 >= 5) {
          leftActiveSW = leftSW1;
          timerLeft2++;
        }
        if (timerLeft2 >= 5) {
          leftActiveSW = leftSW2;
          timerLeft1 = 0;
          timerLeft2 = 0;
        }
      }
      if (moveRight && !moveLeft) {
        Active = rightActiveSW;
        if (timerRight2 ==0) {
          timerRight1++;
        }
        if (timerRight1 >= 5) {
          rightActiveSW = rightSW1;
          timerRight2++;
        }
        if (timerRight2 >= 5) {
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
    if (hasCollision && keysPressed[UP]  && !platforms.moveStage && jump && !jumped)
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
    if (jumpTimer1 == 30) {
      jump = true;
      jumpTimer1 = 0;
    }

    if (healthbar.shieldDamage && schild.schildActivated && schild.schildLevens == 3) {
      //ellipseMode(CENTER);
      fill(#EBFA90, 900);
      circle(player.posPlayer.x, player.posPlayer.y, 30);
      schild.schildLevens = 2;
      schild.hit = true;
      healthbar.shieldDamage = false;
    }
    if (healthbar.shieldDamage && schild.schildActivated && schild.schildLevens == 2) {
      fill(#EBFA90, 600);
      circle(player.posPlayer.x, player.posPlayer.y, 30);
      schild.schildLevens = 1;
      schild.hit = true;
      healthbar.shieldDamage = false;
    }
    if (healthbar.shieldDamage && schild.schildActivated && schild.schildLevens == 1) {
      fill(#EBFA90, 300);
      circle(player.posPlayer.x, player.posPlayer.y, 30);
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

    //add velocity to posPlayer
    posPlayer.x += velocity.x;
    posPlayer.y += velocity.y;

    //Audio
    //if (moveLeft && hasCollision || moveRight && hasCollision) {
    //  playSound = true;
    //} else playSound = false;
    //if (footstepSound.isPlaying()) {
    //  checkSound = true;
    //}
    //if (!footstepSound.isPlaying()) {
    //  checkSound = false;
    //}
    //if (playSound && !checkSound) {
    //  footstepSound.play();
    //} else if (!playSound && checkSound) {
    //  footstepSound.pause();
    //}
  }

  void collideWithPlatform()
  {
    if (collisionHandler.platformHitPos.y > posPlayer.y) {
      posPlayer.y -= sizePlayer.y/2);

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
