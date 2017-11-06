PImage img1, img2, img3, img4;
PImage[] imgs = new PImage[14];
void setup() {
  size(800, 600);
  img1 = loadImage("frame-1.jpg");
  img2 = loadImage("frame-2.jpg");
  img3 = loadImage("frame-3.jpg");
  img4 = loadImage("frame-4.jpg");

  for (int i = 0; i < imgs.length; i ++) {
    int a = i + 1;
    String img_name = "frame-" + a + ".jpg";
    imgs[i] = loadImage(img_name);
  }
}

void draw() {
  image(imgs[0], 0, 0);
  image(imgs[1], mouseX, mouseY);
}