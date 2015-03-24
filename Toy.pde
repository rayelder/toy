/* global variables */

// declare color variables
color white;
color blue;

Circle dot;
Polygon triangle;
Square ray;

void setup() {
  size(600, 600);
  
  // set frame rate to 60 fps
  frameRate(60);

  // set the color mode to HSB instead of RGB
  colorMode(HSB, 360, 100, 100, 100);

  // assign HSB color values to color variables
  white = color(0, 0, 100, 100);
  blue = color(186, 100, 100, 100);

  triangle = new Polygon(width / 2, height, 10, 10);
  triangle.setOrbit(width / 2, height / 2, 200, 3000.0f);
}

void draw() {

  // refresh screen with white background fill
  background(white);
  noFill();
  stroke(blue);
  ellipse(width / 2, height / 2, 400, 400);
  noStroke();
  
  triangle.orbit();
  triangle.display();
}
