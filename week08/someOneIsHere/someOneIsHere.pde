/*
Based on Frame Differencing by Golan Levin. 
Modified by Aven, Make Design Interact, New Media& Communication, WPP, SADA 
*/


import processing.video.*;

int numPixels;
int[] previousFrame;
Capture cam;

int movementSum = 0; 
int start_ms = 0;
boolean startTrack = false;
void setup() {
  size(640, 480);
  cam = new Capture(this, width, height);
  cam.start(); 
  numPixels = cam.width * cam.height;
  previousFrame = new int[numPixels];
  loadPixels();
}

void draw() {
  if (cam.available()) {
    cam.read(); // Read the new frame from the camera
    cam.loadPixels(); // Make its pixels[] array available

    movementSum = 0; // Amount of movement in the frame
    for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame...
      color currColor = cam.pixels[i];
      color prevColor = previousFrame[i];
      // Extract the red, green, and blue components from current pixel
      int currR = (currColor >> 16) & 0xFF; // Like red(), but faster
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      // Extract red, green, and blue components from previous pixel
      int prevR = (prevColor >> 16) & 0xFF;
      int prevG = (prevColor >> 8) & 0xFF;
      int prevB = prevColor & 0xFF;
      // Compute the difference of the red, green, and blue values
      int diffR = abs(currR - prevR);
      int diffG = abs(currG - prevG);
      int diffB = abs(currB - prevB);
      movementSum += diffR + diffG + diffB;
      pixels[i] = color(diffR, diffG, diffB);
      // The following line is much faster, but more confusing to read
      //pixels[i] = 0xff000000 | (diffR << 16) | (diffG << 8) | diffB;
      previousFrame[i] = currColor;
    }
    if (movementSum > 0) {
      updatePixels();
      println(movementSum); 
    }
  }
  if (abs(movementSum - start_ms) > 1000000 && startTrack)cam.save("Alerm"+ hour() + ":" + minute() + ":" + second() + ".jpg");
}
void keyPressed() {
  if (key == ' ') {
    start_ms = movementSum;
    startTrack = true;
  }
}