/*
 * Circles Game, Nadeem Abdul Hamid, Fall 2013
 */


float circleX;
float circleY;
float diameter;
int score;


void setup() {
  size(400, 400);
  background(200); 
  score = 0;

  resetCircle();
}

void resetCircle() {
  circleX = random(0, width);
  circleY = random(0, height);
  diameter = random(10, 100);
}

void draw() {
  background(255);
  fill(0);
  text("Score: " + score, 50, 50);

  fill(255, 0, 0);
  ellipse(circleX, circleY, diameter, diameter);

  shrink();
}

void shrink() {
  diameter = diameter * .97;
  if (diameter < 1) {
    resetCircle();
  }
}

void mousePressed() {
  if (dist(mouseX, mouseY, circleX, circleY) < diameter) {
    score = score + int(100 - diameter);  // score for each circle inversely proportional to its size
    resetCircle();
  }
}
