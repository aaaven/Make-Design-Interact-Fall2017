import processing.sound.*;
SoundFile someMusicFile;
boolean check = false;
int a = 0;
void setup() {
  size(800, 600);
  someMusicFile = new SoundFile(this, "vibraphon.aiff");
}

void draw() {
  a++;
  if(a > 2000){
  check = true;
  a = 0;
  }
  if (check) {
    someMusicFile.play();
    check = false;
  }
}

void keyPressed() {
}