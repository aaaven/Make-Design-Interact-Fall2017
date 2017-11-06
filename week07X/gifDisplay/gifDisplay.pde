import gifAnimation.*;
Gif loopingGif;

void setup() {
  size(400, 200);
  loopingGif = new Gif(this, "lavalamp.gif");
  loopingGif.loop();
}

void draw() {
  background(255);
  image(loopingGif, mouseX, mouseY);
}