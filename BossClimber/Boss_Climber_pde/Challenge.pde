class Challenge{
  boolean extinguishQuery = false;
  boolean dragonQuery = false;
  boolean gamePlayed = false;
  boolean inDatabase = true;
  boolean inDatabase2 = true;
  boolean inDatabase3 = true;
  
  void fireballQuery(){
    if (extinguishQuery && inDatabase){
      myConnection.updateQuery("INSERT INTO Achievement (description, difficulty) VALUES ('Extinguish 3 fireballs', 'COMPLETE!')");
      extinguishQuery = false;
      inDatabase = false;
    }
  }
  
  void reachBossQuery(){
    if (dragonQuery && inDatabase2){
      myConnection.updateQuery("INSERT INTO Achievement (description, difficulty) VALUES ('Reach the boss fight', 'COMPLETE!')");
      dragonQuery = false;
      inDatabase2 = false;
    }
  }
  
  void playGameQuery(){
    if (gamePlayed && inDatabase3){
      myConnection.updateQuery("INSERT INTO Achievement (description, difficulty) VALUES ('Play a game of Boss Climber', 'COMPLETE')");
      gamePlayed = false;
      inDatabase3 = false;
    }
  }
  
  void showChallenges(){
    String achievement;
    String challenges = "SELECT description, difficulty AS complete FROM Achievement LIMIT 3;";
    Table databaseTable = myConnection.runQuery(challenges);
    String[] descriptions = databaseTable.getStringColumn(0);
    String[] complete = databaseTable.getStringColumn(1);
    
    for (int i = 0; i < descriptions.length; i++) {
      achievement = descriptions[i] + ": " + complete[i];
      textSize(20);
      
      text(achievement, width/2, height/2 - 100 + i * 20);
    }
  }
}
