// Binary number demo
// Copyright © 2011 Mark F. Russo
// Bryn Mawr College, Department of Computer Science
// Permission is granted to copy and distribute provided this entire copyright notice
// is reproduced in all copies.
//
// Modified by Nadeem Abdul Hamid, 2013. 

CBit[] bits = new CBit[8];

void setup() {
  size(500, 400);
  
  // Create and place CBit objects
  int x, y;
  for (int i=0; i<8; i++) {
    y = 150;
    x = 50 + i*50;
    bits[i] = new CBit(x, y, 7-i);
  }
}

void draw() {
  int x, y;
  background(255);
  
  // Draw title
  textSize(32);
  textAlign(CENTER);
  text("Click on bits to flip", 250, 75);
  
  // Draw bits and calculate decimal value
  int dec=0;
  for (int i=0; i<bits.length; i++) {
      bits[i].draw();
      dec += bits[i].val * pow(2, bits[i].pow2);
  }
  
  // Draw decimal and hexidecimal equivalents
  textSize(32);
  fill(96);
  textAlign(RIGHT, CENTER);
  text("decimal:", 250, 250);
  //text("hex:", 250, 300);
  fill(0);
  textAlign(LEFT, CENTER);
  text(str(dec), 260, 250);
  //text(hex(dec, 2), 260, 300);
}

void mousePressed() {
  for (int i=0; i<bits.length; i++) {
    if (bits[i].containsPoint(mouseX, mouseY) == true) {
      bits[i].flip();
      return;
    }
  }
}

// - - - - - - - - - 
class CBit {
  int x, y;            // position
  int width = 50;      // width
  int height = 50;     // height
  int val = 0;         // bit value
  int pow2;            // power of 2
  
  CBit (int x, int y, int pow2) {
    this.x = x;
    this.y = y;
    this.pow2 = pow2;
  }
  
  // Draw the CBit object
  void draw() {
    stroke(0);
    if (val ==0) fill(255);
    else         fill(192);
    rect(x, y, width, height);
    textSize(32);
    textAlign(CENTER, TOP);
    fill(0);
    text(str(val), x, y, width, height);
    textSize(20);
    fill(96);
    text(str((int)pow(2,pow2)), x, y-35, width, 35);
  }
  
  // Flip the bit value
  void flip() {
    if (val == 1) val = 0;
    else          val = 1;
  }
  
  // Return true if the CBit object contains the given point
  boolean containsPoint(int x, int y) {
    if (x < this.x) return false;
    if (y < this.y) return false;
    if (x > this.x + this.width) return false;
    if (y > this.y + this.height) return false;
    return true;
  }
}
