// Bouncy Bluetooth

float left = 200;
float top = 200;

void setup() {
  size(500, 500);
}

void draw() {
  // to move only in a fixed direction:
  //left = left + 1;
  //top = top + 1;
  
  // to move wherever the mouse is:
  //left = mouseX;
  //top = mouseY;
  
  // to wander around randomly: 
  left = left + random(-10, 10);
  top = top + random(-10, 10);           
  
  background(255);
  
  smooth();
  noFill();
  strokeWeight(5);
  //ellipse(200, 200, 10, 10);
  beginShape();
  vertex(left, top);
  vertex(left + 150, top + 125);
  vertex(left + 60, top + 200);
  vertex(left + 60, top - 100);
  vertex(left + 150, top - 25);
  vertex(left, top + 100);
  endShape();
}


/* POSSIBLE EXTENSIONS:
 - don't let it move off screen
 - parameterize speed
 - add easing towards mouse when mouse pressed
     (println mousePressed in draw())
 - talk about variable scope + lifetime - try to move
   declarations into setup(), into draw() -- talk about
   problems
*/
