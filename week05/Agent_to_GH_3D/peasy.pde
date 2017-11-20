import peasy.*;
import processing.opengl.*;

PeasyCam cam;

void setupPeasy() {
  cam = new PeasyCam(this, 1200);
  cam.setMinimumDistance(15);
  cam.setMaximumDistance(2500);
}