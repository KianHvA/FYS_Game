float x1 = width/12;
float x2 = width/2;
float rw = 200;
float rh = 25;
float ry = 75;
float qx1 = x1+rw;
float qh = ry+rh;
PVector[] vertexesBossPlatform = new PVector[8];

void Bossplatform() {
  fill(147, 147, 147);
  noStroke();
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
