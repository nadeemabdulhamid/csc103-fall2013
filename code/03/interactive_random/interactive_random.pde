// Justin Bakse, PUDT 1203, Spring 2013

// interactive_random.pde
// example code demonstrating mouseX and mouseY with random()

void setup() {
  size(400, 400);
  background(100);
}

void draw() {
  background(50,50,50);

  //draw circle
  fill(50, 255, 50);
  ellipse(mouseX + random(-30, 30), 
          mouseY + random(-30, 30), 
          40, 40);
}
