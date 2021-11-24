class Menu {
  PFont f = createFont("Arial", 16, true); //TypeStyle = Arial
  boolean start = false, drawn = false;
  PVector placement1 = new PVector(200, 250);
  PVector placement2 = new PVector(400, 250);
  boolean highlight1 = true, highlight2 = false;
  color normal = 125;
  color highlight = #EFF03F;
  color rect1 = 0;
  color rect2 = 0;
  float Check = 0, Time = 0;
  boolean personalize = false;
  PVector size = new PVector(400, 200);
  float timer2 = 0;
  PVector placeBS = new PVector(400, 300);
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
  final PVector Rplacement1 = new PVector(150, 250);
  final PVector Rplacement2 = new PVector(400, 250);
  float Check3 = 0, Timer3 = 0;




  Menu() {
    start = false;
  }


  void draw() {
    restart = false;
    stroke(rect1);
    rectMode(CORNER);
    fill(125);
    //colorMode(rect1);
    rect(placement1.x, placement1.y, size.x, size.y);
    rectMode(CENTER);
    textFont(f, 108); //size of the texts
    fill(255); //color
    text("Play", placement1.x + 100, placement1.y + 130);
    drawn = true;
    
    if(keysPressed['A']) {
     start = true; 
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
//  muur();
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
