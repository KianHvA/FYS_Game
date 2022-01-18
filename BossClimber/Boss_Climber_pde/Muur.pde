//Tigo
void wall() {
  noStroke();
  int wallWidth = width/12;
  int wall = 0;
  int sGetal = 22;
  int sGetal2 = 44;
  int wallRColor = 131;
  int wallGBColor = 19;
  int lineCoordinate = 30;
  
  
  
  //muren
  rectMode(CORNER); 
  fill(wallRColor, wallGBColor, wallGBColor); 
  rect(wall, wall, wallWidth, height); 
  rect(width-wallWidth, wall, wallWidth, height);

  //horizontale lijnen
  for (int x=0; x<900; x=x+30) {
    strokeWeight(2);
    stroke(0);
    line(wall, x, width/12-1, x); // right side
    //line(width-3*sGetal, x, width, x); //left side
    line(width/12*11+5,x,width,x);
  }
  //verticale lijnen
  for (int x=30; x<900; x=x+60) {
    int y = x+lineCoordinate; //y coordinate for the left stripes
    int z = x-lineCoordinate; // y coordinate for the right stripes
    line(wallWidth/3*2, x, wallWidth/3*2, y); //left side left stripes
    line(wallWidth/3, x, wallWidth/3, z); // left side rigth stripes
    line(width-sGetal, x, width-sGetal, z); //rigth side left stripes
    line(width-sGetal2, x, width-sGetal2, y); //right side right stripes
  }
}
