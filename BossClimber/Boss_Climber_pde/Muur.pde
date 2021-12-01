void muur() {
  noStroke();
  int breedte = width/12; // breedte van de muur
  int Muur = 0;// coordinaten van de muur
  int sGetal = 22;// getal voor de strepen op de muur
  rectMode(CORNER); 
  fill(131, 19, 19); // kleur van de muur
  rect(Muur, Muur, breedte, height); // linker muur
  rect(width-breedte, height-height, breedte, height); // rechter muur

  //horizontale lijnen
  for (int x=0; x<900; x=x+30) {
    strokeWeight(2);
    stroke(0);
    line(0, x, width/12-1, x); // rechterkant
    //line(width-3*sGetal, x, width, x); //linkerkant
    line(width/12*11+5,x,width,x);
  }
  //verticale lijnen
  for (int x=30; x<900; x=x+60) {// x coordinaat voor de lijnen
    int y = x+30; //y coordinaat voor de linkerlijnen
    int z = x-30; // y coordinaat voor de rechterlijnen
    line(breedte/3*2, x, breedte/3*2, y); //linkerkant linker strepen
    line(breedte/3, x, breedte/3, z); // linkerkant rechter strepen
    line(width-sGetal, x, width-sGetal, z); //rechterkant rechter strepen
    line(width-2*sGetal, x, width-2*sGetal, y); //rechterkant rechter strepen
  }
}
