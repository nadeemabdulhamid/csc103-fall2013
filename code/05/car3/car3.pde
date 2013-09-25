
// drawing many cars with a function

// note: try putting a car on top of the two that are in draw()

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  drawCar(0, 0, 100, color(120, 120, 35));
  drawCar(100, 100, 50, color(0, 0, 200));
}

void mousePressed() {
  drawCar(mouseX, mouseY, random(50, 150), color(random(256))); 
}

void drawCar(int carLeft, int carTop, float carWidth, color bodyColor) {
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
}

