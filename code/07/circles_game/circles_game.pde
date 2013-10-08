/*
 * Circles Game, Nadeem Abdul Hamid, Fall 2013
 */

int NUM_CIRCLES = 10;

float[] circleX;
float[] circleY;
float[] diameter;
int score;


void setup() {
  size(400, 400);
  background(200); 
  circleX = new float[NUM_CIRCLES];
  circleY = new float[NUM_CIRCLES];
  diameter = new float[NUM_CIRCLES];
  score = 0;

  for (int i = 0; i < NUM_CIRCLES; i++) {
    resetCircle(i);
  }
}

void resetCircle(int i) {
  circleX[i] = random(0, width);
  circleY[i] = random(0, height);
  diameter[i] = random(10, 100);
}

void draw() {
  background(255);
  fill(0);
  text("Score: " + score, 50, 50);
  for (int i = 0; i < NUM_CIRCLES; i++) {
    fill(255, 0, 0);
    ellipse(circleX[i], circleY[i], diameter[i], diameter[i]);
  }
  shrinkAll();
}

void shrinkAll() {
  for (int i = 0; i < NUM_CIRCLES; i++) {
    diameter[i] = diameter[i] - .5;
    if (diameter[i] <= 0) {
      resetCircle(i);
    }
  }
}

void mousePressed() {
  for (int i = 0; i < NUM_CIRCLES; i++) {
    if (dist(mouseX, mouseY, circleX[i], circleY[i])
      < diameter[i]) {
        score = score + int(100 - diameter[i]);
        resetCircle(i);
    }
  }
}

