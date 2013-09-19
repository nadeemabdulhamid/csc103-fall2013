// introduces IF and IF/ELSE statements

int size = 0;
int speed = 5;

void setup() {
  size(500, 500); 
}

void draw() {
  background(0);
  ellipse(width/2, width/2, size, size);
  
  if ( size < 0 ) {  // if size is too small
    speed = 5;    //  then start growing bigger
  } else if ( size > width ) { // if size is too big
    speed = -5;   // then start growing smaller
  }

  size = size + speed; 
  
  /* THIS ORDER OF if STATEMENTS IS BUGGY:
  if ( size < width ) {   
    size = size + speed;
  } else if (size <= 0) {
    speed = 5;
    size = size + speed;
  } else {  // size > width
    speed = -5;
    size = size + speed;
  }*/
}





/*

FORM 1:
   if (  <TEST_CONDITION>  ) {
     <DO_SOMETHING> 
   }


FORM 2:
   if (  <TEST_CONDITION>  ) {
     <DO_SOMETHING> 
   } else {
     <DO_SOMETHING> 
   }


FORM 3:
   if (  <TEST_CONDITION>  ) {
     <DO_SOMETHING> 
   } else if (  <TEST_CONDITION>  ) {
     <DO_SOMETHING> 
   } else {     
     <DO_SOMETHING> 
   }


*/




