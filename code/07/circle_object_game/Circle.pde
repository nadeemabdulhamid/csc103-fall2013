

class Circle {
  float x;
  float y;
  float diameter;

  Circle() {
    resetCircle();
  }

  void draw() {
    fill(255, 0, 0);
    ellipse(x, y, diameter, diameter);
  }

  void shrink() {
    diameter = diameter * .97;
    if (diameter < 1) {
      resetCircle();
    }
  }

  void resetCircle() {
    x = random(0, width);
    y = random(0, height);
    diameter = random(10, 100);
  }

  boolean containsPoint(float mx, float my) {
    return dist(mx, my, x, y) < diameter;
  }
  
  float getDiameter() {
     return diameter; 
  }
}

