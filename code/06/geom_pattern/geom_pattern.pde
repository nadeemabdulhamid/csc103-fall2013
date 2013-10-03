
int startX = 0;
int startY = 0;


void setup() {
  size(500, 500);
}


void draw() {
  background(255);
  for (int x = startX; x <= width + 50; x = x + 100) {
    for (int y = startY; y <= height + 50; y = y + 100) {
      pushMatrix();
      translate(x, y);
      scale(.5);
      fill(map(dist(mouseX, mouseY, x, y), 0, 500, 255, 0));
      drawOne();
      popMatrix();
    }
  }
}



void drawOne() {
  //rect(-45, -45, 90, 90);
  //drawPoly(5, 50);
  drawStar(10, 50, 35);
  float deg;
  for (deg = 0; deg < 360; deg = deg + 60) {
    pushMatrix();
    rotate(radians(deg + 15));
    arc(0, -50, 100, 100, PI, 2*PI, CHORD);
    popMatrix();
  }
}



void drawPoly(int points, float radius) {
  int p;
  beginShape();
  for (p = 0; p < points; p++) {
    float angle = p * 360/points;
    float x = radius * cos(radians(angle));
    float y = radius * sin(radians(angle));
    vertex(x, y);
  } 
  endShape(CLOSE);
}



void drawStar(int points, float outerRadius, float innerRadius) {
  int totalPoints = points * 2;
  int p;
  beginShape();
  for (p = 0; p < totalPoints; p++) {
    float angle = p * 360/totalPoints;
    //println(angle);
    float radius;
    if (p % 2 == 0) {
      radius = outerRadius;
    } else {
      radius = innerRadius; 
    }
    float x = radius * cos(radians(angle));
    float y = radius * sin(radians(angle));
    vertex(x, y);
  }
  endShape(CLOSE);
}




void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      startX = startX + 1;
      if (startX > 50) startX = -50;
    } 
    else if (keyCode == LEFT) {
      startX = startX - 1;
      if (startX < -50) startX = 50;
    } 
    else if (keyCode == UP) {
      startY = startY - 1;
      if (startY < -50) startY = 50;
    } else if (keyCode == DOWN) {
       startY = startY + 1;
      if (startY > 50) startY = -50; 
    }
  }
}

