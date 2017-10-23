PFont starWar;
void setup() {
  size(800, 600);
  background(100);
  starWar = createFont("SFDistantGalaxyAlternate-It.ttf", 400);
}

void draw() {
  textSize(20);
  fill(255);
  noStroke();

  textAlign(LEFT);
  text("Hello World", width/2, height/2 - 30);

  textAlign(CENTER);
  text("Hello World", width/2, height/2);

  textAlign(RIGHT);
  text("Hello World", width/2, height/2 + 30);

  pushStyle();
  textFont(starWar);
  textSize(50);
  textAlign(CENTER);
  text("Hello World", width/2, height/2 + 100);
  popStyle();
}