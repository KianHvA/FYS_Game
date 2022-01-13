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
}
