// Justin Bakse, PUDT 1203, Spring 2013

// draw_loop_input.pde
// Animates a flashing circle at the position of the mouse.
// demonstrates using the setup() and draw() functions and introduces interactivity

void setup() {
  size(400, 400);
  background(100);
}

void draw() {
  //background(100);
  fill(random(0,255), random(0,255), random(0,255));
  ellipse(mouseX, mouseY, 50, 50);
}

