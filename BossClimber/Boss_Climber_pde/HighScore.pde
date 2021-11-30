class HighScore {
  PImage backgroundDead;
  String end = "Game Over";
  String finalScore = "final score = ";
  float textSize = 70;
  color endText = (#FFFFFF);
  int characterAmount = 63;
  //String[] nameSelectorCaps = new String[characterAmount];
  //String[] nameSelectorLower = new String[characterAmount];
  String[] nameSelector  = new String[characterAmount];
  float nameNumber = 0;
  float nameNumberStart = 0;
  int nameLength = 10;
  String[] nameDef = new String[nameLength + 1];
  float timerA = 0, timerB = 0;
  boolean drawn = false;
  boolean[] filledIn = new boolean[nameLength + 1];
  int nameNumberAt = 1;
  //float[] flash = new float[10];
  color[] flash = new color[10];
  int x = 300;
  int y = 355;
  String name = "Name:";
  int j = 0;  //nummer hoeveel ingevuld
  int k = 61; //nummer bij welke letter het is
  float filled = 0;
  boolean keyUp = false;
  boolean keyDown = false;
  boolean select = false;
  String finalName = "123456789";

  void setup() {
    backgroundDead = loadImage("tijdelijke achtergrond zodat Tristan kan testen met dingen.png");
    nameSelector[0] = "A";
    nameSelector[1] = "B";
    nameSelector[2] = "C";
    nameSelector[3] = "D";
    nameSelector[4] = "E";
    nameSelector[5] = "F";
    nameSelector[6] = "G";
    nameSelector[7] = "H";
    nameSelector[8] = "I";
    nameSelector[9] = "J";
    nameSelector[10] = "K";
    nameSelector[11] = "L";
    nameSelector[12] = "M";
    nameSelector[13] = "N";
    nameSelector[14] = "O";
    nameSelector[15] = "P";
    nameSelector[16] = "Q";
    nameSelector[17] = "R";
    nameSelector[18] = "S";
    nameSelector[19] = "T";
    nameSelector[20] = "U";
    nameSelector[21] = "V";
    nameSelector[22] = "W";
    nameSelector[23] = "X";
    nameSelector[24] = "Y";
    nameSelector[25] = "Z";
    nameSelector[26] = "a";
    nameSelector[27] = "b";
    nameSelector[28] = "c";
    nameSelector[29] = "d";
    nameSelector[30] = "e";
    nameSelector[31] = "f";
    nameSelector[32] = "g";
    nameSelector[33] = "h";
    nameSelector[34] = "i";
    nameSelector[35] = "j";
    nameSelector[36] = "k";
    nameSelector[37] = "l";
    nameSelector[38] = "m";
    nameSelector[39] = "n";
    nameSelector[40] = "o";
    nameSelector[41] = "p";
    nameSelector[42] = "q";
    nameSelector[43] = "r";
    nameSelector[44] = "s";
    nameSelector[45] = "t";
    nameSelector[46] = "u";
    nameSelector[47] = "v";
    nameSelector[48] = "w";
    nameSelector[49] = "x";
    nameSelector[50] = "y";
    nameSelector[51] = "z";
    nameSelector[52] = "!";
    nameSelector[53] = ",";
    nameSelector[54] = ".";
    nameSelector[55] = "?";
    nameSelector[56] = "+";
    nameSelector[57] = "-";
    nameSelector[58] = "*";
    nameSelector[59] = "@";
    nameSelector[60] = "^";
    nameSelector[61] = "_";
    nameSelector[62] = " ";
    for ( int i = 0; i < nameLength; i++) {
      nameDef[i] = nameSelector[j];
      filledIn[i] = false;
      flash[i] = color(#FFFFFF, 255);
    }
  }

  void update() {
    constrain(j, 0, nameLength);
    if (k > 62) {
      k = 0;
    }
    if (k < 0) {
      k = 62;
    }
    if (health.dead) {
      nameDef[j] = nameSelector[k];
      if (drawn) {
        if (timerB == 0) {
          timerA++;
        }
        if (timerA > 30) {
          flash[j] = color(#FFFFFF, 0);
          timerB++;
        }

        if (timerB > 10) {
          flash[j] = color(#FFFFFF, 1000);
          timerA = 0;
          timerB = 0;
        }

        if (keysPressed[UP] && !keyUp && !select) {
          keyUp = true;
        }
        if (keyUp) {
          k++;
          delay(90);
          keyUp = false;
        }
        if (keysPressed[DOWN] && !keyDown && !select) {
          keyDown = true;
        }
        if (keyDown) {
          k--;
          delay(90);
          keyDown = false;
        }
        if (keysPressed['A'] && !keyDown && !keyUp && !select) {
          select = true;
        }
        if (select) {
          j++;
          delay(90);
          select = false;
        }
        if (j >= 10) {
          finalName = nameDef[0] + nameDef[1] + nameDef[2] + nameDef[3] + nameDef[4] + nameDef[5] + nameDef[6] + nameDef[7] + nameDef[8] + nameDef[9];
          delay(100);
          exit();
        }
      }
    }
  } 
  void draw() {
    if (health.dead) {
      image(backgroundDead, 0, 0);
      textMode(CENTER);
      fill(endText);
      textSize(textSize);
      text(end, 400, 150);
      text(finalScore + scoreHandler.finalScore, 400, 225);
      for (int i = 0; i < nameLength; i++) {
        //text("Name: " /*+ fill(flash[i])*/ + nameDef[0] + nameDef[1] + nameDef[2] + nameDef[3] + nameDef[4] + nameDef[5] + nameDef[6] + nameDef[7] + nameDef[8] + nameDef[9], 400, 285);
        //text("Name: " + nameDef[i], 400, 285);
        textSize(textSize*0.75);
        text(name, x - 20, y);
        fill(flash[0]);
        text(nameDef[0], x + textWidth(name) - 75, y);
        fill(flash[1]);
        text(nameDef[1], x + textWidth(name) + textWidth(nameDef[0]) - 75, y);
        fill(flash[2]);
        text(nameDef[2], x + textWidth(name) + textWidth(nameDef[0]) * 2 - 75, y);
        fill(flash[3]);
        text(nameDef[3], x + textWidth(name) + textWidth(nameDef[0]) * 3 - 75, y);
        fill(flash[4]);
        text(nameDef[4], x + textWidth(name) + textWidth(nameDef[0]) * 4 - 75, y);
        fill(flash[5]);
        text(nameDef[5], x + textWidth(name) + textWidth(nameDef[0]) * 5 - 75, y);
        fill(flash[6]);
        text(nameDef[6], x + textWidth(name) + textWidth(nameDef[0]) * 6 - 75, y);
        fill(flash[7]);
        text(nameDef[7], x + textWidth(name) + textWidth(nameDef[0]) * 7 - 75, y);
        fill(flash[8]);
        text(nameDef[8], x + textWidth(name) + textWidth(nameDef[0]) * 8 - 75, y);
        fill(flash[9]);
        text(nameDef[9], x + textWidth(name) + textWidth(nameDef[0]) * 9 - 75, y);
      }
      drawn = true;
    }
    if (drawn) {
      if (!filledIn[j]) {
        textSize(textSize*0.75);
        fill(#FFFFFF);
        text("^", x + textWidth(name) + textWidth(nameDef[0]) * (j + 1) - 90, y - 70);
        textSize(textSize*0.75);
        fill(#FFFFFF);
        rotate(PI);
        text("^", x + textWidth(name) + textWidth(nameDef[0]) * (j+1) - 90, y + 70);
      }
    }
  }
}