class UI {
  String jump = new String("^ = jump");
  String left = new String("< = left");
  String right = new String("> = right");
  String equip = new String("s = equip");

  void draw() {
    textSize(20);
    fill(255);
    text(jump, 760, 20);
    text(left, 760, 35);
    text(right, 760, 50);
    text(equip, 760, 65);
  }
}
