//Tristan
class HighScore {
  PImage backgroundDead;
  String end = "Game Over";
  String finalScore = "final score = ";
  float textSize = 70;
  color endText = (#FFFFFF); //#FFFFFF = white.
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
  }

  void update() {
    if (gameFinished) {
      int day = day();
      int month = month();
      int year = year();
      String date = year + "-" + month + "-" + day;
      String qwery = "INSERT INTO Highscore (score, name, jumpAmount, amountWalked, bossKilled, date) VALUES (" + scoreHandler.finalScore + ", '" + inloggen.Name + "',"  + player.jumpAmount + ", " + (player.walkAmount/5) + ", " + dragon.fightAmount + ", " + date + ");";
      String qwery2 = "INSERT INTO Gegevens (jumpAmount, amountWalked, bossKilled) VALUES (" + player.jumpAmount + ", " + (player.walkAmount/5) + ", " + (dragon.fightAmount - 1) + ");";
      myConnection.runQuery(qwery);
      myConnection.runQuery(qwery2);
      executeSQL( "INSERT INTO achievement (description, difficulty) VALUES ('Extinguish 3 fireballs', 'COMPLETE!')", extinguishQuery);
      gameFinished = false;
    }
  }


  void draw() {
    if (health.dead) {
      amountWalked = "You have walked " + (player.walkAmount/5) + " meter";
      amountJumped = "You have jumped " + player.jumpAmount + " times";
      amountKilledDragon = "You have killed the boss " + dragon.fightAmount + " times";
      amountGamePlayed = "Game played total ";
    }
  }

  void deadScreenScore() {
    getTable = true;
    if (getTable) {
      String query = "SELECT id FROM Highscore where score <> 2147483647 order by score desc;";
      Table databaseTable = myConnection.runQuery(query);
      int id = databaseTable.getStringColumn(1).length;
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
