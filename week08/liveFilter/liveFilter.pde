/*
Based on OpenCV for Processing example filterImage and LiveCamTest 
Modified by Aven, Make Design Interact, New Media& Communication, WPP, SADA 
*/

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage  gray, thresh, blur, adaptive;
int imgwidth = 640;
int imgheight = 480;

void setup() {
  // img = loadImage("test.jpg");
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2); 
  //opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);


  //gray = opencv.getSnapshot();



  video.start();
}

void draw() {
  pushMatrix();
  // scale(2);
  opencv.loadImage(video);
  image(video, 0, 0);

  opencv.threshold(80);
  thresh = opencv.getSnapshot();
  image(thresh, imgwidth/2, 0);
  
  opencv.loadImage(video);
  opencv.blur(12);  
  blur = opencv.getSnapshot();
  image(blur, 0, imgheight/2);
  
  opencv.loadImage(video);
  opencv.adaptiveThreshold(591, 1);
  adaptive = opencv.getSnapshot();
  image(adaptive, imgwidth/2, imgheight/2);
  popMatrix();

  fill(0);
  text("source", imgwidth/2 - 100, 20 );
  text("threshold", imgwidth - 100, 20 );
  text("blur", imgwidth/2 - 100, imgheight/2 + 20 );
  text("adaptive threshold", imgwidth - 150, imgheight/2 + 20 );
}

void captureEvent(Capture c) {
  c.read();
}