import processing.video.*;
Capture cam;
void setup() {
  size(640, 480);
  String[] cameras = Capture.list();
  printArray(cameras);
  cam = new Capture(this, cameras[18]);
  cam.start();
}
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  //set(0, 0, cam);
}