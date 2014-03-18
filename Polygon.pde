class Polygon extends Shape {

  // properties

  // constructor
  Polygon(float objX, float objY, float objWidth, float objHeight, int timeIn) {
    super(objX, objY, objWidth, objHeight, timeIn);
    fill(_objFill);
  }

  // methods
  void display() {

    _show = _countdown.isFinished();
    if (_show) {
      boolean over = mouseOver();
      if (over) {
        fill(_black);
      } 
      else {
        fill(_objFill);
      }
      polygon(3, _objX, _objY + 8, 66, 66, -PI / 2.0);
    }
  }

  void polygon(int n, float cx, float cy, float w, float h, float startAngle) {

    noStroke();
    // fill(_black);
    float angle = TWO_PI/ n;

    /* The horizontal "radius" is one half the width;
       the vertical "radius" is one half the height */
    w = w / 2.0;
    h = h / 2.0;

    beginShape();
    for (int i = 0; i < n; i++)
    {
      vertex(cx + w * cos(startAngle + angle * i),
        cy + h * sin(startAngle + angle * i));
    }
    endShape(CLOSE);
  }

  boolean mouseOver() {
    boolean mouseOver = false;
    int hitAreaOffset = 5;
    PVector mouse = new PVector(mouseX, mouseY);
    PVector distance = position.get();
    distance.sub(mouse);
    if (distance.mag() < (_objWidth / 2) + hitAreaOffset) { //d is diameter of circle
      mouseOver = true;
    }
    return mouseOver;
  }

}