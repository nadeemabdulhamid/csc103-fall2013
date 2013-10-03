

void setup() {
  size(500, 500);
  background(255); 
  
  grid(20);
}

void draw() {
}



/*
 Draws a grid of lines (horizontal & vertical) in the window
 with the given spacing (in pixels) between lines. This function
 draws the lines in what every color the current stroke is.
 */
void grid(int spacing) {
  strokeWeight(1);
  for (int col = 0; col <= width; col += spacing) {
    line(col, 0, col, height); 
  }
  for (int row = 0; row <= height; row += spacing) {
    line(0, row, width, row); 
  }
}

