//base on fade led example
//Aven, Make Design Interact, New Media& Communication, WPP, SADA

int led = 9;           // the PWM pin the LED is attached to
int brightness = 0;    // how bright the LED is
int fadeAmount = 5;    // how many points to fade the LED by

void setup() {
 pinMode(led, OUTPUT);   // declare pin 9 to be an output:
}

void loop() {
 analogWrite(led, brightness);   // set the brightness of pin 9:
 brightness = brightness + fadeAmount;   // change the brightness for next time through the loop:
 if (brightness == 0 || brightness == 255) {  // reverse the direction of the fading at the ends of the fade:
    fadeAmount = -fadeAmount ;
  }
 delay(30);   // wait for 30 milliseconds to see the dimming effect
}
