// Justin Bakse, PUDT 1203, Spring 2013
// Draws a Bird, demonstrates use of variables, random, 
// and math to make a parameterized drawing.

//choose a random size for the body
float bodySize = random(20, 60);

//calculate the vertical position of the body based on its size
float bodyPosY = 100 - bodySize/2;

//choose a random headsize, smaller than the body
float headSize = bodySize * random(.5, 1.0);

//calculate a head position with a 10 pixel overlap
float headPosY = bodyPosY - (bodySize * .5) - (headSize * .5) + 10;

//set up to draw
size(100, 100);
background(100, 100, 100);
noStroke();

//draw body
fill(200, 200, 255);
ellipse(50, bodyPosY, bodySize, bodySize);

//draw chest
fill(170, 170, 240);
ellipse(50, bodyPosY - 4, bodySize * .8, bodySize * .8);

//draw head
fill(200, 200, 255);
ellipse(50, headPosY, headSize, headSize);

//draw beak
fill(175, 125, 125);
triangle(50 - 5, headPosY, 50 + 5, headPosY, 50, headPosY + 10);

//draw eyes
fill(255, 255, 255);
ellipse(50 - 5, headPosY, 12, 12);
ellipse(50 + 5, headPosY, 12, 12);
fill(170, 170, 240);
ellipse(50 - 5, headPosY, 4, 4);
ellipse(50 + 5, headPosY, 4, 4);

