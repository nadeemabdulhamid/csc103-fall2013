// arcEditor
// Copyright © 2011 Mark F. Russo
// Bryn Mawr College, Department of Computer Science

// Based on http://www.openprocessing.org/visuals/?visualID=4870 by Dan Bernier

CArc myArc;
Point selectedPoint;

void setup() {
  size(600, 400);
  rectMode(CENTER);
  ellipseMode(CENTER);
  smooth();
  
  myArc = new CArc(width/2, height/2);
}

void draw() {
  background(255);
  myArc.draw();
    
  // Draw labels
  fill(0);
  textSize(16);
  textAlign(RIGHT);
  text("center :", 90, 20);
  text("width :", 90, 40);
  text("height :", 90, 60);
  text("angle 1 :", 90, 80);
  text("angle 2 :", 90, 100);
  textAlign(LEFT);
  text(String.format("(%d, %d)", round(myArc.center.x), round(myArc.center.y)), 100, 20);
  text(String.format("%d", round(myArc.width)), 100, 40);
  text(String.format("%d", round(myArc.height)), 100, 60);
  text(String.format("%3.3f (%3.1f°)", myArc.start, myArc.start*(180.0/PI)), 100, 80);
  text(String.format("%3.3f (%3.1f°)", myArc.stop, myArc.stop*(180.0/PI)), 100, 100);
}
 
//=========================================
// Event Call-backs
//-----------------
 
void mousePressed() {
  selectedPoint = getPointUnderMouse();
}

void mouseDragged() {
  if (selectedPoint != null) {
    selectedPoint.x = mouseX;
    selectedPoint.y = mouseY;
    myArc.updateArc();
  }
}
 
void mouseReleased() {
  selectedPoint = null;
}

void mouseClicked() {
    println( myArc.generate() );
}

//=========================================
// Classes
//------------------

class CArc {
  // Center and corner point
  Point center;
  Point esize;
  float width = 200.0;
  float height = 150.0;
  
  // Angles
  Point ctrlStart;
  Point ctrlEnd;
  float start = 0.0;
  float stop = HALF_PI;
  
  CArc(float x, float y) {
    center = new Point(x, y);    
    esize = new Point(x+0.5*this.width, y+0.5*this.height);
    ctrlStart = new Point(x+0.5*this.width, y);
    ctrlEnd = new Point(x, y+0.5*this.height);
    
    ctrlStart.drawColor = color(0, 204, 0);
    ctrlEnd.drawColor = color(204, 0, 0);
  }

  void draw() {
    // Draw ellipse
    stroke(90, 50);
    strokeWeight(3);
    noFill();
    ellipse(center.x, center.y, width, height);

    // Draw lines
    line(center.x, center.y, ctrlStart.x, ctrlStart.y);
    line(center.x, center.y, ctrlEnd.x, ctrlEnd.y);

    // Draw points
    center.draw();
    esize.draw();
    ctrlStart.draw();
    ctrlEnd.draw();

    // Draw arc
    stroke(40, 100, 200);
    strokeWeight(5);
    noFill();
    arc( center.x, center.y, width, height, start, stop );
  }
  
  String generate() {
    return String.format("arc(%d,%d,%d,%d,%3.3f,%3.3f);", 
            round(center.x), round(center.y), round(width), round(height), start, stop);
  }
  
  void updateArc() {
    // recalculate size and angles
    float ratio = width/height;
    start = atan( ratio*(ctrlStart.y - center.y)/(ctrlStart.x - center.x));
    stop  = atan( ratio*(ctrlEnd.y - center.y)/(ctrlEnd.x - center.x));
    
    if ((ctrlStart.x - center.x) < 0.0) start += PI;
    if ((ctrlEnd.x - center.x) < 0.0) stop += PI;
    if (stop < start) stop += TWO_PI;
    
    this.width  = 2*abs(esize.x - center.x);
    this.height = 2*abs(esize.y - center.y);
  }
  
  Point[] getPoints() {
    return new Point[] { center, esize, ctrlStart, ctrlEnd };
  }
}

class Point {
  float x, y;
  float drawSize = 26;
  color drawColor = color(204, 102, 0);
 
  Point(float a, float b) {
    x = a;
    y = b;
  }
   
  void draw() {
    noStroke();
    fill(this.drawColor);
    rect(x, y, drawSize/2, drawSize/2);
  }
     
  boolean hotSpotContains(float x, float y) {
    return dist(x, y, this.x, this.y) < drawSize;
  }
   
  void updatePoints (Point newPoint) {
    x = newPoint.x;
    y = newPoint.y;
  }
}

//=========================================
// Helper functions
//------------------
 
Point getPointUnderMouse() {
  Point[] points = myArc.getPoints();
  for (int j = 0; j < points.length; j++) {
    if (points[j].hotSpotContains(mouseX, mouseY))
      return points[j];
  }
  return null;
}
 
Point averagePoint (Point[] points) {
  float xSum = 0;
  float ySum = 0;
  for (int i = 0; i < points.length; i++) {
    xSum += points[i].x;
    ySum += points[i].y;
  }
  return new Point(xSum/points.length, ySum/points.length);
}

