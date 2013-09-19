/**
 * This Processing example demonstrates a technique called "easing".  
 * 
 * Move the mouse across the screen and the circle will follow.  
 * Between drawing each frame of the animation, the program
 * calculates the difference between the position of the 
 * circle and the cursor. If the distance is larger than
 * 1 pixel, the symbol moves part of the distance (0.05) from its
 * current position toward the cursor. 
 */
 
/* 
 * EXERCISES:
   - Use the constrain() function to make it so the circle stays
     within the inner rectangle. You might find it helpful to
     introduce a variable to store the value of the radius/diameter
     of the circle (diameter is 66 below). 
     
   - Change the program so that instead of drawing a circle, it
     draws a big letter (initially 'a'). Whenever a (non-special)
     key is pressed on the keyboard, the letter drawn should change 
     to that character.
*/

float x;
float y; 
float easing = 0.05;
int edge = 100;

void setup() {
  size(640, 360); 
  noStroke();
}

void draw() { 
  background(51);
 
  // draw the inner frame
  rectMode(CORNERS);
  fill(150);
  rect(edge, edge, width-edge, height-edge);


  // update x, y positions based on mouse location
  float targetX = mouseX;
  float dx = targetX - x;
  if (abs(dx) > 1) {
    x = x + dx * easing;
  }

  float targetY = mouseY;
  float dy = targetY - y;
  if (abs(dy) > 1) {
    y = y + dy * easing;
  }


  // draw the circle
  fill(255);
  ellipse(x, y, 66, 66);
  
  
  // display some textual information... 
  textSize(12);
  textAlign(LEFT, BOTTOM);
  float lineHeight = 1.5 * (textAscent() + textDescent());  // one-and-a-half spacing between lines

  text("x: " + x, 100, 50);
  text("mouseX: " + mouseX, 200, 50);
  text("y: " + y, 100, 50 + lineHeight);
  text("mouseY: " + mouseY, 200, 50 + lineHeight);


}

