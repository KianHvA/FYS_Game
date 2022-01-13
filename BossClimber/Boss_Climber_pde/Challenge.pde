class Challenge{
  boolean extinguishQuery = false;
  boolean inDatabase = true;
  
  void fireballQuery(){
    if (extinguishQuery && inDatabase){
      myConnection.updateQuery("INSERT INTO achievement (description, difficulty) VALUES ('Extinguish 3 fireballs', 'COMPLETE!')");
      extinguishQuery = false;
      inDatabase = false;
    }
  }
}
