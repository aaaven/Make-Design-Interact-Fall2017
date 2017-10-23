boolean helpKey = false;
void setup() {
  fullScreen();
}

void draw() {
  background(random(255));
  //
  //
  if (helpKey) {
    helpMode(250);
  }
}
void keyPressed() {
  if (key == 'h' || key == 'H') {
    helpKey = !helpKey;
  }
}
void helpMode(int _hmWidth) {//DIY function
  int hmWidth = _hmWidth;
  int bar = 5;
  pushMatrix();
  translate(width - hmWidth-bar, bar);
  fill(#AAAAAA);
  noStroke();
  rect(0, 0, hmWidth, height-2*bar);
  //
  //
  popMatrix();
}