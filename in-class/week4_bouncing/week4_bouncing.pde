
int ballX;
int ballY;

int speedX;
int speedY;

boolean moving;  // should the ball be moving?


void setup() {
  size(400, 400);
  
  ballX = round(random(10, width - 10));
  ballY = round(random(10, height - 10));
  speedX = 5;
  speedY = 5;
  moving = true;
}

void draw() {
  background(150);
  fill(255);
  ellipse(ballX, ballY, 20, 20);

  if (moving) {  
    ballX = ballX + speedX;
    ballY = ballY + speedY;
  }
  
  if ( ballX >= width  ||  ballX <= 0  ) {
    speedX = -speedX;
  } 
  if ( ballY >= height  ||  ballY <= 0 ) {
     speedY = -speedY;
  } 
 
}

void mousePressed() {
    speedX = -speedX;
    speedY = -speedY;
}

void mouseMoved() {
  int diffX = (mouseX - ballX);
  int diffY = (mouseY - ballY);
  
  speedX = constrain( speedX + (diffX / 100) , -5, 5 );
  speedY = constrain( speedY + (diffY / 100) , -5, 5 );
}

void keyPressed() {
  if (key == 's') {
    moving = ! moving; 
  } else if (key == CODED) {
    
    if (keyCode == UP) {
       speedY = -5;
       speedX = 0;  
    }
    
  }
}




