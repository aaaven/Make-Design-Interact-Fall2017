// by Aven, New Media Communication, WPP, SADA
// Sep 23rd, 2017
// Make Design Interact

// variable and animation (also try to mention iteration and mouseX, mouseY)

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  
  float rad = width/2;
  float angle = 0;
  float tr = map(mouseX, 0, width, 5, 20);
  float ta = map(mouseY, 0, height, PI / 2.0, PI / 48.0);
  float c = 255;
  
//---------------------------Pattern -----------------------------------------------------------------------    
  float x = 0, y = 0;
  while (rad >= 5) {
    fill(c);
    ellipse(x, y, rad * 2, rad * 2);
//update color, location, size
    c = 255 - c; 
    //odd and even number for black and white respectively
    rad -= tr; 
    //radius decreases, step length equals to tr (mouseX), till rad goes below 1 and terminates iteration
    //in other words: mouseX is controlling how many ellipses in pattern
    angle += ta;
    //angle increases, step length equals to ta (mouseY)
    //in other words: mouseY is controlling rotating angle of each ellipse 
    //Important: not necessarily equivalent to pattern rotation
    x += cos(angle + ta) * tr * 0.8;
    y += sin(angle + ta) * tr * 0.8;
  }
  
//---------------------------Animate----------------------------------------------------------------------
  //angle += PI / 23.0;
}