
// simple car as a function

void setup() {
  size(200, 200);
  background(255);
}

void draw() {
  drawCar(0, 0, 100);
  drawCar(100, 100, 50);
}

void drawCar(int carLeft, int carTop, float carWidth) {
  float carHeight = carWidth / 2;
  float tireSize = carHeight*2/5;
  
  // top
  stroke(100);
  fill(255, 50);
  quad(carLeft, carTop, 
        carLeft + carWidth*2/3, carTop, 
        carLeft + carWidth*3/4, carTop + carHeight/2, 
        carLeft, carTop + carHeight/2);
  
  // body
  stroke(0);
  fill(120, 120, 35);
  quad(carLeft, carTop + carHeight/2, 
        carLeft + carWidth*1.05, carTop + carHeight/2, 
        carLeft + carWidth, carTop + carHeight, 
        carLeft, carTop + carHeight);

  // tires
  stroke(255);
  fill(0);
  ellipse(carLeft + carWidth/4, carTop + carHeight, tireSize, tireSize);
  ellipse(carLeft + carWidth*3/4, carTop + carHeight, tireSize, tireSize);

  noStroke();
  fill(255, 255, 0);
  ellipse(carLeft + carWidth, carTop + carHeight * 3/4, tireSize, tireSize / 3);

}

