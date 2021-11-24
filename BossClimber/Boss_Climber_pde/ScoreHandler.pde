//gebruik scoreHandler.score(<Voer Hier Score In Voor Actie>); om jouw actie aan de score counter toe te voegen

class ScoreHandler {
  int score;
  int textSize = 30; 
  
  void setup() {
    score = 0;
    text("Score: " + score, 35, textSize);
  } 
  void draw() {
    fill(255);
    text("Score: " + score, 35, textSize);
  }
  void score(int scoreToAdd) {
    score += scoreToAdd * dragon.fightAmount;
  }
}
