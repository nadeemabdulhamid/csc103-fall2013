/*
 * Raindrop Game, Nadeem Abdul Hamid, Fall 2013
 * ------------- MULTIPLE DROP VERSION ------------------
 *
 * Try to catch drops in the bowl. If too many fall, the
 * ground gets flooded!
 *
 * inspired by http://www.openprocessing.org/sketch/51282
 */

/* GLOBAL CONSTANTS */
final int GROUND_LEVEL = 300;
final float GRAVITY = .05;
final int MAX_DROPS = 10;  // maximum drops on the screen at a time
final int BOWL_SIZE = 75;
final color WATER_COLOR = color(150, 150, 200);
final int WIN_OR_LOSE_COUNT = 100;  
/* WIN_OR_LOSE_COUNT is the number of drops that you need to
 catch to win; and also the number of missed drops that 
 causes you to lose */

/* GLOBAL VARIABLES */
// the drop's location
float[] dropX;
float[] dropY;
float[] dropSpeed;

// the bowl's location and how full it is
float bowlX;
float bowlFill;  // a number between (0 and WIN_OR_LOSE_COUNT)

// how much water has hit the ground
float waterLevel; // a number between (0 and WIN_OR_LOSE_COUNT)

// is the game over?
boolean gameOver;


/* MAIN FUNCTIONS ********************************************/
void setup() {
  size(400, 400);
  dropX = new float[MAX_DROPS];
  dropY = new float[MAX_DROPS];
  dropSpeed = new float[MAX_DROPS];
  
  restartGame();
}

void draw() {
  background(255);
  drawGround();
  drawRaindrops();
  drawBowl(bowlX, map(bowlFill, 0, WIN_OR_LOSE_COUNT, 0, 100));

  checkGameOver(); // sets the gameOver variable to true if so
  if (gameOver) {
    drawGameOver(); // show game over screen
  } 
  else {
    moveDrops();   // make drop fall
    checkAnyCatches();
  }
}


/* EVENT HANDLING FUNCTIONS **********************************/

void mouseMoved() {
  bowlX = mouseX;    // sets bowl location to the mouseX coordinate
}

void keyPressed() {
  if (key == ' ' && gameOver) {
    restartGame();
  }
}


/* GAME INITIALIZATION FUNCTIONS *****************************/

// resets the state of the game
void restartGame() {
  for (int i = 0; i < MAX_DROPS; i++) {
    resetDrop(i);
  }
  bowlX = 0;
  bowlFill = 0.0;
  waterLevel = 0.0;
  gameOver = false;
}

// makes the drop appear at a random location at 
// the top of the window
void resetDrop(int i) {
  dropX[i] = random(0, width);
  dropY[i] = 0;
  dropSpeed[i] = random(.5, 2);
}


/* GAME HELPER FUNCTIONS *************************************/

// see if the game has ended 
// (enough drops in bowl or too many on ground)
void checkGameOver() {
  if (bowlFill >= WIN_OR_LOSE_COUNT
    || waterLevel >= WIN_OR_LOSE_COUNT) {
    gameOver = true;
  }
}


void checkAnyCatches() {
  for (int i = 0; i < MAX_DROPS; i++) {
    checkCatch(i); // see if it's in the bowl
  }
}

// if drop fallen in bowl, increment the amount of water 
// in the bowl and make the drop reappear at the top
void checkCatch(int i) {
  float x = dropX[i];
  float y = dropY[i];
  if (inBowl(x, y, bowlX)) {
    bowlFill = bowlFill + 1;
    resetDrop(i);
  }
}

// see if a drop at given (x, y) location has fallen in the bowl
boolean inBowl(float x, float y, float bx) {
  return y >=  GROUND_LEVEL - BOWL_SIZE/2
    && dist(x, y, bx, GROUND_LEVEL - BOWL_SIZE/2) < BOWL_SIZE;
}

void moveDrops() {
  for (int i = 0; i < MAX_DROPS; i++) {
    moveDrop(i);
  } 
}

// update drop speed and location
void moveDrop(int i) {
  dropSpeed[i] = dropSpeed[i] + GRAVITY;
  dropY[i] = dropY[i] + dropSpeed[i];
  if (dropY[i] > GROUND_LEVEL) {
    waterLevel++;   // a drop hit the ground
    resetDrop(i);
  }
}


/* DRAWING FUNCTIONS *****************************************/

void drawGround() {
  fill(50, 200, map(waterLevel, 0, WIN_OR_LOSE_COUNT, 50, 255));
  rect(0, GROUND_LEVEL, width, GROUND_LEVEL);
}

void drawRaindrops() {
  for (int i = 0; i < MAX_DROPS; i++) {
    drawRaindrop(dropX[i], dropY[i], 8);
  }
}

void drawRaindrop(float x, float y, int size) {
  noStroke();
  for (int i = 0; i < size; i++) {
    fill(150, 150, 175+i*10);
    ellipse(x, y + i*4, i*2, i*2);
  }
}

void drawBowl(float x, float fillpct) {
  stroke(0);
  fill(255);
  arc(bowlX, GROUND_LEVEL - BOWL_SIZE/2, BOWL_SIZE, BOWL_SIZE, 0, PI, CHORD);
  noStroke();
  fill(WATER_COLOR);
  arc(bowlX, GROUND_LEVEL - BOWL_SIZE/2 + map(fillpct, 0, 100, BOWL_SIZE/2, 0), 
  map(fillpct, 0, 100, 0, BOWL_SIZE), map(fillpct, 0, 100, 0, BOWL_SIZE), 
  0, PI);
}

void drawGameOver() {
  fill(WATER_COLOR);
  textSize(48);
  text("GAME OVER!", 50, 200);
  if (bowlFill >= WIN_OR_LOSE_COUNT) {
    fill(0, 255, 0);
    text("YOU WIN!", 50, 275);
  } 
  else {
    fill(255, 0, 0);
    text("YOU LOSE!", 50, 275);
  }
}

