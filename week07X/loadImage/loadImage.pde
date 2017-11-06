PImage pic;

void setup(){
size(800,600);
pic = loadImage("aven.png");
}

void draw(){
background(150);
image(pic,0,0);
}