//Tigo
void wall() {
  noStroke();
  int wallWidth = width/12;
  int wall = 0;
  int sGetal = 22;
  int sGetal2 = 44;
  int wallRColor = 131;
  int wallGBColor = 19;
  
  
  
  //muren
  rectMode(CORNER); 
  fill(wallRColor, wallGBColor, wallGBColor); 
  rect(wall, wall, wallWidth, height); 
  rect(width-wallWidth, wall, wallWidth, height);

  //horizontale lijnen
  for (int x=0; x<900; x=x+30) {
    strokeWeight(2);
    stroke(0);
    line(wall, x, width/12-1, x); // rechterkant
    //line(width-3*sGetal, x, width, x); //linkerkant
    line(width/12*11+5,x,width,x);
  }
  //verticale lijnen
  for (int x=30; x<900; x=x+60) {
    int y = x+30; //y coordinaat voor de linkerlijnen
    int z = x-30; // y coordinaat voor de rechterlijnen
    line(wallWidth/3*2, x, wallWidth/3*2, y); //linkerkant linker strepen
    line(wallWidth/3, x, wallWidth/3, z); // linkerkant rechter strepen
    line(width-sGetal, x, width-sGetal, z); //rechterkant rechter strepen
    line(width-sGetal2, x, width-sGetal2, y); //rechterkant rechter strepen
  }
}
