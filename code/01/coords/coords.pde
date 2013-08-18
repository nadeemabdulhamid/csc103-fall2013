// Coords
// Copyright © 2011 Mark F. Russo
// Bryn Mawr College, Department of Computer Science
// Permission is granted to copy and distribute provided 
// this entire copyright notice is reproduced in all copies.

void setup() {
  size(500, 500);
  textAlign(CENTER);
  textSize(24);
  fill(0);
}

void draw() {
  background(232);
  text( "(" + str(mouseX) + ", " + str(mouseY) + ")", 250, 250);
}
