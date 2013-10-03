
void setup() {
  size(500, 500);
  background(255); 

  int counter = 0;
  while (counter < 200) {
    
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(random(0, width), random(0, height),
           random(0, width), random(0, height) );
           
    counter++;   // shortcut for counter = counter + 1
  }

}

void draw() {
}


