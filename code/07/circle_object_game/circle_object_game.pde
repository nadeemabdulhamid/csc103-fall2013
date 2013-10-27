/*
 * Circles Game, Nadeem Abdul Hamid, Fall 2013
 */

Circle c;
int score;

void setup() {
  size(400, 400);
  background(200); 

  c = new Circle();
  score = 0;
}

void draw() {
  background(255);
  fill(0);
  text("Score: " + score, 50, 50);
  c.draw();
  c.shrink();
}

void mousePressed() {
  if (c.containsPoint(mouseX, mouseY)) {
    score = score + int(100 - c.getDiameter());  // score for each circle inversely proportional to its size
    c.resetCircle();
  }
}




