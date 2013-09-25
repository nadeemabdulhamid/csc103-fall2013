
// moving car. 

// constants
final int CAR_SPEED = 2;

// variables
int cx, cy;  // coordinates of left, top corner of the Car
float cw;    // size (width) of the Car
color tc;    // color of the Car

boolean isPuffing;  // is the Car puffing a cloud of smoke
float puffSize; 

// set up initial variables
void setup() {
  size(400, 400);
  
  // initial attributes of the Car
  cw = generateSize();
  cx = int(- 1.2 * cw);   // start off the left end of the screen
  cy = height / 2;
  tc = generateColor();
  isPuffing = false;
  puffSize = 0.0;
}

// draw loop
void draw() {
  background(255);
  stroke(0);
  line(0, carBottom(cy, cw), width, carBottom(cy, cw));

  drawCar(cx, cy, cw, tc, onCar(mouseX, mouseY, cx, cy, cw));
  moveCar();
  
  if (isPuffing) {
    drawPuff(cx, cy, cw);
    updatePuff();
  }
}

// handle mouse press
void mousePressed() {
  if (onCar(mouseX, mouseY, cx, cy, cw)) {
    isPuffing = true;
    puffSize = cw/4;
  }
}

// draw a puff of smoke behind the car with the given position and size
void drawPuff(int carLeft, int carTop, float carWidth) {
  float carHeight = carWidth / 2;
  noStroke();
  fill(tc);
  ellipse(carLeft - carWidth/6, carTop + carHeight, puffSize, puffSize/2);
}

// update the state of the smoke puff
void updatePuff() {
  puffSize--;
  if (puffSize < 1) {
    isPuffing = false;
  } 
}

// move the Car a little bit forward; if it goes off the screen 
// start it over again from the left side
void moveCar() {
  cx = cx +  CAR_SPEED;
  if (cx > width) {
    cx = int(- 1.2 * cw);   // start off the left end of the screen
    tc = generateColor();
    isPuffing = false;
  }  
}

// determine if a given x, y position occurs somewhere in the area
// of the window where the Car with given coordinates and size is drawn
boolean onCar(int x, int y, int carLeft, int carTop, float carWidth) {
  float carHeight = carWidth / 2; 
  return (carLeft <= x && x <= carLeft + carWidth) 
      && (carTop <= y && y <= carTop + carHeight);  
}

// draw a picture the Car
void drawCar(int carLeft, int carTop, float carWidth, color bodyColor, boolean lightsOn) {
  float carHeight = carWidth / 2;
  float tireSize = carHeight*2/5;
  
  // top
  strokeWeight(2);
  stroke(100, 255);
  fill(255, 50);
  quad(carLeft, carTop, 
        carLeft + carWidth*2/3, carTop, 
        carLeft + carWidth*3/4, carTop + carHeight/2, 
        carLeft, carTop + carHeight/2);
  
  // body
  strokeWeight(1);
  stroke(0);
  fill(bodyColor);
  quad(carLeft, carTop + carHeight/2, 
        carLeft + carWidth*1.05, carTop + carHeight/2, 
        carLeft + carWidth, carTop + carHeight, 
        carLeft, carTop + carHeight);

  // tires
  stroke(255);
  fill(0);
  ellipse(carLeft + carWidth/4, carTop + carHeight, tireSize, tireSize);
  ellipse(carLeft + carWidth*3/4, carTop + carHeight, tireSize, tireSize);
  
  // headlight
  if (lightsOn) {
    noStroke();
    fill(255, 255, 0);
    ellipse(carLeft + carWidth, carTop + carHeight * 3/4, tireSize, tireSize / 3);
  }
}

// calculate the y-coordinate of the bottom of the car 
int carBottom(int carTop, float carWidth) {
  float carHeight = carWidth / 2;
  float tireSize = carHeight*2/5;
  return int(carTop + carHeight + tireSize / 2);
}

// generate a random size for the car
float generateSize() {
  return random(60, 150); 
}

// generate a random color
color generateColor() {
  return color(random(256), random(256), random(256));
}




