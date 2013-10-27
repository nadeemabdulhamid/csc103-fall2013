/*
 * Circle Game, Nadeem Abdul Hamid, Fall 2013
 */

// OBJECT-ORIENTED PROGRAMMING

Circle[] cs;
int score;




void setup() {
  size(400, 400);
  background(200); 
  score = 0;

  cs = new Circle[15];
  
  for (int i = 0; i < cs.length; i++) {
    cs[i] = new Circle();
  }
}

void draw() {
  background(255);
  fill(0);
  text("Score: " + score, 50, 50);

  for (int i = 0; i < cs.length; i++) {
    cs[i].drawMe();
    cs[i].shrink();
  }
}

void mousePressed() {
  for (int i = 0; i < cs.length; i++) {
    if ( cs[i].containsPoint(mouseX, mouseY) ) {
      score = score + cs[i].scoreValue();  
      cs[i].reset();
    }
  }
}


