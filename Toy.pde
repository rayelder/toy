/* global variables */

// declare color variables
color white;

// declare an array called bars that contains only Square objects
ArrayList<Circle> locations;

// declare a JSON array called data
JSONArray data;

ToolTip label;

void setup() {
  size(720, 360);

  // set the color mode to HSB instead of RGB
  colorMode(HSB, 360, 100, 100, 100);

  // assign HSB color values to color variables
  white = color(0, 0, 100, 100);

  // load the JSON file into the JSON array called data
  data = loadJSONArray("data/static-data.json");

  // instantiate the bars array of Square objects
  locations = new ArrayList<Circle>();

  // loop through the JSON data and create a Square object for each JSON data object
  for (int c = 0; c < data.size(); c++) {

    // create a temporary JSON object to store the JSON data object
    JSONObject data_object = data.getJSONObject(c);

    // create temporary variables to store values from the temporary JSON object
    float x = data_object.getFloat("x");
    float y = data_object.getFloat("y");
    float w = data_object.getFloat("width");

    // create temporary variable to store fade in time (milliseconds not seconds)
    int fadeInTime = 500 + (c * 500);

    // add the Square object to the bars array using the square constructor and temporary variable
    locations.add(new Circle(c, x, y, w, fadeInTime));
  }

  // loop through the JSON data and set the GPS settings for each object
  for (int i = 0; i < locations.size(); i++) {

    // create a temporary JSON object to store the JSON data object
    JSONObject data_object = data.getJSONObject(i);

    // create temporary variables to store values from the temporary JSON object
    float lat = data_object.getFloat("lat");
    float lon = data_object.getFloat("lon");

    // create a temporary Square object as a reference to that object
    Circle ref = locations.get(i);

    // reference the Square object using "ref" and call it's GPS methods
    ref.setLatLon(lat, lon);
    ref.setGPS(0, width, 0, height);
  }

  label = new ToolTip();
  label.setAlignment(LEFT);
  label.setXY(10, 20);
  label.setLabel("Click a location");
}

void draw() {

  // refresh screen with white background fill
  background(white);

  // loop through the data array and display each Square object
  for (int i = 0; i < locations.size(); i++) {

    // create a temporary Square object as a reference to that object
    Circle ref = locations.get(i);

    // reference the Square object using "ref" and call it's display method
    ref.display();
  }

  label.display();
}

void mousePressed() {
  for (int i = 0; i < locations.size(); i++) {
    Circle ref = locations.get(i);
    boolean over = ref.mouseOver();
    if (over) {
      switch(ref.getIndex()) {
      case 0: 
        label.setLabel("Claudy, Northern Ireland");
        break;
      case 1: 
        label.setLabel("Provo, UT, USA");
        break;
      case 2: 
        label.setLabel("New York, UT, USA");
        break;
      case 3: 
        label.setLabel("Seattle, WA, USA");
        break;
      case 4: 
        label.setLabel("Huddersfield, UK");
        break;
      }

      // end for loop once clicked object has been detected
      break;
    }
  }
}

