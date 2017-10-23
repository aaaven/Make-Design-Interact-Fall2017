// by Aven, New Media Communication, WPP, SADA
// Sep 30th, 2017
// Make Design Interact

//switch case + define function
//introduce to write a program with different stages

int modeKey, loadCount;
void setup() {
  size(800, 600);
  background(#CCCCCE);
  textAlign(CENTER);
  textSize(36);
  noStroke();
  modeKey = 0;
  loadCount = 100;
  load();
}


void draw() {
  switch (modeKey) {
  case 0 :
    load();
    break;
  case 1:
    prep();
    break;
  case 2:
    game();
    break;
  case 3:
    end();
    break;
  }
}

void load() {
  background(#CCCCCE);

  fill(#FCFF6C);
  text("Loading, please wait.... Thanks!", width/2, height/2);
  text(loadCount + "% left...", width/2, height*2/3);

  loadCount --;
  if (loadCount < 1) modeKey = 1;
}


void prep() {
  background(random(255));
}

void game() {
}

void end() {
}