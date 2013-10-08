/*
 * Turtle Race, Nadeem Abdul Hamid, Fall 2013
 *
 * image from http://www.iconarchive.com/show/tiny-animals-icons-by-iconshock/turtle-icon.html
 */


PImage turtleImage; 
float turtle1;  // 0 ... 100
float turtle2;  // 0 ... 100
float turtle3;  // 0 ... 100
float turtle4;  // 0 ... 100
float turtle5;  // 0 ... 100
float turtle6;  // 0 ... 100
float turtle7;  // 0 ... 100
float turtle8;  // 0 ... 100
float turtle9;  // 0 ... 100
float turtle10;  // 0 ... 100
float turtle11;  // 0 ... 100
float turtle12;  // 0 ... 100
float turtle13;  // 0 ... 100
float turtle14;  // 0 ... 100
float turtle15;  // 0 ... 100
float turtle16;  // 0 ... 100
float turtle17;  // 0 ... 100
float turtle18;  // 0 ... 100
float turtle19;  // 0 ... 100
float turtle20;  // 0 ... 100

void setup() {
  size(400, 400);
  turtleImage = loadImage("turtle-icon.png");
  turtle1 = 0;
  turtle2 = 0;
  turtle3 = 0;
  turtle4 = 0;
  turtle5 = 0;
  turtle6 = 0;
  turtle7 = 0;
  turtle8 = 0;
  turtle9 = 0;
  turtle10 = 0;
  turtle11 = 0;
  turtle12 = 0;
  turtle13 = 0;
  turtle14 = 0;
  turtle15 = 0;
  turtle16 = 0;
  turtle17 = 0;
  turtle18 = 0;
  turtle19 = 0;
  turtle20 = 0;
}

void draw() {
  background(200);
  image(turtleImage, map(turtle1, 0, 100, 0, width), 0*18);
  image(turtleImage, map(turtle2, 0, 100, 0, width), 1*18);
  image(turtleImage, map(turtle3, 0, 100, 0, width), 2*18);
  image(turtleImage, map(turtle4, 0, 100, 0, width), 3*18);
  image(turtleImage, map(turtle5, 0, 100, 0, width), 4*18);
  image(turtleImage, map(turtle6, 0, 100, 0, width), 5*18);
  image(turtleImage, map(turtle7, 0, 100, 0, width), 6*18);
  image(turtleImage, map(turtle8, 0, 100, 0, width), 7*18);
  image(turtleImage, map(turtle9, 0, 100, 0, width), 8*18);
  image(turtleImage, map(turtle10, 0, 100, 0, width), 9*18);
  image(turtleImage, map(turtle11, 0, 100, 0, width), 10*18);
  image(turtleImage, map(turtle12, 0, 100, 0, width), 11*18);
  image(turtleImage, map(turtle13, 0, 100, 0, width), 12*18);
  image(turtleImage, map(turtle14, 0, 100, 0, width), 13*18);
  image(turtleImage, map(turtle15, 0, 100, 0, width), 14*18);
  image(turtleImage, map(turtle16, 0, 100, 0, width), 15*18);
  image(turtleImage, map(turtle17, 0, 100, 0, width), 16*18);
  image(turtleImage, map(turtle18, 0, 100, 0, width), 17*18);
  image(turtleImage, map(turtle19, 0, 100, 0, width), 18*18);
  image(turtleImage, map(turtle20, 0, 100, 0, width), 19*18);
  moveTurtles();
}

void moveTurtles() {
  turtle1 = turtle1 + random(-.5, .75);
  turtle2 = turtle2 + random(-.5, .75);
  turtle3 = turtle3 + random(-.5, .75);
  turtle4 = turtle4 + random(-.5, .75);
  turtle5 = turtle5 + random(-.5, .75);
  turtle6 = turtle6 + random(-.5, .75);
  turtle7 = turtle7 + random(-.5, .75);
  turtle8 = turtle8 + random(-.5, .75);
  turtle9 = turtle9 + random(-.5, .75);
  turtle10 = turtle10 + random(-.5, .75);
  turtle11 = turtle11 + random(-.5, .75);
  turtle12 = turtle12 + random(-.5, .75);
  turtle13 = turtle13 + random(-.5, .75);
  turtle14 = turtle14 + random(-.5, .75);
  turtle15 = turtle15 + random(-.5, .75);
  turtle16 = turtle16 + random(-.5, .75);
  turtle17 = turtle17 + random(-.5, .75);
  turtle18 = turtle18 + random(-.5, .75);
  turtle19 = turtle19 + random(-.5, .75);
  turtle20 = turtle20 + random(-.5, .75);
}

