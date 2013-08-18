// Test Magnify
// Copyright © 2011 Mark F. Russo
// Bryn Mawr College, Department of Computer Science
// Permission is granted to copy and distribute provided this entire copyright notice
// is reproduced in all copies.

PImage img;
CMagnify glass;

void setup() {
  size(600, 400);
  
  // http://www.freefoto.com/images/15/19/15_19_8---Tree--Northumberland_web.jpg
  img = loadImage("tree.jpg");
  smooth();
  
  // Create a new magnifying glass
  glass = new CMagnify(this, 150, 2.0);
}

void draw() {
  // Draw something
  image(img, 0, 0);
  //background(255);
  //line(0,0,400,300);
  //ellipse(150, 150, 100, 50);
  
  // Draw the magnifying glass at the mouse position.
  glass.draw(mouseX, mouseY);
}



