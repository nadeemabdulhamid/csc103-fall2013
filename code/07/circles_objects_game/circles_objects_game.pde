/*
 * Circles Game, Nadeem Abdul Hamid, Fall 2013
 */

Circle[] circles;
int score;

void setup() {
  size(400, 400);
  background(200); 

  circles = new Circle[20];
  int i;
  for (i = 0; i < circles.length; i++) {
    circles[i] = new Circle();
  }
  score = 0;
}

void draw() {
  background(255);
  fill(0);
  text("Score: " + score, 50, 50);
  int i;
  for (i = 0; i < circles.length; i++) {
    circles[i].draw();
    circles[i].shrink();
  }
}

void mousePressed() {
  int i;
  for (i = 0; i < circles.length; i++) {
    if (circles[i].containsPoint(mouseX, mouseY)) {
      score = score + int(100 - circles[i].getDiameter());  // score for each circle inversely proportional to its size
      circles[i].resetCircle();
    }
  }
}

