/*
 * Turtle Race, Nadeem Abdul Hamid, Fall 2013
 *
 * image from http://www.iconarchive.com/show/tiny-animals-icons-by-iconshock/turtle-icon.html
 */


PImage turtleImage; 
float turtle1;  // 0 ... 100
float turtle2;  // 0 ... 100

void setup() {
  size(400, 400);
  turtleImage = loadImage("turtle-icon.png");
  turtle1 = 0;
  turtle2 = 0;
}

void draw() {
  background(200);
  image(turtleImage, map(turtle1, 0, 100, 0, width), 100);
  image(turtleImage, map(turtle2, 0, 100, 0, width), 200);
  moveTurtles();
}

void moveTurtles() {
  turtle1 = turtle1 + random(-.5, .75);
  turtle2 = turtle2 + random(-.5, .75);
}


