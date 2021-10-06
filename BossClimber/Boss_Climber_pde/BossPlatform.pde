float x1 = width/12;
float x2 = width/2;
float rw = 200;
float rh = 25;
float ry = 75;
float qx1 = x1+rw;
float qh = ry+rh;

void Bossplatform() {
  fill(147, 147, 147);
  noStroke();
  rect(x1, ry, rw, rh);
quad(qx1, ry, qx1, qh, width/2+120,qh+rh, width/2+120,qh);    
}
