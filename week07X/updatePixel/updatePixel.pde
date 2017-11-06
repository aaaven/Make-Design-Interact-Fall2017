PImage photo; 
void setup() {
  size(750, 1000);
  photo = loadImage("1.jpg");
}
void draw() {
  loadPixels();
  for (int y = 0; y < height; y+= 10) {
    for (int x = 0; x < width; x+= 10) {
      photo.pixels[y*photo.width + x] = color(255);
    }
  }
  updatePixels();
  image(photo, 0, 0);
}