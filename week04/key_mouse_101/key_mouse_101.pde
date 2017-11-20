// Aven, Make Design Interact, New Media & Communication, WPP, SADA

float dia = 20, x = dia/2, y = dia/2, xspeed = 4, yspeed = 6;
int r=0, g=0, b=0;

void setup() {
  size (600, 600);
  smooth();
  noStroke();
}

void draw () {
  background(255);
  fill (r, g, b);
  ellipse (x, y, dia, dia);
  
  //arrow keys change the position
  if (keyPressed) {
    if (key == CODED) {
      switch (keyCode) {
      case LEFT:
        x --;
        break;
      case RIGHT:
        x ++;
        break;
      case UP:
        y --;
        break;
      case DOWN:
        y ++;
        break;
      }
    }
  }

  //move happens
  x += xspeed;
  y += yspeed;

  //boundary checks
  if (x > width-dia/2 || x < dia/2) xspeed = xspeed * -1;
  if (y > height-dia/2 || y < dia/2) yspeed *= -1;
}
void mousePressed () {
  //mouse click changes direction
  if (mouseButton == LEFT) xspeed = xspeed * -1;
  if (mouseButton == RIGHT) yspeed *= -1;
}
void keyPressed () {
  
  if (key == 'k') {
    xspeed = xspeed * 1.2;
    yspeed *= 1.2;
  }
  if (key == 'm') {
    xspeed /= 1.2;
    yspeed /= 1.2;
  }

  switch (key) {
  case 'w': 
    y -=30; 
    break;
  case  's':
    y +=30;
    break;
  case 'a':
    x -=30;
    break;
  case  'd':
    x +=30;
    break;
  case  'r':
    r+=5;
    break;
  case 'g':
    g+=5;
    break;
  case  'b':
    b+=5;
    break;
  case  'R':
    r-=5;
    break;
  case 'G':
    g-=5;
    break;
  case  'B':
    b-=5;
    break;
  }
}