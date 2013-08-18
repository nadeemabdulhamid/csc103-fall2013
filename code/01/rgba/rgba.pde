// RGBA
// Copyright © 2011 Mark F. Russo
// Bryn Mawr College, Department of Computer Science
// Permission is granted to copy and distribute provided this 
// entire copyright notice is reproduced in all copies.
//
// Modified by Nadeem Abdul Hamid, 2013 (better support processingjs)
/* @pjs preload="data/tree.jpg"; */

CSlider slideR;
CSlider slideG;
CSlider slideB;
CSlider slideA;

PImage img;

// - - - - - - - - - - - 
void setup() {
  size(600, 400);
  smooth();
  
  // Create one CSlider object for R, G, B and A color components
  slideR = new CSlider(90, 80, 30, 0, "R");
  slideG = new CSlider(130, 80, 30, 0, "G");
  slideB = new CSlider(170, 80, 30, 0, "B");
  slideA = new CSlider(210, 80, 30, 255, "A");
  
  // Load image for background
  img = loadImage("data/tree.jpg");
}

void draw() {  
  // Draw background.
  // Note: Anything can be drawn here to investigate how the alpha channel works,
  //       including a simple background fill.
  //background(255,0,0);
  image(img, 0, 0);
  
  slideR.draw();      // Draw sliders
  slideG.draw();
  slideB.draw();
  slideA.draw();
  
  stroke(0);          // Draw color box
  strokeWeight(1);
  fill(slideR.val, slideG.val, slideB.val, slideA.val);
  rect(260, 80, 256, 256);
}

void mousePressed() {
  // Pass all mousePressed events to CSliders
  slideR.mousePressed();
  slideG.mousePressed();
  slideB.mousePressed();
  slideA.mousePressed();
}

void mouseDragged() {
  // Pass all mouseDragged events to CSliders
  slideR.mouseDragged();
  slideG.mouseDragged();
  slideB.mouseDragged();
  slideA.mouseDragged();
}

void mouseReleased() {
  // Pass all mouseReleased events to CSliders
  slideR.mouseReleased();
  slideG.mouseReleased();
  slideB.mouseReleased();
  slideA.mouseReleased();
}

// - - - - - - - - - - - 
// CSlider object implements a simple slider that allows user to select a value in range [0..255]
class CSlider {
  int x, y;
  int width;
  int height = 256;
  int val;
  String label;
  boolean captured = false;
 
  CSlider(int x, int y, int width, int val, String label) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.val = val;
    this.label = label;
  }
  
  void setVal(int v) {
    // Set slider value, clipping to [0..255]
    if (v < 0) v = 0;
    if (v > 255) v = 255;
    val = v;
  }
  
  void draw() {
    // Draw labels
    fill(255,255,255,127);
    noStroke();
    rect(x, y-35, width+1, 35);
    rect(x, y+height, width+1, 25);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(24);
    text(this.label, x, y-45, width, 45);
    textSize(16);
    text(str(val), x, y+height, width, 25);
    
    // Draw slider
    fill(255);
    stroke(127);
    strokeWeight(2);
    rect(x, y, width, height);
    fill(127,0,0);
    rect(x-3, y+height-val-3, width+5, 7);
  }
  
  void mousePressed() {
    // If mouse pressed in CSlider, set new value.
    if (!containsPoint(mouseX, mouseY)) return;
    captured = true;
    setVal( y+height-mouseY );
  }
  
  void mouseDragged() {
    // If dragging and this CSlider has captured mouse, 
    // set new value.
    if (!captured) return;
    setVal( y+height-mouseY );
  }
  
  void mouseReleased() {
    // Always release capture.
    captured = false;
  }
  
  boolean containsPoint(int x, int y) {
    // Return true if CSlider contains given point.
    if (x < this.x) return false;
    if (y < this.y) return false;
    if (x > this.x + this.width) return false;
    if (y > this.y + this.height) return false;
    return true;
  }
}
