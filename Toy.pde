/* global variables */

// declare color variables
color white;

Circle dot;
Polygon triangle;

void setup() {
  size(600, 600);

  // set the color mode to HSB instead of RGB
  colorMode(HSB, 360, 100, 100, 100);

  // assign HSB color values to color variables
  white = color(0, 0, 100, 100);

  dot = new Circle(width / 2, height / 2, 10, 10, 100);
  dot.setOrbit(width / 2, height / 2, 50, 500.0f);
  
  triangle = new Polygon(width / 2, height, 10, 10);
  triangle.setOrbit(width / 2, height / 2, 200, 750.0f); 
}

void draw() {

  // refresh screen with white background fill
  background(white);

  // move dot along orbit path
  dot.orbit();
  // display dot
  dot.display();
  
  triangle.orbit();
  triangle.display();
}
