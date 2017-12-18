//by Aven, Make Design Interact, New Media Communication, WPP, SADA
//2017,Dec 18

import processing.serial.*; //dont forget to import the serial library
Serial arduino;  // create object
int val;      // store data from the arduino

void setup() {
  size(600, 600);
  //check the console and find the prot matches your arduino
  printArray(Serial.list());
  //choose port
  String portName = Serial.list()[0];
  //pay attention to the data rate
  arduino = new Serial(this, portName, 9600);
}

void draw() {
  if ( arduino.available() > 0) {  // If data is available,
    val = arduino.read();         // read it and store it in val
  }

  //do something with the data from arduino
  background(255);             
  fill(val);
  rect(100, 100, 400, 400);
}



/*

 // Wiring / Arduino Code
 
 int switchPin = 4;                       // Switch connected to pin 4
 
 void setup() {
 pinMode(switchPin, INPUT);             // Set pin 0 as an input
 Serial.begin(9600);                    // Start serial communication at 9600 bps
 }
 
 void loop() {
 if (digitalRead(switchPin) == HIGH) {  // If switch is ON,
 Serial.write(255);               // send 255 to Processing
 } else {                               // If NOT,
 Serial.write(0);               // send 0 to Processing
 }
 delay(100);                            // Wait 100 milliseconds
 }
 
 */