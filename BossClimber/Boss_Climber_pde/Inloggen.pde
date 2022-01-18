//Tristan, Kian
class Inloggen {
  final int CHARACTERAMOUNT = 63; //The maximum amount of characters.
  final int CHARACTERSWAP1 = 62; //When 
  final int CHARACTERSWAP2 = -1;
  String[] nameSelector  = new String[CHARACTERAMOUNT]; //String that will hold all the letters.
  float nameNumber = 0;
  float nameNumberStart = 0;
  int nameLength = 6;
  String[] nameDef = new String[nameLength + 1]; //String that will hold the players choice of letters for his/her name.
  float timerA = 0;
  float timerB = 0;
  boolean drawn = false;
  boolean[] filledIn = new boolean[nameLength + 1]; //How much letters the player has filled in.
  final float TEXTSIZE = 70;
  final float TEXTSIZE2 = 52.5;
  int nameNumberAt = 1;
  color[] flash = new color[nameLength]; //Color for the flashing of the name.
  final int X0 = 300; //X coördinates.
  final int Y0 = 355; //Y coördinates.
  final int OFFSETLETTERS = 10;
  String name = "Name:";
  int amountFilled = 0;  //Number how much is filled in.
  int currentLetter = 61; //Number for where the player is with choosing letters.
  float filled = 0;
  boolean keyUp = false; //To check if arrow Up is pressed.
  boolean keyDown = false; //To check if arrow Down is pressed.
  boolean select = false; //To check if the player selects that letter.
  String userName = "12345"; //The name the player uses.
  String Name = "What is your username?";
  final String PRESSS = "Press Z for next character."; //Need to change later
  final color USERNAMETEXT = (#FFFFFF); //#FFFFFF = white.
  boolean loggedIn = false; //This boolean will go on true if the player has entered his/her name
  boolean nameExist = false; //If this boolean goes on true the name the player has already exists
  final int OFFSETARROWSX = 45; //This int is to offset the arrows so they are correctly lined up.
  final int OFFSETARROWSY1 = 40;
  final int OFFSETARROWSY2 = 10;
  final int ZERO = 0;
  final int X1 = 125;
  final int Y1 = 225;
  final int X2 = 75;
  final int Y2 = 506;

  void setup() {
    //Putting all the letters in and matching them to their numbers.
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
      nameDef[i] = nameSelector[amountFilled]; //Giving the name an start lay-out.
      filledIn[i] = false;
      flash[i] = color(#FFFFFF, 1000);
    }
  }

  void update() {
    constrain(amountFilled, ZERO, nameLength); //Max length of the name.
    if (currentLetter > 62) {
      currentLetter = ZERO;
    }

    if (currentLetter < ZERO) {
      currentLetter = 62;
    }
    nameDef[amountFilled] = nameSelector[currentLetter]; //When k changes the letter that the player is at changes.
    if (drawn) {
      //If the up arrow is pressed the letter goes up.
      if (keysPressed[UP] && !keyUp && !select) {
        keyUp = true;
      }

      if (keyUp) {
        currentLetter++;
        delay(90);
        keyUp = false;
      }

      //If the down arrow is pressed the letter goes down.
      if (keysPressed[DOWN] && !keyDown && !select) {
        keyDown = true;
      }

      if (keyDown) {
        currentLetter--;
        delay(90);
        keyDown = false;
      }

      //If the a button is pressed the letter gets set.
      if (keysPressed['Z'] && !keyDown && !keyUp && !select) {
        select = true;
      }

      if (select) {
        amountFilled++;
        delay(160);
        select = false;
      }

      //If the letter is at max the final name gets made.
      if (amountFilled >= 5) {
        userName = nameDef[0] + nameDef[1] + nameDef[2] + nameDef[3] + nameDef[4];
        loggedIn = true;
        //ending = true;//Ending screen!
        //if (j >= 5) {
        //  finalName = nameDef[0] + nameDef[1] + nameDef[2] + nameDef[3] + nameDef[4] /*+ nameDef[5] + nameDef[6] + nameDef[7] + nameDef[8] + nameDef[9]*/;
        //  //gameFinished = true;
        //}
      }
      if (loggedIn) {
        String queryForNameUser = "SELECT name FROM User where name = '"+ userName +"';";
        //String queryTimesPlayed = "DECLARE @IncrementValue int SET @IncrementValue = 1 UPDATE User SET timesPlayed = timesPlayed + @IncrementValue";
        Table NameTable = myConnection.runQuery(queryForNameUser);
        if (NameTable.getRowCount() == ZERO) {
          println("no name found");
          nameExist = false;
          myConnection.updateQuery("INSERT INTO User (name) VALUE ('"+ userName +"')");
        } else {
          println("name found");
          nameExist = true;
        }
        //String query = "SELECT name FROM User where name = '"+ userName +"';";
        //Table databaseTable = myConnection.runQuery(query);
        //if (databaseTable.getRowCount() == 0) {
        //  println("no name found");
        //  myConnection.runQuery("INSERT INTO User (name) VALUE ('"+ userName +"')");
        //} else {
        //  println("name found");
        //}
      }
    }
  }

  void draw() {
    //The background image and the texts get placed.
    imageMode(CORNER);
    image(Highscore.backgroundDead, ZERO, ZERO);
    textMode(CENTER);
    fill(USERNAMETEXT);
    textSize(TEXTSIZE);
    text(Name, X1, Y1);
    text(PRESSS /*+ scoreHandler.finalScore*/, X2, Y2);
    for (int i = 0; i < nameLength; i++) {
      //This is to place each letter individualy so it can be changed.
      textSize(TEXTSIZE2);
      text(name, X0 - 20, Y0);
      fill(flash[0]);
      text(nameDef[0], X0 + textWidth(name) - OFFSETLETTERS, Y0);
      fill(flash[1]);
      text(nameDef[1], X0 + textWidth(name) + textWidth('X') - OFFSETLETTERS, Y0);
      fill(flash[2]);
      text(nameDef[2], X0 + textWidth(name) + textWidth('X') * 2 - OFFSETLETTERS, Y0);
      fill(flash[3]);
      text(nameDef[3], X0 + textWidth(name) + textWidth('X') * 3 - OFFSETLETTERS, Y0);
      fill(flash[4]);
      text(nameDef[4], X0 + textWidth(name) + textWidth('X') * 4 - OFFSETLETTERS, Y0);
    }
    drawn = true;

    if (drawn) {
      if (!filledIn[amountFilled]) {//This makes sure the arrows are only drawn when the user is on that character.
        textSize(TEXTSIZE2);
        fill(#FFFFFF);
        text("^", X0 + textWidth(name) + textWidth('X') * (amountFilled + 1) - OFFSETARROWSX, Y0 - OFFSETARROWSY1);
        textSize(TEXTSIZE2);
        fill(#FFFFFF);
        pushMatrix(); //The push- and popMatrix are used here to flip the arrow upside down.
        float angle1 = radians(180);
        translate(X0 + textWidth(name) + textWidth('X') * (amountFilled + 1) - OFFSETARROWSX + textWidth('X'), Y0 + OFFSETARROWSY2);
        rotate(angle1);
        text("^", 0, 0);
        popMatrix();
      }
    }
  }
}
