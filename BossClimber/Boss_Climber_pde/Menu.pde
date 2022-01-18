//Tristan: first implementation
//Dion: handleiding
//Kian: showing highscore
//Ömer: showing Achievements
class Menu {
  PFont f = createFont("Arial", 16, true); //TypeStyle = Arial
  boolean start = false;
  boolean drawn = false;
  boolean displayHighscore = false;
  boolean displayAchievement = false;
  PVector placement1 = new PVector(width/3 + 50, 250);
  PVector placement2 = new PVector(width/3 + 200, 250);
  PVector placement3 = new PVector(width/2 - 300, 250);
  PVector placement4 = new PVector(width/2 + 25, 410);
  boolean highlight1 = true;
  boolean highlight2 = false;
  final color NORMALL = 125;
  final color RECT1 = 0;
  final color RECT2 = 0;
  final color KLEUR = #FFFFFF;
  float Check = 0;
  float Time = 0;
  boolean personalize = false;
  final PVector SIZE = new PVector(275, 150);
  float timer2 = 0;
  final PVector PLACEBS = new PVector(300, 150);
  final PVector SIZEBS = new PVector(1, 1);
  float timer3 = 0;
  final color PLAYER = 255;
  float Check2 = 0, Time2 = 0;
  boolean restart = false;
  PVector spawnP1 = new PVector(200, 250);
  PVector spawnP2 = new PVector(400, 250);
  PVector spawnP3 = new PVector(600, 250);
  PVector spawnBS = new PVector(width/2, height/2);
  final PVector PRESSTEXT = new PVector(425, 510);
  final PVector TITLEACHIEVEMENT = new PVector(400, 100);
  final PVector PRES = new PVector(525, 500);
  final PVector PRESSSIZE = new PVector(300, 50);
  final PVector RPLACEMENT1 = new PVector(150, 250);
  final PVector RPLACEMENT2 = new PVector(400, 250);
  final float TEXTSIZE = 36;
  float Check3 = 0, Timer3 = 0;
  final PVector TEXT1 = new PVector(133, 200);  
  final int RECTCORRECTION1 = 175;
  final int RECTCORRECTION2 = 10;
  final float RECTCORRECTION3 = 1.5;
  final int TEXTFONT1 = 50;
  final int TEXTFONT2 = 40;
  final int TEXTFONT3 = 72;
  final int TEXTFONT4 = 20;
  final int TEXTFONT5 = 30;
  final int TEXTCORRECTION1 = 125;
  final int TEXTCORRECTION2 = 65;
  final int TEXTCORRECTION3 = 160;
  final int TEXTCORRECTION4 = 5;
  final float TEXTCORRECTION5 = 1.35;
  final int TEXTCORRECTION6 = 13;
  final int TEXTCORRECTION7 = 2;
  final int TEXTCORRECTION8 = 100;
  final int TEXTCORRECTION9 = 10;
  final float TEXTCORRECTION10 = 3.5;
  final int TEXTCOORDINATES1 = 500;
  final int TEXTCOORDINATES2 = 300;
  final int TEXTCOORDINATES3 = 80;
  final int TEXTCOORDINATES4 = 250;
  final int TEXTCOORDINATES5 = 40;
  final int TEXTCOORDINATES6 = 200;
  final int COLORS1 = 125;
  final int COLORS2 = 255;


  Menu() {
    //To make sure the menu doesn't load in instantly we make sure the contructer put's the boolean on false;
    start = false;
  }


  void draw() {
    restart = false;    
    stroke(RECT1);
    rectMode(CORNER);
    //colorMode(rect1);
    //menu.highlight();
    fill(KLEUR);
    textSize(TEXTFONT3);
    textAlign(CORNER, CORNER);
    text("BOSS CLIMBER", placement1.x - TEXT1.x, TEXT1.y); 
    fill(COLORS1);
    rect(placement1.x - RECTCORRECTION1, placement1.y, SIZE.x, SIZE.y);
    rect(placement2.x, placement2.y, SIZE.x, SIZE.y);
    rect(placement3.x, placement3.y + SIZE.y + RECTCORRECTION2, SIZE.x, SIZE.y / RECTCORRECTION3);
    rect(placement4.x, placement4.y, SIZE.x, SIZE.y / RECTCORRECTION3);
    rectMode(CENTER);
    textFont(f, TEXTFONT1); //size of the texts
    fill(KLEUR); //color
    textLeading(TEXTFONT1);
    text("Press A\n to start", placement1.x - TEXTCORRECTION1, placement1.y + TEXTCORRECTION2); //press A on pc
    text("Press Y for\ninstructions", placement1.x + TEXTCORRECTION3, placement1.y + TEXTCORRECTION2); //press D on pc
    textSize(TEXTSIZE);
    textLeading(TEXTFONT2);
    text("Press X for\n Highscore", placement3.x + SIZE.x/TEXTCORRECTION4, placement3.y+(SIZE.y*TEXTCORRECTION5)); // press X on pc
    textSize(TEXTFONT3);
    textSize(TEXTSIZE);
    textLeading(TEXTFONT1);
    text("Press -> for\n Achievements", placement4.x + SIZE.x/TEXTCORRECTION6, placement4.y + SIZE.y/TEXTCORRECTION10);
    drawn = true;

    if (keysPressed['A']) {
      start = true;
    }
    if (keysPressed['X']) {
      displayHighscore = true;
    }
  }

  void HighscoreDraw() {
    background(0);
    String highscore;
    String query = "SELECT * FROM Highscore order by score desc limit 10;";
    Table databaseTable = myConnection.runQuery(query);
    String[] scores = databaseTable.getStringColumn(1);
    String[] names = databaseTable.getStringColumn(2);
    String[] dates = databaseTable.getStringColumn(3);
    
    fill(COLORS1);
    rect(width/TEXTCORRECTION7, TEXTCOORDINATES1, TEXTCOORDINATES1, TEXTCOORDINATES1);
    
    fill(COLORS2);
    textAlign(CENTER,CENTER);
    text("Highscore:", height/TEXTCORRECTION7, height/TEXTCORRECTION7 - TEXTCORRECTION8 * TEXTCORRECTION7);
    fill(COLORS2);
    for (int i = 0; i < scores.length; i++) {
      highscore = names[i] + ": " + scores[i] + "        " + dates[i];
      textSize(TEXTFONT4);
      
      text(highscore, width/TEXTCORRECTION7, height/TEXTCORRECTION7 - TEXTCORRECTION8 + i * TEXTFONT4);
      
      textSize(TEXTFONT5);
      text("Press A to start", width/TEXTCORRECTION7, TEXTCOORDINATES1);
    }
  }
  
  void AchievementsSection() {
    background(0);
    String Achievement;
    String query = "";
    Table databaseAchievement = myConnection.runQuery(query);
    String[] descriptions = databaseAchievement.getStringColumn(0);
    String[] requirements = databaseAchievement.getStringColumn(1);
    String[] dates = databaseAchievement.getStringColumn(2);
    
     
    fill(COLORS1);
    rect(width/TEXTCORRECTION7, TEXTCOORDINATES4, TEXTCOORDINATES2, TEXTCOORDINATES5);
    
    fill(COLORS2);
    textAlign(CENTER, CENTER);
    text("Achievement:", height/TEXTCORRECTION7, height/TEXTCORRECTION7 - TEXTCORRECTION8 * TEXTCORRECTION7);
    fill(COLORS2);
    for (int i = 0; i < requirements.length; i++) {
      Achievement = descriptions[i] + ": " + requirements[i] + "      " + dates[i];
      textSize(TEXTFONT4);
      
      text(Achievement, width/TEXTCORRECTION7, height/TEXTCORRECTION7 - TEXTCORRECTION8 + i * TEXTCORRECTION9);
      
      textSize(TEXTFONT5);
      text("Press B for Achievements", width/TEXTCORRECTION7, TEXTCOORDINATES6);
    }
  }
  void restart() {
    if (restart && keysPressed['Z']) {
      placement1 = RPLACEMENT1; 
      placement2 = RPLACEMENT2;
      start = false;
      setup();
    }
  }
}
