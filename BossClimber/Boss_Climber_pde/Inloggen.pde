class Inloggen {
  int characterAmount = 63; //The maximum amount of characters.
  String[] nameSelector  = new String[characterAmount]; //String that will hold all the letters.
  float nameNumber = 0;
  float nameNumberStart = 0;
  int nameLength = 6;
  String[] nameDef = new String[nameLength + 1]; //String that will hold the players choice of letters for his/her name.
  float timerA = 0, timerB = 0;
  boolean drawn = false;
  boolean[] filledIn = new boolean[nameLength + 1]; //How much letters the player has filled in.
  float textSize = 70;
  int nameNumberAt = 1;
  color[] flash = new color[nameLength]; //Color for the flashing of the name.
  int x = 300; //X coördinates.
  int y = 355; //Y coördinates.
  String name = "Name:";
  int j = 0;  //Number how much is filled in.
  int k = 61; //Number for where the player is with choosing letters.
  float filled = 0;
  boolean keyUp = false; //To check if arrow Up is pressed.
  boolean keyDown = false; //To check if arrow Down is pressed.
  boolean select = false; //To check if the player selects that letter.
  String finalName = "12345"; //The final name when the player is done
  String Name = "What is your username?";
  //String
  color userNameText = (#FFFFFF); //#FFFFFF = white.
  boolean loggedIn = false;

  void setup() {
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
      nameDef[i] = nameSelector[j]; //Giving the name an start lay-out.
      filledIn[i] = false;
      flash[i] = color(#FFFFFF, 1000);
    }
  }

  void update() {
    if (keysPressed['Q']) {
      loggedIn = true;
    }
    constrain(j, 0, nameLength); //Max length of the name.
    if (k > 62) {
      k = 0;
    }

    if (k < 0) {
      k = 62;
    }
    nameDef[j] = nameSelector[k]; //When k changes the letter that the player is at changes.
    if (drawn) {
      //If the up arrow is pressed the letter goes up.
      if (keysPressed[UP] && !keyUp && !select) {
        keyUp = true;
      }

      if (keyUp) {
        k++;
        delay(90);
        keyUp = false;
      }

      //If the down arrow is pressed the letter goes down.
      if (keysPressed[DOWN] && !keyDown && !select) {
        keyDown = true;
      }

      if (keyDown) {
        k--;
        delay(90);
        keyDown = false;
      }

      //If the a button is pressed the letter gets set.
      if (keysPressed['A'] && !keyDown && !keyUp && !select) {
        select = true;
      }

      if (select) {
        j++;
        delay(160);
        select = false;
      }

      //If the letter is at max the final name gets made.
      if (j >= 5) {
        finalName = nameDef[0] + nameDef[1] + nameDef[2] + nameDef[3] + nameDef[4];
        delay(100);
        //ending = true;//Ending screen!
        if (j >= 5) {
          finalName = nameDef[0] + nameDef[1] + nameDef[2] + nameDef[3] + nameDef[4] /*+ nameDef[5] + nameDef[6] + nameDef[7] + nameDef[8] + nameDef[9]*/;
          //gameFinished = true;
        }
      }
    }
  }

  void draw() {
    imageMode(CORNER);
    image(Highscore.backgroundDead, 0, 0);
    textMode(CENTER);
    fill(userNameText);
    textSize(textSize);
    text(Name, 125, 225);
    //text(finalScore + scoreHandler.finalScore, 400, 225);
    for (int i = 0; i < nameLength; i++) {
      textSize(textSize*0.75);
      text(name, x - 20, y);
      fill(flash[0]);
      text(nameDef[0], x + textWidth(name) - 75, y);
      fill(flash[1]);
      text(nameDef[1], x + textWidth(name) + textWidth('X') - 75, y);
      fill(flash[2]);
      text(nameDef[2], x + textWidth(name) + textWidth('X') * 2 - 75, y);
      fill(flash[3]);
      text(nameDef[3], x + textWidth(name) + textWidth('X') * 3 - 75, y);
      fill(flash[4]);
      text(nameDef[4], x + textWidth(name) + textWidth('X') * 4 - 75, y);
    }
    drawn = true;

    if (drawn) {
      if (!filledIn[j]) {
        textSize(textSize*0.75);
        fill(#FFFFFF);
        text("^", x + textWidth(name) + textWidth('X') * (j + 1) - 110, y - 40);
        textSize(textSize*0.75);
        fill(#FFFFFF);
        pushMatrix();
        float angle1 = radians(180);
        translate(x + textWidth(name) + textWidth('X') * (j + 1) - 110, y + 50);
        rotate(angle1);
        text("^", 0, 0);
        popMatrix();
      }
    }
  }
}
