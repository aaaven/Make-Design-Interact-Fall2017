//examples —> Libraries —> Video -> 
//Capture —>GettingStartedCapture
import processing.video.*; 
Capture cam;
void setup() {
  size(1280, 720); 
  cam = new Capture(this);
  cam.start();
}
void draw() { 
  if (cam.available()) {
    cam.read();
  }
  image(cam, 0, 0);
}