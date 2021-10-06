

void ladders() {
  for (int z = 805; z>0; z = z- 200) {//linkerladders
    stroke(172, 175, 19);
    strokeWeight(5);
    line(width/2-118, z, width/2-118, z+95);
    line(width/2-100, z, width/2-100, z+95);
    for (int a = 500; a>0; a=a-10) {
      if (a<100||a>200 && a<300||a>400 && a<500) {
        line(width/2-118, a, width/2-100, a);
      }
    }
  }

  for (int i = 805; i>0; i=i-200) {//rechterladders
    line(width/2+117, i, width/2+117, i-90);
    line(width/2+99, i, width/2+99, i-90);
    for (int b = 600; b>0;b=b-10) {
      if (b>100 && b<200||b>310 && b<400||b>510 && b<600) {
        line(width/2+117, b, width/2+99, b);
  }

  //for (int a = 800; a>0; a=a-30) {
  //  line(width/2-118, a, width/2-100, a);
  //}
}}}
