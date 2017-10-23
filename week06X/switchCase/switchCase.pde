int mode = 0;
int loadP = 0;
void setup() {
  fullScreen();
  textAlign(CENTER);
  textSize(50);
}
void draw() {
  background(49);
  switch (mode) {
  case 0: // if(mode == 0){ do this!}
    loadMode();
    break;
  case 1: //if(mode == 1){ do that!}
    startMode();
    break;
  case 2:
    gameMode();
    break;

  case 3:
    endMode();
    break;
  }
}