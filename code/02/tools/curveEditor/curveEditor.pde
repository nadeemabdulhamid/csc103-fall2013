// curveEditor
// Copyright © 2011 Mark F. Russo
// Bryn Mawr College, Department of Computer Science

// Based on http://www.openprocessing.org/visuals/?visualID=4870 by Dan Bernier

Curve cur;
Point selectedPoint;

void setup() {
  size(600, 400);
  rectMode(CENTER);
  smooth();
  strokeWeight(3);
  
  cur = new Curve(width/2, height/2);
}

void draw() {
  background(255);
  cur.draw();

  // Draw labels
  fill(0);
  textSize(16);
  textAlign(RIGHT);
  text("ctrl start :", 90, 20);
  text("start :", 90, 40);
  text("end :", 90, 60);
  text("ctrl end :", 90, 80);
  textAlign(LEFT);
  text(String.format("(%d, %d)", round(cur.ctrlStart.x), round(cur.ctrlStart.y)), 100, 20);
  text(String.format("(%d, %d)", round(cur.start.x), round(cur.start.y)), 100, 40);
  text(String.format("(%d, %d)", round(cur.end.x), round(cur.end.y)), 100, 60);
  text(String.format("(%d, %d)", round(cur.ctrlEnd.x), round(cur.ctrlEnd.y)), 100, 80);
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
  }
}
 
void mouseReleased() {
  selectedPoint = null;
}

void mouseClicked() {
  println( cur.generate() ); 
}

//=========================================
// Classes
//------------------
 
class Curve {
  Point start;
  Point end;
  Point ctrlStart;
  Point ctrlEnd;

  Curve(float x, float y) {
    float len = 30;
    start = new Point(x - len, y - len);
    end = new Point(x + len, y + len);
    ctrlStart = new Point(x - 2*len, y + len);
    ctrlEnd = new Point(x + 2*len, y - len);
  }
  
  void draw() {
    // Draw lines to control points
    stroke(90, 50);
    noFill();
    curve(
      ctrlStart.x, ctrlStart.y,
      ctrlStart.x, ctrlStart.y,
      start.x, start.y,
      end.x, end.y
    );
    curve(
      start.x, start.y,
      end.x, end.y,
      ctrlEnd.x, ctrlEnd.y,
      ctrlEnd.x, ctrlEnd.y
      );
      
    // Draw points
    start.draw();
    ctrlStart.draw();
    ctrlEnd.draw();
    end.draw();
   
    // Draw curve
    stroke(40, 100, 200);
    noFill();
    curve(
      ctrlStart.x, ctrlStart.y,
      start.x, start.y,
      end.x, end.y,
      ctrlEnd.x, ctrlEnd.y
      );
  }
  
  String generate() {
    return String.format("curve(%d,%d,%d,%d,%d,%d,%d,%d);", 
            round(ctrlStart.x), round(ctrlStart.y), 
            round(start.x), round(start.y), 
            round(end.x), round(end.y),
            round(ctrlEnd.x), round(ctrlEnd.y));
  }
  
  Point[] getPoints() {
    return new Point[] {
      start, ctrlStart, ctrlEnd, end };
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
  Point[] points = cur.getPoints();
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
