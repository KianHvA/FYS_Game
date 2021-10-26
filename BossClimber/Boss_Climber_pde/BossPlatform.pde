int x1 = width/12;
int x2 = width/2;
int rw = 200;
int rh = 25;
int ry = 3*rh;
int qx1 = x1+rw;
int qh = ry+rh;
int qh2 = qh+rh;
PVector[] vertexesBossPlatform = new PVector[8];
int newX1, newX2, newRW, newRH, newRY, newQX1, newQH, newQH2;
int levelMove = 0;

void Bossplatform() {
  fill(147, 147, 147);
  noStroke();
     if (mouseY <= 50){levelMove++;}
     if (levelMove >= 400){levelMove = 400;}
    newRW = rw + levelMove; 
    newRH = rh + levelMove;
    newRY = ry + levelMove;
    newQX1 = qx1 + levelMove;
    newQH = qh + levelMove;
    newQH2 = qh2+ levelMove;
    
    //bewegende quads
  quad(x1, newRY, qx1, newRY, qx1, newQH, x1, newQH);
  quad(qx1, newRY, qx1, newQH, width/2+120, newQH2, width/2+120, newQH);
  
  //statische quads
    quad(x1, ry, qx1, ry, qx1, qh, x1, qh);
  quad(qx1, ry, qx1, qh, width/2+120, qh+rh, width/2+120, qh);
  
 
  int i = 0;
    vertexesBossPlatform[i] = new PVector(x1, ry);
    vertexesBossPlatform[i+1] = new PVector(qx1, ry);
    vertexesBossPlatform[i+2] = new PVector(qx1, qh);
    vertexesBossPlatform[i+3] = new PVector(width/2+120, qh+rh);
    vertexesBossPlatform[i+4] = new PVector(width/2+120, qh);
    vertexesBossPlatform[i+5] = new PVector(qx1, ry);
    vertexesBossPlatform[i+6] = new PVector(x1, qh);
    vertexesBossPlatform[i+7] = new PVector(x1, ry);
}
