import controlP5.*;
ControlP5 myp5;

float separateMagnitude =5.0;
float cohesionMagnitude =0.5;
float alignMagnitude =2.0;

/*
boundary box & coordinate

(boundary box properties)
//show bbox yes/no,cp5 toggle---------
//box size, 3D zone, cp5 slider bar------------------------------------

(coordinate properties)
//show coordinate yes/no,cp5 toggle------------
//coordinate axis length, cp5 slider
*/

/*
agent display:

(sphere Properties)
//display yes/no and size, cp5 toggle and slider bar----------------------
//sphere details ?
//sphere color

(line in-between Properties)
//show line between yes/no, cp5 toggle---------------------
//display color, cp5 slider bar 0 to 360----------------------------

agent behavior:
//separateMagnitude
//cohesionMagnitude
//alignMagnitude

*/

/*
agent number:
//add  balls, cp5 toggle---------------------------------------
//remove balls, cp5 toggle----------------------------------------
*/

/*
info board:
//show balls number
//show frameRate yes/no, textbox and toggle (with color)
*/

/*
data communication:
//update data yes/no, run/pause, cp5 toggle----------------------------------------------
//OSC path/port name : pass it to osc part, an input box
*/

/*
save file

//txt path input + save button, input box and button
//.stl path input + save button, input box and button
*/

void setupP5() {
  myp5 = new ControlP5(this);
  myp5.addSlider("separateMagnitude")
    .setPosition(10, 25)
    .setRange(1, 15)
    ;

  myp5.addSlider("cohesionMagnitude")
    .setPosition(10, 45)
    .setRange(0.01, 2)
    ;

  myp5.addSlider("alignMagnitude")
    .setPosition(10, 65)
    .setRange(1, 15)
    ;
  myp5.setAutoDraw(false);
}
//to test if it would work
void drawGUI() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();

  myp5.draw();
  shape(logo, width-60,height-60);

  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}
