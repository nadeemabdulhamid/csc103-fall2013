// Magnify
// Copyright (c) 2011 Mark F. Russo
// Bryn Mawr College, Department of Computer Science
// Permission is granted to copy and distribute provided this entire copyright notice
// is reproduced in all copies.

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseWheelEvent;
import java.awt.event.MouseWheelListener;

// Magnifying glass class
class CMagnify implements KeyListener, MouseWheelListener{
  
  private PApplet apl = null;
  private float zoom = 2.0;
  private int diameter = 150;
  
  // Constructor
  CMagnify(PApplet apl, int diam, float zoom) {
    this.apl = apl;
    this.diameter = diam;
    this.zoom = zoom;
    
    // Handle events
    addMouseWheelListener(this);  // mouse wheel
    addKeyListener(this);         // key pressed
  }
  
  // Magnify on mouse wheel
  void mouseWheelMoved(MouseWheelEvent evt) {
    float delta = evt.getWheelRotation();
    zoom -= delta;
    if (zoom < 1.0) zoom = 1.0;
  }

  // Increase zoom on up-arrow. Decrease zoom on down-arrow.
  // Increase diameter on right-arrow. Decrease diameter on left arrow.
  void keyPressed(KeyEvent evt) {
    int keyCode = evt.getKeyCode();
    if (keyCode == 38) {
      zoom += 1.0;
    }
    else if (keyCode == 40) {
      zoom -= 1.0;
      if (zoom < 1.0) zoom = 1.0;
    }
    else if (keyCode == 39) {
      diameter += 4;
    }
    else if (keyCode == 37) {
      diameter -= 4;
      if (diameter < 50) diameter = 50;
    }
  }

  void keyTyped(KeyEvent e) {
    // Ignore
  }

  void keyReleased(KeyEvent e) {
    // Ignore
  }

  // Draw the magnifying glass at the given location, size and magnification.
  public void draw(int x, int y)
  {
    int px, pz;
    int radius = diameter/2;
  
    // Load current image into pixel array
    PImage img = apl.get();
    img.loadPixels();
    int maxpz = img.pixels.length-1;
    
    // Create image for zoom
    PImage g = new PImage(diameter, diameter);
    g.loadPixels();
    
    // Build zoomed image
    for (int j=0; j<diameter; j++) {
      for (int i=0; i<diameter; i++) {
        try {
          px = j*diameter + i;
          float fx = (float)(i-radius);
          float fy = (float)(j-radius);
          float dst = dist(fx, fy, 0.0, 0.0);
          if (dst <= radius)      // Zoom if within radius
          {
            int zx = x + round(fx/zoom);
            int zy = y + round(fy/zoom);
            pz = zy*img.width + zx;
            if (pz >= 0 && pz <= maxpz) g.pixels[px] = img.pixels[pz];
          }
          else                    // Copy pixels if outside radius
          {
            int zx = x + i-radius;
            int zy = y + j-radius;
            pz = zy*img.width + zx;
            if (pz >= 0 && pz <= maxpz) g.pixels[px] = img.pixels[pz];
          }
        }
        catch(ArrayIndexOutOfBoundsException e) {
          // Ignore array out of bounds exceptions
        }
      }
    }
  
    // Update pixels and draw
    g.updatePixels();
    apl.image(g, x-radius, y-radius);
    
    // Add outline
    apl.noFill();
    apl.stroke(0);
    apl.ellipse(x, y, diameter, diameter);
  }
}
