
/* represents a circle with some location and size
 that appears on the window, shrinks, and responds
 to mouse clicks */
class Circle {
  // fields
  float x;
  float y;
  float diameter;

  // constructor: "function" that is called every time you create an object of this class
  Circle() {
    reset();
  }

  // methods: "functions" associated with a particular class

  /* resets the fields of this object to random values */
  void reset() {
    x = random(0, width);
    y = random(0, height);
    diameter = random(10, 100);
  }

  /* draws a red circle in the window */
  void drawMe() {
    fill(255, 0, 0);
    ellipse(x, y, diameter, diameter);
  }

  /* make this circle smaller, and reset it if it gets too small */
  void shrink() {
    diameter = diameter * .97;
    //println(diameter);
    if (diameter <= 1) {
      reset();
    }
  }
  
  /* determines if this circle contains the point px, py */
  boolean containsPoint(int px, int py) {
    return (dist(px, py, x, y) <= diameter);
  }
  
  /* produces the score value of this circle */
  int scoreValue() {
    // score for each circle inversely proportional to its size
    return int(map(diameter, 10, 100, 1000, 50));
  }
}

