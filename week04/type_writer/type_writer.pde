//based on processing letter example
//by Aven, Make Design Interact, New Media& Communication, WPP, SADA

PFont f;
int margin = 10, gap = 46;
char[] letters;
int choice;
void setup() {
  size(640, 360);
  //fullScreen();
  background(0);

  // Create the font
  f = createFont("Songti.ttc", 24);
  textFont(f);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  letters = new char[131];
  letters = letters();
  choice = (int)random(letters.length);
  println(choice);
} 

void draw() {
  background(0);

  // Set the left and top margin
  translate(margin*4, margin*4);
  int index = 0;
  for (int y = 0; y < height-gap; y += gap) {
    for (int x = 0; x < width-gap; x += gap) {
      char letter = letters[index];
      if (letter == 'A' || letter == 'V' || letter == 'E' || letter == 'N') {
        fill(255, 204, 0);
      } else {
        fill(255);
      }
      if (index == choice) {
        pushStyle();
        noFill();
        stroke(255, 0, 0);
        strokeWeight(1);
        rect(x, y+5, 20, 30);
        popStyle();
      }
      // Draw the letter to the screen
      text(letter, x, y);
      index++;
    }
  }
}

char[] letters() {
  char[] out = new char[131];
  int counter = 35;
  int index = 0;
  for (int y = 0; y < height-gap; y += gap) {
    for (int x = 0; x < width-gap; x += gap) {
      char letter = char(counter);
      out[index] = letter;
      // Increment the counter
      counter++;
      index++;
    }
  }
  return out;
}

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
    case LEFT:
      choice --;
      break;
    case RIGHT:
      choice ++;
      break;
    }
  } else {
    char input = key;
    letters[choice] = input;
  }
}