//by Aven, Make Design Interact, New Media Communication, WPP, SADA
//2017,Dec 18

import processing.serial.*; //dont forget to import the serial library
Serial arduino;  // create object
int val;      // store data from the arduino

void setup() {
  size(200, 200);
  //check the console and find the prot matches your arduino
  printArray(Serial.list());
  //choose port
  String portName = Serial.list()[0];
  //pay attention to the data rate
  arduino = new Serial(this, portName, 9600);
}

void draw() {
  background(255);
  if (mouseOverRect() == true) {  // If mouse is over square,
    fill(255);                    // change color and
    arduino.write('H');              // send an H to indicate mouse is over square
  } else {                        // If mouse is not over square,
    fill(0);                      // change color and
    arduino.write('L');              // send an L otherwise
  }
  rect(100, 100, 400, 400);
}

boolean mouseOverRect() { // Test if mouse is over square
  return ((mouseX >= 100) && (mouseX <= 500) && (mouseY >= 100) && (mouseY <= 500));
}


/*
  // Wiring/Arduino code:
 // Read data from the serial and turn ON or OFF a light depending on the value
 
 char val; // Data received from the serial port
 int ledPin = 4; // Set the pin to digital I/O 4
 
 void setup() {
 pinMode(ledPin, OUTPUT); // Set pin as OUTPUT
 Serial.begin(9600); // Start serial communication at 9600 bps
 }
 
 void loop() {
 while (Serial.available()) { // If data is available to read,
 val = Serial.read(); // read it and store it in val
 }
 if (val == 'H') { // If H was received
 digitalWrite(ledPin, HIGH); // turn the LED on
 } else {
 digitalWrite(ledPin, LOW); // Otherwise turn it OFF
 }
 delay(100); // Wait 100 milliseconds for next reading
 }
 
 */