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
  blue = color(54, 34, 100, 100);

  dot = new Circle(width / 2, height / 2, 10, 10, 100);
  dot.setOrbit(width / 2, height / 2, 50, 500.0f);
  
  triangle = new Polygon(width / 2, height, 10, 10);
  triangle.setOrbit(width / 2, height / 2, 200, 750.0f);
 
  ray = new Square(100,100, 5, 5, blue, 0); 
  ray.setOrbit(100, 100, 50, 1000.0f);
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
  
  ray.orbit();
  ray.display();
}
