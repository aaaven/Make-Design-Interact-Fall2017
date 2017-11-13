/*
Aven,Make Design Interact, New Media& Communication, WPP, SADA
 based on open CV for Processing example: faceDetect and LiveCamTest
 */

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage aven;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  aven = loadImage("ironman.png");
  video.start();
}

void draw() {
  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0 );
  noFill();
  //stroke(0, 255, 0);
  //Rectangle[] faces = opencv.detect();
  println(faces.length);
  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    image(aven, 1.02*faces[i].x, 0.85*faces[i].y, 1.07*faces[i].width, 1.52*faces[i].height); 
    String name = "Iron Man No." + i;
    text(name,faces[i].x,faces[i].y+1.5*faces[i].height);
  }
}

void captureEvent(Capture c) {
  c.read();
}