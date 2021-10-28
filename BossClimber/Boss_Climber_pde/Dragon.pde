class Dragon {
  FireBallRain FireballRain;

  int savedTime;
  int totalTime = 1000;
  float startx;
  float starty;
  float diameter;
  String Modus;
  int vliegen;
  float checkCollision;
  boolean a;

  PVector[] vliegPatroon = {new PVector(150, 50), new PVector(600, 50), new PVector(630, 80)};

  Dragon(float x, float y, float diameter) {
    FireballRain = new FireBallRain();
    this.startx = x;
    this.starty = y;
    this.diameter = diameter;
    startx = x;
    starty = y;
  }

  void draw() {
    stroke(0);
    fill(185, 185, 182);
    rect(startx, starty, 46, 48);
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      savedTime = millis();
      a = true;
    }
    if (a) {
      //ga naar volgende positie in array
      vliegen++;
      if (vliegen >= vliegPatroon.length) {
        vliegen = 0;
      }
      //zet a weer naar false;
      a = false;
    }
  }


  void update() {
    while (player.posPlayer.y > 80) {
      //voer vlieg routine uit

      //1. maak een timer van bvb 5 seconden

      //2. als de timer voorbij is verander de x en y van de draak naar een van de voorgeprogameerde vlieg posities in de array vliegPatroon
      //je kan de variablen in vliegpatronen bereiken door (voorbeeld): startx = vliegPatroon[1].x
      if(!FireballRain.fireBallRain) {
      startx = lerp(startx, vliegPatroon[vliegen].x, 0.1);
      starty = lerp(starty, vliegPatroon[vliegen].y, 0.1);
      //als de spelers zijn positie kleiner word dan y = 80 dan gebeurt het onderste gedeelte.
      break;
      }
    } 
    //ga terug naar begin positie
    if(FireballRain.fireBallRain || player.posPlayer.y < 80) {
    startx = lerp(startx, vliegPatroon[0].x, 0.01);
    starty = lerp(starty, vliegPatroon[0].y, 0.01);
    }
    if (platforms.moveAmount == 3) {
      FireballRain.spawn();
    }
  }
}

class FireBallRain {
  float startx = xDragon;
  float starty = yDragon;
  PVector[] vliegPatroon = {new PVector(150, 50), new PVector(600, 50), new PVector(630, 80)};
  boolean fireBallRain = false;
  void spawn() {
    fireBallRain = true;
    //startx = lerp(startx, vliegPatroon[0].x, 0.01);
    //starty = lerp(starty, vliegPatroon[0].y, 0.01);
    for (int i = 0; i > fireballs.length; i++) {
      fireballs[i].posFireball.x = 150;
      fireballs[i].posFireball.y = 50;
      fireballs[i].draw();
    }
  }
}
