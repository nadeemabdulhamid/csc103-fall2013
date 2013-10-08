/*
 * Turtle Race, Nadeem Abdul Hamid, Fall 2013
 *
 * image from http://www.iconarchive.com/show/tiny-animals-icons-by-iconshock/turtle-icon.html
 */

int NUM_TURTLES = 20;

PImage turtleImage; 
float[] turtles;

void setup() {
  size(400, 400);
  turtleImage = loadImage("turtle-icon.png");
  turtles = new float[NUM_TURTLES];
}

void draw() {
  background(200);
  float spacing = height/(NUM_TURTLES+2);
  for (int i = 0; i < NUM_TURTLES; i++) {
    image(turtleImage, map(turtles[i], 0, 100, 0, width), i*spacing);
  }
  moveTurtles();
}

void moveTurtles() {
  for (int i = 0; i < NUM_TURTLES; i++) {
    turtles[i] = turtles[i] + random(-.5, .75);
  }
}


