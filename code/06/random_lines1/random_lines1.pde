
void setup() {
  size(500, 500);
  background(255); 
}

void draw() {
  stroke(random(0, 255), random(0, 255), random(0, 255));
  line(random(0, width), random(0, height),
         random(0, width), random(0, height) );
}

void mousePressed() {
  saveFrame("frame_####.png");
}
