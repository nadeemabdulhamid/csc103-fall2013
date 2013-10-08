//arrays to hold the last 15 xy mouse positions
// modified from Dan Shiffman's trail example
/**
 Move the mouse around and your tail will follow.  2 arrays are holding the previous 15 mouseX and mouseY coordinates.
 */
int[] previousX = new int[15];
int[] previousY = new int[15];

void setup() {
  size(400, 400);
  smooth();
  strokeWeight(4); 
  stroke(255);
  //initialize the x and y arrays
  for (int i = 0; i < previousX.length; i++) {
    previousX[i] = 0;
    previousY[i] = 0;
  }
}

void draw() {
  background(0);
  //shift all the previous xy positions down one slot.
  shiftArray();
  //add current mouse location
  previousX[previousX.length-1] = mouseX;
  previousY[previousY.length-1] = mouseY;
  //draw the lines that make up the trail.
  for (int i = 0; i < previousX.length-1; i++) {
    line(previousX[i], previousY[i], previousX[i+1], previousY[i+1]);
  }
  //make a poofball on the end of our trail.
  fill(255, 0, 0);
  ellipse(previousX[0], previousY[0], 15, 15);
}


// this method will shift all of the elements in our arrays down one slot
void shiftArray() {
  for (int i = 0; i < previousX.length-1; i++) {
    previousX[i] = previousX[i+1];
    previousY[i] = previousY[i+1];
  }
}

