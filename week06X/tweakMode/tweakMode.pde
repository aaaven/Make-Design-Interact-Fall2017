int bgHue;
void setup() {
  //fullScreen();
  size(800, 600);
  colorMode(HSB, 100);
  rectMode(CENTER);
}

void draw() {
  bgHue = 92;
  background(bgHue, 20, 30);
  fill(30,0,0);
  rect(width/2,height/2,256,229);
  fill(30,100,100);
  ellipse(width/2-72,height/2 - 35,20,20);
}