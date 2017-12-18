import gifAnimation.*;
Gif[] loopingGif = new Gif[10];

void setup() {
  size(400, 200);
  for(int i = 0; i < loopingGif.length; i++){
    String file_name = i + ".gif";
  loopingGif[i] = new Gif(this, file_name);
  loopingGif[i].loop();
  }
}

void draw() {
  background(255);
  image(loopingGif[0], mouseX, mouseY);
}