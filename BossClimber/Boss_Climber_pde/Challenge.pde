//Dion
class Challenge {
  boolean extinguishQuery = false;
  boolean dragonQuery = false;
  boolean gamePlayed = false;
  boolean inDatabase = true;
  boolean inDatabase2 = true;
  boolean inDatabase3 = true;
  
  //Extinguish 3 fireballs to complete this challenge
  void fireballQuery() {
    if (extinguishQuery && inDatabase) {
      myConnection.updateQuery("INSERT INTO Achievement (description, difficulty) VALUES ('Extinguish 3 fireballs', 'COMPLETE!')");
      extinguishQuery = false;
      inDatabase = false;
    }
  }

  //Reach the boss fight to complete this challenge
  void reachBossQuery() {
    if (dragonQuery && inDatabase2) {
      myConnection.updateQuery("INSERT INTO Achievement (description, difficulty) VALUES ('Reach the boss fight', 'COMPLETE!')");
      dragonQuery = false;
      inDatabase2 = false;
    }
  }

  //Play one game of Boss Climber to complete this challenge
  void playGameQuery() {
    if (gamePlayed && inDatabase3) {
      myConnection.updateQuery("INSERT INTO Achievement (description, difficulty) VALUES ('Play a game of Boss Climber', 'COMPLETE!')");
      gamePlayed = false;
      inDatabase3 = false;
    }
  }

  //Displays challenges
  void showChallenges() {
    String achievement;
    String challenges = "SELECT DISTINCT description, difficulty FROM Achievement";
    Table databaseTable = myConnection.runQuery(challenges);
    //String[] descriptions = databaseTable.getStringColumn(0);
    //String[] complete = databaseTable.getStringColumn(1);

    for (int i = 0; i < databaseTable.getStringColumn(0).length; i++) {
      achievement = databaseTable.getStringColumn(0)[i] + ": " + databaseTable.getStringColumn(1)[i];
      textSize(30);

      text(achievement, 250, height/2 - 100 + i * 40);
    }
  }
}
