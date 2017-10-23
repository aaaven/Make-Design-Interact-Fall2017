// by Aven, New Media Communication, WPP, SADA
// Sep 30th, 2017
// Make Design Interact

//if statement + nested for loop + hsb color

int gsize = 120;
int step = -1;
void setup() {
  size(720, 480);
  colorMode(HSB, width, height, width);
  noStroke();
  frameRate(24);
}


void draw() {
  //draw grid
  for (int i =0; i < width; i+=gsize) {
    for (int j = 0; j < height; j+=gsize) {
      fill(i+0.5*gsize, j+0.5*gsize, width-mouseX); //hsb color: x--> Hue y-->Saturation, mouseX --> Brightness
      rect(i, j, gsize, gsize);
    }
  }  
  gsize += step; //change grid size
  if (gsize >= 120 || gsize <= 1) step *= -1; //make the scale effect bounce
}