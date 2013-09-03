// http://www.openprocessing.org/visuals/?visualID=4870
// Dan Bernier

// Updated by Mark F. Russo
// Bryn Mawr College, Department of Computer Science

Bezier bez;
Point selectedPoint;

void setup() {
  size(600, 400);
  rectMode(CENTER);
  smooth();
  strokeWeight(3);
  
  bez = new Bezier(width/2, height/2);
}

void draw() {
  background(255);
  bez.draw();
  
  // Draw labels
  fill(0);
  textSize(16);
  textAlign(RIGHT);
  text("start :", 90, 20);
  text("ctrl start :", 90, 40);
  text("ctrl end :", 90, 60);
  text("end :", 90, 80);
  textAlign(LEFT);
  text(String.format("(%d, %d)", round(bez.start.x), round(bez.start.y)), 100, 20);
  text(String.format("(%d, %d)", round(bez.ctrlStart.x), round(bez.ctrlStart.y)), 100, 40);
  text(String.format("(%d, %d)", round(bez.ctrlEnd.x), round(bez.ctrlEnd.y)), 100, 60);
  text(String.format("(%d, %d)", round(bez.end.x), round(bez.end.y)), 100, 80);
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
  println(bez.generate());
}

//=========================================
// Classes
//------------------
 
class Bezier {
  Point start;
  Point end;
  Point ctrlStart;
  Point ctrlEnd;
   
  Bezier(float x, float y) {
    float len = 30;
    start = new Point(x - len, y - len);
    end = new Point(x + len, y - len);
    ctrlStart = new Point(x - len, y + len);
    ctrlEnd = new Point(x + len, y + len);
  }
   
  void draw() {
    stroke(90, 50);
    line(start.x, start.y, ctrlStart.x, ctrlStart.y);
    line(ctrlEnd.x, ctrlEnd.y, end.x, end.y);
     
    start.draw();
    ctrlStart.draw();
    ctrlEnd.draw();
    end.draw();
   
    stroke(40, 100, 200);
    noFill();
    bezier(
      start.x, start.y,
      ctrlStart.x, ctrlStart.y,
      ctrlEnd.x, ctrlEnd.y,
      end.x, end.y);
  }

  String generate() {
    return String.format("bezier(%d,%d,%d,%d,%d,%d,%d,%d);", 
            round(start.x), round(start.y), round(ctrlStart.x), round(ctrlStart.y), 
            round(ctrlEnd.x), round(ctrlEnd.y),round(end.x), round(end.y));
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
  Point[] points = bez.getPoints();
  for (int j = 0; j < points.length; j++) {
    if (points[j].hotSpotContains(mouseX, mouseY))
      return points[j];
  }
  return null;
}

