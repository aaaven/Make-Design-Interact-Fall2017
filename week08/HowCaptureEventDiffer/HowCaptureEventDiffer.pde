import processing.video.*;

Capture cam;
int a  = 0;
void setup() {
  size(640, 480);

  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
  } 
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);

    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[0]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);

    // Start capturing the images from the camera
    cam.start();
  }
}

void draw() {
  //if (cam.available() == true) {
  //  cam.read();
  //}
  image(cam, 0, 0, width, height);
  println("draw loop  +  " + frameCount);
}

void captureEvent(Capture c) {
  a ++;
  if (a % 10 == 5) {
    c.read();
    println("event  +  " + frameCount);
  }
}