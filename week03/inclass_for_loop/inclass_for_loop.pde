// by Aven, New Media Communication, WPP, SADA
// Sep 30th, 2017
// Make Design Interact

float gsize = 10;
float gChange = 1;
void setup() {
  size(720, 480);
}
void draw() {
  background(255);

  for (int i = 0; i < width; i += gsize) {
    //0 - height, column
    for (int j = 0; j < height; j += gsize) {
      //fill(random(255));
      noFill();
      rect(i, j, gsize, gsize);
    }
  }
  gsize += gChange;

  if (gsize > 40) {
    gChange = -1;
  }
  if (gsize < 10) {
    gChange = 1;
  }
}