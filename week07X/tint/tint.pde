PImage img;
int clickCounter = 0;
color mouseColor;
void setup() {
  size(750, 499);
  img = requestImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1510475016&di=b409d5ac166bab0058a6153117866d89&imgtype=jpg&er=1&src=http%3A%2F%2Fimg0.ph.126.net%2FhUwMVVYSeDAs8H-E0v9Tvw%3D%3D%2F3872814204662101437.jpg");
  cursor(CROSS);
}
void draw() {
  //print(img.width+" : "+img.height);
  if (img.width >0) {
    image(img, 0, 0);
    mouseColor = img.get(mouseX, mouseY);
    float imgR = red(mouseColor);
    float imgG = green(mouseColor);
    float imgB = blue(mouseColor);
    fill(255);
    text(imgR+"，"+imgG+"， "+imgB, mouseX+20, mouseY+20);
    fill(mouseColor, 150);
    noStroke();
    ellipse(mouseX, mouseY, 50, 50);
  }
}

void mousePressed() {
  println(mouseColor);
  tint(mouseColor);
  clickCounter ++;
  img.save("image-"+clickCounter+".jpg");
  saveFrame("frame-"+clickCounter+".jpg");
}