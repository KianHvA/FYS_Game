//Kian
//gebruik scoreHandler.score(<Voer Hier Score In Voor Actie>); om jouw actie aan de score counter toe te voegen
class ScoreHandler {
  int finalScore;
  int score;
  int textSize = 30; 

  void setup() {
    score = 0;
    text("Score: " + score, 35, textSize);
  } 
  void draw() {    
    textMode(CORNER);
    fill(255);
    textSize(textSize);
    text("Score: " + score, width /12, 15);
    if (health.dead) {
      finalScore = score;
    }
  }
  void score(int scoreToAdd) {
    score += scoreToAdd * dragon.fightAmount;
  }
}
