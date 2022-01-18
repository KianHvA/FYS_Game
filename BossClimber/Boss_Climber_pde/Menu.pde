//Tristan: first implementation
//Dion: handleiding
//Kian: showing highscore
//Ömer: showing Achievements
class Menu {
  PFont f = createFont("Arial", 16, true); //TypeStyle = Arial
  boolean start = false, drawn = false, displayHighscore = false , displayAchievement = false;
  PVector placement1 = new PVector(width/3 + 50, 250);
  PVector placement2 = new PVector(width/3 + 200, 250);
  PVector placement3 = new PVector(width/2 - 300, 250);
  PVector placement4 = new PVector(width/2 + 25, 410);
  boolean highlight1 = true, highlight2 = false;
  color normal = 125;
  color highlight = #EFF03F;
  color rect1 = 0;
  color rect2 = 0;
  color kleur = #FFFFFF;
  float Check = 0, Time = 0;
  boolean personalize = false;
  PVector size = new PVector(275, 150);
  float timer2 = 0;
  PVector placeBS = new PVector(300, 150);
  PVector sizeBS = new PVector(1, 1);
  float timer3 = 0;
  color Rgb = #FF0000;
  color rGb = #00FF00;
  color rgB = #0000FF;
  color player = 255;
  boolean highlight3 = true, highlight4 = false, highlight5 = false;
  color rect3 = highlight;
  color rect4 = 0;
  color rect5 = 0;
  float Check2 = 0, Time2 = 0;
  boolean restart = false;
  PVector spawnP1 = new PVector(200, 250);
  PVector spawnP2 = new PVector(400, 250);
  PVector spawnP3 = new PVector(600, 250);
  PVector spawnBS = new PVector(width/2, height/2);
  final PVector pressText = new PVector(425, 510);
  final PVector titleAchievement = new PVector(400, 100);
  final PVector press = new PVector(525, 500);
  final PVector pressSize = new PVector(300, 50);
  final PVector Rplacement1 = new PVector(150, 250);
  final PVector Rplacement2 = new PVector(400, 250);
  final float textSize = 36;
  float Check3 = 0, Timer3 = 0;




  Menu() {
    start = false;
  }


  void draw() {
    restart = false;    
    stroke(rect1);
    rectMode(CORNER);
    //colorMode(rect1);
    //menu.highlight();
    fill(kleur);
    textSize(72);
    textAlign(CORNER, CORNER);
    text("BOSS CLIMBER", placement1.x - 133, 200); 
    fill(125);
    rect(placement1.x - 175, placement1.y, size.x, size.y);
    rect(placement2.x, placement2.y, size.x, size.y);
    rect(placement3.x, placement3.y+size.y + 10, size.x, size.y/1.5);
    rect(placement4.x, placement4.y, size.x, size.y/1.5);
    rectMode(CENTER);
    textFont(f, 50); //size of the texts
    fill(kleur); //color
    textLeading(50);
    text("Press A\n to start", placement1.x - 125, placement1.y + 65); //press A on pc
    text("Press Y for\ninstructions", placement1.x + 160, placement1.y + 65); //press D on pc
    textSize(textSize);
    textLeading(40);
    text("Press X for\n Highscore", placement3.x + size.x/5, placement3.y+(size.y*1.35)); // press X on pc
    textSize(72);
    textSize(textSize);
    textLeading(50);
    text("Press -> for\n Achievements", placement4.x + size.x/13, placement4.y + size.y/3.5);
    drawn = true;

    if (keysPressed['A']) {
      start = true;
    }
    if (keysPressed['X']) {
      displayHighscore = true;
    }

    //stroke(rect2);
    //rectMode(CORNER);
    //fill(125);
    ////colorMode(rect2);
    //rect(placement2.x, placement2.y, size.x, size.y);
    //rectMode(CENTER);
    //textFont(f, 36); //size of the texts
    //fill(255); //color
    //text("Personalise", placement2.x + 10, placement2.y + 60);
    //drawn = true;
  }

  void HighscoreDraw() {
    background(0);
    String highscore;
    String query = "SELECT * FROM Highscore order by score desc limit 10;";
    Table databaseTable = myConnection.runQuery(query);
    String[] scores = databaseTable.getStringColumn(1);
    String[] names = databaseTable.getStringColumn(2);
    String[] dates = databaseTable.getStringColumn(3);
    
    fill(125);
    rect(width/2, 500, 300, 80);
    
    fill(255);
    textAlign(CENTER,CENTER);
    text("Highscore:", height/2, height/2 - 100 * 2);
    fill(255);
    for (int i = 0; i < scores.length; i++) {
      highscore = names[i] + ": " + scores[i] + "        " + dates[i];
      textSize(20);
      
      text(highscore, width/2, height/2 - 100 + i * 20);
      
      textSize(30);
      text("Press A to start", width/2, 500);
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
    
     
    fill(125);
    rect(width/2, 250, 300, 40);
    
    fill(255);
    textAlign(CENTER, CENTER);
    text("Achievement:", height/2, height/2 - 100  * 2);
    fill(255);
    for (int i = 0; i < requirements.length; i++) {
      Achievement = descriptions[i] + ": " + requirements[i] + "      " + dates[i];
      textSize(20);
      
      text(Achievement, width/2, height/2 - 100 + i * 10);
      
      textSize(30);
      text("Press B for Achievements", width/2, 200);
    }
  }


  //void highlight() {
  //  if (highlight1) {
  //    highlight1 = true;
  //    highlight2 = false;
  //    rect1 = highlight;
  //    rect2 = normal;
  //  }
  //  if (highlight2) {
  //    highlight1 = false;
  //    highlight2 = true;
  //    rect2 = highlight;
  //    rect1 = normal;
  //  }

  //  if (keysPressed[RIGHT] && Check == 0) {
  //    if (rect1 == highlight) {
  //      highlight1 = false;
  //      highlight2 = true;
  //      rect2 = highlight;
  //      rect1 = normal;
  //    } else if (rect2 == highlight) {
  //      highlight1 = true;
  //      highlight2 = false;
  //      rect1 = highlight;
  //      rect2 = normal;
  //    } 
  //    Check++;
  //  }
  //  if (keysPressed[LEFT] && Check == 0) {
  //    if (rect1 == highlight) {
  //      highlight1 = false;
  //      highlight2 = true;
  //      rect2 = highlight;
  //      rect1 = normal;
  //    } else if (rect2 == highlight) {
  //      highlight1 = true;
  //      highlight2 = false;
  //      rect1 = highlight;
  //      rect2 = normal;
  //    } 
  //    Check++;
  //  }
  //  if (Check > 0) Time++;
  //  if (Time > 20) {
  //    Check = 0;
  //    Time = 0;
  //  }
  //  if (keysPressed[65] && highlight1) { //If you press the key 'A' (keyCode = 65) the menu will disapear and the game will start
  //    start = true;
  //    Check3++;
  //  } else if (keysPressed[65] && highlight2) {
  //    personalize = true;
  //    Check3++;
  //  }
  //  if (start == true) {
  //    placement1.x = -100;
  //    placement1.y = -100;
  //    placement2.x = -100;
  //    placement2.y = -100;
  //  }
  //  if (personalize == true) {
  //    placement1.x += 50;
  //    placement1.y += 50;
  //    placement2.x += 50;
  //    placement2.y += 50;
  //    timer2++;
  //  }

  //  if (timer2 > 5) {
  //    timer2 = 6;
  //    Personalize();
  //  }
  //}

  //void Personalize() {
  //  if (Check3 > 0) Timer3++;
  //  if (Timer3 > 20) {
  //    Check3 = 0;
  //    Timer3 = 0;
  //  }
  //  fill(0);
  //  rect(spawnBS.x, spawnBS.y, width, height);
  //  wall();
  //  fill(Rgb);
  //  ellipse(spawnP1.x, spawnP1.y, 20, 20);
  //  fill(rGb);
  //  ellipse(spawnP2.x, spawnP2.y, 20, 20);
  //  fill(rgB);
  //  ellipse(spawnP3.x, spawnP3.y, 20, 20);

  //  fill(125);
  //  stroke(rect3);
  //  rect(spawnP1.x - 40, spawnP1.y + 100, 75, 25);
  //  stroke(rect4);
  //  rect(spawnP2.x - 40, spawnP2.y + 100, 75, 25);
  //  stroke(rect5);
  //  rect(spawnP3.x - 40, spawnP3.y + 100, 75, 25);
  //  if (keysPressed[RIGHT] && Check2 == 0 && Check3 == 0) {
  //    if (rect3 == highlight) {
  //      highlight3 = false;
  //      highlight4 = true;
  //      highlight5 = false;
  //      rect3 = normal;
  //      rect4 = highlight;
  //      rect5 = normal;
  //    } else if (rect4 == highlight) {
  //      highlight3 = false;
  //      highlight4 = false;
  //      highlight5 = true;
  //      rect3 = normal;
  //      rect4 = normal;
  //      rect5 = highlight;
  //    } else if (rect5 == highlight) {
  //      highlight3 = true;
  //      highlight4 = false;
  //      highlight5 = false;
  //      rect3 = highlight;
  //      rect4 = normal;
  //      rect5 = normal;
  //    }
  //    Check2++;
  //  }
  //  if (keysPressed[LEFT] && Check2 == 0) {
  //    if (rect3 == highlight) {
  //      highlight3 = false;
  //      highlight4 = false;
  //      highlight5 = true;
  //      rect3 = normal;
  //      rect4 = normal;
  //      rect5 = highlight;
  //    } else if (rect4 == highlight) {
  //      highlight3 = true;
  //      highlight4 = false;
  //      highlight5 = false;
  //      rect3 = highlight;
  //      rect4 = normal;
  //      rect5 = normal;
  //    } else if (rect5 == highlight) {
  //      highlight3 = false;
  //      highlight4 = true;
  //      highlight5 = false;
  //      rect3 = normal;
  //      rect4 = highlight;
  //      rect5 = normal;
  //    }
  //    Check2++;
  //  }
  //  if (Check2 > 0) Time2++;
  //  if (Time2 > 20) {
  //    Check2 = 0;
  //    Time2 = 0;
  //  }

  //  if (keysPressed[65] && rect3 == highlight) {
  //    player = Rgb;
  //    start = true;
  //  } else if (keysPressed[65] && rect4 == highlight) {
  //    player = rGb;
  //    start = true;
  //  } else if (keysPressed[65] && rect5 == highlight) {
  //    player = rgB;
  //    start = true;
  //  }
  //}

  void restart() {
    if (restart && keysPressed['Z']) {
      halfX = -1000;
      halfY = -1000;
      //Health.xBegin = -1000;
      //Health.yBegin = -1000;
      placement1 = Rplacement1; 
      placement2 = Rplacement2;
      start = false;
      setup();
    }
  }
}
