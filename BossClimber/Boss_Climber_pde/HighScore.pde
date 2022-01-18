//Tristan
class HighScore {
  PImage backgroundDead;
  String end = "Game Over";
  String finalScore = "final score = ";
  final float TEXTSIZE1 = 70;
  final float TEXTSIZE2 = 35;
  color endText = (#FFFFFF); //#FFFFFF = white.
  boolean drawn = false; //A boolean to show that the background and the text have been put on screen.
  boolean ending = false; //This boolean is used in other classes.
  String amountJumped; //The amount a player has jumped for in the database.
  String amountWalked; //The amount a player has walked for in the database.
  String amountKilledDragon; //The amount a player has fought the boss for in the database.
  String amountGamePlayed; //The times the game is played. This is mostly just pulled from the database.
  boolean gameFinished = false; //A boolean paierd with gameFinished2 to make sure that some part of the code doesn't run too many times.
  boolean getTable = false; //A boolean used to get a table from the database.
  boolean gameFinished2 = true; //A boolean paierd with gameFinished to make sure that some part of the code doesn't run too many times.
  int idFix = 0; //Used to copy the id and use it outside it's brackets.
  boolean highScore = false; //A boolean used to get the highest score from the database.
  boolean showHighScore = false; //A boolean that will go on true if the player has achieved a new highscore.
  boolean same = false; //A boolean that will go on true if the player has gotten the same score as his/her highscore.
  boolean oneTimeRun = true; //This boolean makes sure that a part of the code only runs once.
  String newHighScore = "New Highscore"; //String that is used to show the text on screen.
  //These are all finals that needed to replace the magic numbers or coördinates.
  final int AMOUNTSECONDS = 60;
  final int SECOND = 2;
  final int ZERO = 0;
  final int FIFTH = 5;
  final int ONCE = 1;
  final int XTEXT1_2 = 400;
  final int YTEXT1 = 150;
  final int YTEXT2 = 225;
  final int XTEXT4_5_6 = 250;
  final int YTEXT4 = 440;
  final int YTEXT5 = 470;
  final int YTEXT6 = 500;
  final int XTEXT3 = 800;
  final int YTEXT3 = 450;

  void setup() {
    backgroundDead = loadImage("tijdelijke achtergrond zodat Tristan kan testen met dingen.png"); //Loading picture.
  }

  void update() {
    if (health.dead) {
      gameFinished = true;

      if (gameFinished && gameFinished2) {
        //Getting the date to implement into the database with the highscore.
        int day = day();
        int month = month();
        int year = year();
        String date = "'" + day + "/" + month + "/" + year + "'";
        if (oneTimeRun) {
          String qweryS = "SELECT score FROM Highscore WHERE name = '" + inloggen.userName + "';"; 
          Table compare = myConnection.runQuery(qweryS);
          int[] score = new int[compare.getStringColumn(ZERO).length];

          score = compare.getIntColumn(ZERO);
          if (score.length != ZERO) {
            if (inloggen.nameExist) {
              score = compare.getIntColumn(ZERO);
              if (scoreHandler.finalScore < score[ZERO]) {
                highScore = false;
              } else if (scoreHandler.finalScore == score[ZERO]) {
                same = true;
              } else if (scoreHandler.finalScore > score[ZERO]) {
                highScore = true;
              }
              oneTimeRun = false;
              gameFinished2 = false;
            }
          }
          if (highScore) {//If the player got a new highscore it will be updated in the database.
            String update = "UPDATE Highscore SET score = " + scoreHandler.finalScore + "WHERE name = '" + inloggen.userName + "' and SET date = " + date + ";";
            myConnection.updateQuery(update);
            showHighScore = true;
            highScore = false;
          }
          String insertHighscrore = "INSERT INTO Highscore (score, name, date) VALUES (" + scoreHandler.finalScore + ", '" + inloggen.userName + "'," + date + ");";
          String qwery2 = "INSERT INTO Gegevens (jumpAmount, amountWalked, bossKilled) VALUES (" + player.jumpAmount + ", " + (player.walkAmount/FIFTH) + ", " + (dragon.fightAmount - ONCE) + ");";

          if (!highScore) {
            myConnection.updateQuery(insertHighscrore);
          }
          myConnection.updateQuery(qwery2);

          String getTimePlayed = "SELECT averagePlayTime FROM GameData;";
          Table playtime = myConnection.runQuery(getTimePlayed);
          int averagePlayTime = (playtime.getIntColumn(ZERO)[ZERO] + (timePlayedSeconds/AMOUNTSECONDS)) / SECOND;
          String updateTimePlayed = "UPDATE GameData SET averagePlayTime = " + averagePlayTime + ";";
          myConnection.updateQuery(updateTimePlayed);

          String getTotalGamesPlayed = "SELECT totalGamesPlayed FROM GameData;";
          Table totalGames = myConnection.runQuery(getTotalGamesPlayed);
          int addToGamesPlayed = (totalGames.getIntColumn(ZERO)[ZERO]++);
          String updateTotalGamesPlayed = "UPDATE GameData SET averagePlayTime = " + addToGamesPlayed + ";";
          myConnection.updateQuery(updateTotalGamesPlayed);
          //executeSQL( "INSERT INTO achievement (description, difficulty) VALUES ('Extinguish 3 fireballs', 'COMPLETE!')", extinguishQuery);
          //Querrys for 
          //myConnection.updateQuery(insertHighscrore);
          //myConnection.updateQuery(qwery2);
          gameFinished2 = false;
        }
      }
    }
  }


  void draw() {
    if (health.dead && !drawn) {
      //These lines will be displayed on the screen and are prepped here.
      amountWalked = "You have walked " + (player.walkAmount/FIFTH) + " meter";
      amountJumped = "You have jumped " + player.jumpAmount + " times";
      amountKilledDragon = "You have killed the boss " + dragon.fightAmount + " times";
      amountGamePlayed = "Game played total ";
    }
    if (health.dead) {
      //Loading an placement of the background and the text.
      imageMode(CORNER);
      image(backgroundDead, ZERO, ZERO);
      textMode(CENTER);
      fill(endText);
      textSize(TEXTSIZE1);
      text(end, XTEXT1_2, YTEXT1);
      text(finalScore + scoreHandler.finalScore, XTEXT1_2, YTEXT2);
      if (showHighScore) {
        textMode(CENTER);
        text(newHighScore, width/SECOND, height/SECOND);
      }
      challenge.gamePlayed = true;
      deadScreenScore();
      drawn = true;
    }
  }
  //Here we pull data from the database which tells us how many times the game has been played.
  void deadScreenScore() {
    getTable = true;
    if (getTable) {
      String query = "SELECT id FROM Highscore where score <> 2147483647 order by score desc;";
      Table databaseTable = myConnection.runQuery(query);
      int id = databaseTable.getStringColumn(ZERO).length;
      idFix = id;
      //Table id = myConnection.getColumn("Highscore", "id");
      //idFix = id;
    }
    //Placement of more texts.
    textSize(TEXTSIZE2);
    textMode(CORNER);
    text(amountGamePlayed + idFix, XTEXT3, YTEXT3);
    text(amountKilledDragon, XTEXT4_5_6, YTEXT4);
    text(amountJumped, XTEXT4_5_6, YTEXT5);
    text(amountWalked, XTEXT4_5_6, YTEXT6);
    getTable = false;
  }
}
