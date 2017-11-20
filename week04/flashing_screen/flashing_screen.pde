//based on processing letter example
//by Aven, Make Design Interact, New Media& Communication, WPP, SADA

PFont f;
int startPoint = 35;
void setup() {
  //size(640, 360);
  fullScreen();
  background(0);

  // Create the font
  printArray(PFont.list());
  f = createFont("Songti.ttc", 24);
  textFont(f);
  textAlign(CENTER, CENTER);
} 

void draw() {
  background(0);

  // Set the left and top margin
  int margin = 10;
  translate(margin*4, margin*4);

  int gap = 46;
  
  int counter = startPoint;
  
  for (int y = 0; y < height-gap; y += gap) {
    for (int x = 0; x < width-gap; x += gap) {

      char letter = char(counter);
      
      if (counter % 10 == 0) {
        fill(0, 204, 255);
      } 
      else {
        fill(255);
      }

      // Draw the letter to the screen
      text(letter, x, y);

      // Increment the counter
      counter++;
      
      println(counter);
    }
  }
  startPoint ++;
}