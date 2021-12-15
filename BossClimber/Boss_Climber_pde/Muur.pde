//Tigo
void muur() {
  final int START_X = 0;
  final int MAX_X = 900;
  final int ADDED_X = 30;
  
  int breedte = width/12; // breedte van de muur
  int Muur = 0;// coordinaten van de muur
  int sGetal = 22;// getal voor de strepen op de muur
  int kleur1 = 131;
  int kleur2 = 19;
  int lijnStrokeWeight = 2;
  int lijnStroke = 0;
  
  noStroke();
  rectMode(CORNER); 
  fill(kleur1, kleur2, kleur2); // kleur van de muur
  rect(Muur, Muur, breedte, height); // linker muur
  rect(width-breedte, height-height, breedte, height); // rechter muur

  //horizontale lijnen
  for (int x=START_X; x<MAX_X; x=x+ADDED_X) {
    strokeWeight(lijnStrokeWeight);
    stroke(lijnStroke);
    line(0, x, width/12, x); // rechterkant
    //line(width-3*sGetal, x, width, x); //linkerkant
    line(width/12*11+5,x,width,x);
  }
  //verticale lijnen
  for (int x=START_X; x<MAX_X; x=x+ADDED_X+ADDED_X) {// x coordinaat voor de lijnen
    int y = x+ADDED_X; //y coordinaat voor de linkerlijnen
    int z = x-ADDED_X; // y coordinaat voor de rechterlijnen
    line(breedte/3*2, x, breedte/3*2, y); //linkerkant linker strepen
    line(breedte/3, x, breedte/3, z); // linkerkant rechter strepen
    line(width-sGetal, x, width-sGetal, z); //rechterkant rechter strepen
    line(width-2*sGetal, x, width-2*sGetal, y); //rechterkant rechter strepen
  }
}
