//by Aven, Make Design Interact, Sep 17, 2017
//first processing sketch: have a try on all programming basics in processing

float time = 0;
boolean shapeKey = true; //declare and initiate two global varibales

void setup() { 
  //put your setup(run only once) code here
  size(600, 600); //define the size of the window
  background(0); //set background color to black
  noFill(); //style setting: fill transparent color
  strokeWeight(1); //style setting: stroke weight will be 1 pixel
  stroke(255); //style setting: stroke color will be white
  ellipseMode(CORNER); //drawing function spectificing: draw ellipse from its conor
}

void draw() {
  time += 0.001; // Increase value of "time" by 0.001 per frame
  background(0); //set background color black at the beginning of every frame
  translate(width/2, height/2); //move the orgin of coord to center of screen
  for (int i = 1; i <= 30; i++) { //loop for 30 times (from i = 1 to i = 30)
    rotate(time); //rotate the coord with angle of "time"
    if (shapeKey) { //if statement: 
      rect(0, 0, 5*i, 5*i);//if shapeKey is true, do this
    } else {//if statement:
      ellipse(0, 0, 5*i, 5*i);//if shapeKey is false, do this
    }
  }
}
void keyPressed() { //monitoring keyboard interaction
  if (key == ' ') {//if statement
    shapeKey = !shapeKey;//if space key is pressed, do this(flip)
  }
}