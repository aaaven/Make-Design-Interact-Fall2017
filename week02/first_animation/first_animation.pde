// by Aven, New Media Communication, WPP, SADA
// Sep 24th, 2017
// Make Design Interact

// variable and animation + sin(), cos(), noise()

float t;

void setup(){
  size(600,600);
  noStroke();
  background(0);
  colorMode(HSB); //rgba or hsba
}


void draw(){
  t = t + 0.01;
  
  pushMatrix();
  translate(width/2,height/2);

  rotate(radians(t*30));//keep rotating
  float x = noise(cos(t))*320; //float x = noise(cos(t)*320);
  float y = sin(t)*200;
  translate(x,y); //move to edge of the ellipse

  color fCol = color(noise(sin(t))*60,noise(100),255,abs(sin(t)*200)*0.8); // colorMode: HSBA
  fill(fCol); 
  ellipse(0,0, 2+abs(sin(t)*15),2+abs(cos(t)*15)); //ellipse size changes from 2 to 32
  popMatrix();
}