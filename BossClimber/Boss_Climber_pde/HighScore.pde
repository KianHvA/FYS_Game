//Tristan
class HighScore {
  PImage backgroundDead;
  String end = "Game Over";
  String finalScore = "final score = ";
  float textSize = 70;
  color endText = (#FFFFFF); //#FFFFFF = white.
  int characterAmount = 63; //The maximum amount of characters.
  String[] nameSelector  = new String[characterAmount]; //String that will hold all the letters.
  float nameNumber = 0;
  float nameNumberStart = 0;
  int nameLength = 6;
  String[] nameDef = new String[nameLength + 1]; //String that will hold the players choice of letters for his/her name.
  float timerA = 0, timerB = 0;
  boolean drawn = false;
  boolean[] filledIn = new boolean[nameLength + 1]; //How much letters the player has filled in.
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
  boolean ending = false;
  String amountJumped;
  String amountWalked;
  String amountKilledDragon;
  String amountGamePlayed;
  boolean gameFinished = false;
  boolean getTable = false;
  int idFix = 0;

  void setup() {
    backgroundDead = loadImage("tijdelijke achtergrond zodat Tristan kan testen met dingen.png"); //Loading picture.
    //Putting all the letters in place in the string.
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
    constrain(j, 0, nameLength); //Max length of the name.
    if (k > 62) {
      k = 0;
    }
    if (k < 0) {
      k = 62;
    }
    if (health.dead) {
      nameDef[j] = nameSelector[k]; //When k changes the letter that the player is at changes.
      if (drawn) {
        //Timer for flashing the letters.
        //if (timerB == 0) {
        //  timerA++;
        //}
        //if (timerA > 30) {
        //  flash[j] = color(#FFFFFF, 0);
        //  timerB++;
        //}

        //if (timerB > 10) {
        //  flash[j] = color(#FFFFFF, 1000);
        //  timerA = 0;
        //  timerB = 0;
        //}
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
          finalName = nameDef[0] + nameDef[1] + nameDef[2] + nameDef[3] + nameDef[4] /*+ nameDef[5] + nameDef[6] + nameDef[7] + nameDef[8] + nameDef[9]*/;
          delay(100);
          //myConnection.updateQuery("INSERT INTO Highscore (id, score, name) VALUES (1, 1000, 'Fee Fee')");
          ending = true;//Ending screen!
          //exit();
          //if (timerB > 10) {
          //  flash[j] = color(#FFFFFF, 1000);
          //  timerA = 0;
          //  timerB = 0;
          //}
          //If the up arrow is pressed the letter goes up.
          //if (keysPressed[UP] && !keyUp && !select) {
          //  keyUp = true;
          //}
          //if (keyUp) {
          //  k++;
          //  delay(90);
          //  keyUp = false;
          //}
          ////If the down arrow is pressed the letter goes down.
          //if (keysPressed[DOWN] && !keyDown && !select) {
          //  keyDown = true;
          //}
          //if (keyDown) {
          //  k--;
          //  delay(90);
          //  keyDown = false;
          //}
          ////If the a button is pressed the letter gets set.
          //if (keysPressed['A'] && !keyDown && !keyUp && !select) {
          //  select = true;
          //}
          //if (select) {
          //  j++;
          //  delay(160);
          //  select = false;
          //}
          //If the letter is at max the final name gets made.
          if (j >= 5) {
            finalName = nameDef[0] + nameDef[1] + nameDef[2] + nameDef[3] + nameDef[4] /*+ nameDef[5] + nameDef[6] + nameDef[7] + nameDef[8] + nameDef[9]*/;
            gameFinished = true;
          }
          if (gameFinished) {
            String qwery = "INSERT INTO Highscore (score, name, jumpAmount, amountWalked, bossKilled) VALUES (" + scoreHandler.finalScore + ", '" + finalName + "',"  + player.jumpAmount + ", " + player.walkAmount + ", " + dragon.fightAmount + ");";
            myConnection.updateQuery(qwery);
            //String qwery2 = "INSERT INTO Highscore (jumpAmount, amountWalked, bossKilled) VALUES (" + player.jumpAmount + ", " + player.walkAmount + ");";
            //myConnection.updateQuery(qwery2);
            //String qwery3 = "INSERT INTO Highscore (bossKilled) VALUES (" + dragon.fightAmount + ");";
            //myConnection.updateQuery(qwery3);
            gameFinished = false;
          }
        }
      }
    }
  }


  void draw() {
    if (health.dead && !drawn) {
      amountWalked = "You have walked " + player.walkAmount + " meter";
      amountJumped = "You have jumped " + player.jumpAmount + " times";
      amountKilledDragon = "You have killed the boss " + dragon.fightAmount + " times";
      amountGamePlayed = "Game played total ";
    }
    if (health.dead) {
      //Drawing the image and all the text.
      imageMode(CORNER);
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
        text(nameDef[1], x + textWidth(name) + textWidth('X') - 75, y);
        fill(flash[2]);
        text(nameDef[2], x + textWidth(name) + textWidth('X') * 2 - 75, y);
        fill(flash[3]);
        text(nameDef[3], x + textWidth(name) + textWidth('X') * 3 - 75, y);
        fill(flash[4]);
        text(nameDef[4], x + textWidth(name) + textWidth('X') * 4 - 75, y);
        //  fill(flash[5]);
        //  text(nameDef[5], x + textWidth(name) + textWidth('X') * 5 - 75, y);
        //  fill(flash[6]);
        //  text(nameDef[6], x + textWidth(name) + textWidth('X') * 6 - 75, y);
        //  fill(flash[7]);
        //  text(nameDef[7], x + textWidth(name) + textWidth('X') * 7 - 75, y);
        //  fill(flash[8]);
        //  text(nameDef[8], x + textWidth(name) + textWidth('X') * 8 - 75, y);
        //  fill(flash[9]);
        //  text(nameDef[9], x + textWidth(name) + textWidth('X') * 9 - 75, y);
        deadScreenScore();
      }
      drawn = true;
    }
    if (drawn) {
      if (!filledIn[j]) {
        textSize(textSize*0.75);
        fill(#FFFFFF);
        text("^", x + textWidth(name) + textWidth('X') * (j + 1) - 107.5, y - 50);
        textSize(textSize*0.75);
        fill(#FFFFFF);
        pushMatrix();
        float angle1 = radians(180);
        translate(x + textWidth(name) + textWidth('X') * (j + 1) - 107.5, y + 65);
        rotate(angle1);
        text("^", 0, 0);
        popMatrix();
      }
      //if (j > 1) {
      //  flash[j-1] = color(#FFFFFF, 1000);
      //}
    }
  }

  void deadScreenScore() {
    getTable = true;
    if (getTable) {
    String query = "SELECT * FROM Highscore where score <> 2147483647 order by score desc;";
    Table databaseTable = myConnection.runQuery(query);
    int id = databaseTable.getStringColumn(2).length;
    idFix = id;
    }
    getTable = false;
    textSize(textSize * 0.5);
    textMode(CORNER);
    text(amountGamePlayed + idFix, 800, 450);
    text(amountKilledDragon, 250, 440);
    text(amountJumped, 250, 470);
    text(amountWalked, 250, 500);
  }
}
