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
  boolean gameFinished2 = true;
  int idFix = 0;

  void setup() {
    backgroundDead = loadImage("tijdelijke achtergrond zodat Tristan kan testen met dingen.png"); //Loading picture.
  }

  void update() {
    if (health.dead) {
      gameFinished = true;
      if (gameFinished && gameFinished2) {
        int day = day();
        int month = month();
        int year = year();
        String date = year + "-" + month + "-" + day;
        String qwery = "INSERT INTO Highscore (score, name, date) VALUES (" + scoreHandler.finalScore + ", '" + inloggen.userName + "'," + date + ");";
        String qwery2 = "INSERT INTO Gegevens (jumpAmount, amountWalked, bossKilled) VALUES (" + player.jumpAmount + ", " + (player.walkAmount/5) + ", " + (dragon.fightAmount - 1) + ");";
        myConnection.runQuery(qwery);
        myConnection.runQuery(qwery2);
        //executeSQL( "INSERT INTO achievement (description, difficulty) VALUES ('Extinguish 3 fireballs', 'COMPLETE!')", extinguishQuery);
        gameFinished2 = false;
      }
    }
  }


  void draw() {
    if (health.dead && !drawn) {
      amountWalked = "You have walked " + (player.walkAmount/5) + " meter";
      amountJumped = "You have jumped " + player.jumpAmount + " times";
      amountKilledDragon = "You have killed the boss " + dragon.fightAmount + " times";
      amountGamePlayed = "Game played total ";
    }
    if (health.dead) {
      imageMode(CORNER);
      image(backgroundDead, 0, 0);
      textMode(CENTER);
      fill(endText);
      textSize(textSize);
      text(end, 400, 150);
      text(finalScore + scoreHandler.finalScore, 400, 225);
      challenge.gamePlayed = true;
      deadScreenScore();
      drawn = true;
    }
  }

  void deadScreenScore() {
    getTable = true;
    if (getTable) {
      String query = "SELECT id FROM Highscore where score <> 2147483647 order by score desc;";
      Table databaseTable = myConnection.runQuery(query);
      int id = databaseTable.getStringColumn(0).length;
      idFix = id;
      //Table id = myConnection.getColumn("Highscore", "id");
      //idFix = id;
    }
    textSize(textSize * 0.5);
    textMode(CORNER);
    text(amountGamePlayed + idFix, 800, 450);
    text(amountKilledDragon, 250, 440);
    text(amountJumped, 250, 470);
    text(amountWalked, 250, 500);
    getTable = false;
  }
}
