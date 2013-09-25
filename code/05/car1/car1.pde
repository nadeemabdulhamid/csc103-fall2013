
// simple car with variables

size(200, 200);
background(100);

int carLeft = 0;
int carTop = 0;
float carWidth = 100;

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
fill(0, 0, 255);   // body color
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
noStroke();
fill(255, 255, 0);
ellipse(carLeft + carWidth, carTop + carHeight * 3/4, tireSize, tireSize / 3);

