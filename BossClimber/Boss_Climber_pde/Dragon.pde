class Dragon {
  float startx;
  float starty;
  float diameter;
  String Modus;
  int vliegen;
  float checkCollision;
  Dragon(float x, float y, float diameter) {
    this.startx = x;
    this.starty = y;
    this.diameter = diameter;
    startx = x;
    starty = y;
  }

 void draw() {
     stroke(0);
     fill(185,185,182);
     rect(152,50,46,48);
 }


  void update() {
    
  }
}
