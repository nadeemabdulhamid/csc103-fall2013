Lecture Notes
=============

These notes are primarily for my use, but are made available here in case they are of help to you.

## Week 1

* Introduction to this class: what is computing? why are we here? 
  * [Code video](http://www.youtube.com/watch?v=dU1xS07N-FA)
* Programming vs CS; Art + Code [GXK p2-3]
* Processing: what? why? 
  * [Processing video](http://thecreatorsproject.vice.com/creators/casey-reas)
* What is a programming language? What kinds are there? Bits bytes and beyond [GXK 4-8]
  * [01/bits](code/01/bits)
* Go over syllabus; attendance sign-in sheets
* Talk about books
* Office hours, TAs
* Visit http://processing.org
* First programs (GS 2-1, 2-2)
* Tour Processing IDE
  * Modes; demo JS + Android (take device + cable to class)
  * Examples; also for [GS] and [PH]
* [ITP notes](http://itp.nyu.edu/~sve204/icm_fall06/week1.html)
* Algorithms; pseudocode; Generative art [GXK 33-38]
  * [Algorithm](http://en.wikipedia.org/wiki/Algorithm):  "a process or set of rules to be followed in calculations or other problem-solving operations"
  * [Digital Art](http://en.wikipedia.org/wiki/Digital_art), [Generative Art](http://en.wikipedia.org/wiki/Generative_art), [Interactive Art](http://en.wikipedia.org/wiki/Interactive_art) @ (Wikipedia)
  * [Algorithmic Art](http://www.verostko.com/algorithm.html) by Roman Verostko
  * [compArt](http://dada.compart-bremen.de)
* Processing concepts:
  * Pixels: [01/mag](code/01/mag)
  * Coordinate systems: [01/coords](code/01/coords)
  * Colors: [01/rgba](code/01/rgba)
  * Ten Thousand Rectangles: [01/ttr](https://github.com/nadeemabdulhamid/csc103-fall2013/raw/master/code/01/ten_thousand_rectangles/ten_thousand_rectangles.pde)

## Week 2

* Code elements
  * [Comments](http://en.wikipedia.org/wiki/Comment_(computer_programming\))
  * [Expressions](http://en.wikipedia.org/wiki/Expression_(computer_science\)) and [statements](http://en.wikipedia.org/wiki/Statement_(programming\))
  * Function calls
* Processing drawing and color functions
  * Basic shapes
  * [Processing reference](http://processing.org/reference)
  * Drawing order (GS 3-9)
  * Shape properties
    * [smooth](http://processing.org/reference/smooth_.html)/noSmooth
    * noStroke/[strokeWeight](http://processing.org/reference/strokeWeight_.html)/[strokeJoin](http://processing.org/reference/strokeJoin_.html)/[strokeCap](http://processing.org/reference/strokeCap_.html): PH 2-37, 2-38, 2-39 or GS: 3-11, 3-12, 3-13
  * Drawing modes: PH 2-40, 2-41
* In-class exercise

---

* Additional shapes
  * arc, curve, bezier, shape+vertex
  * Code [02.zip](https://www.dropbox.com/s/veyymam666qahpp/02.zip):
    * Examples: AlphaChannels, CartoonCharacter1, LadyBug1, Monster1, Ndebele, Penguin1, Sushi
    * Useful Tools: Arc Editor, Curve Editor, Bezier Editor
* Introduction to variables
* In-class work

## Week 3

* Static sketch presentations
* Variables: Declare, Initialize, Use 
  * GS: robot1 vs. robot2
  * Primitive Data Types
  * Built-in variables: mouseX mouseY width height
  * `draw_loop_input` sketch
  * scope: local vs. global
* Random: `interactive_random` sketch
  * `bird` example
* Static vs. dynamic sketches (`expanding` sketch)
  * the flow: setup() and draw()
  * The setup function is run once, at the beginning of the execution of any processing applet. It is typically used to set things like background, size and other items that don't change.

```java
void setup()
{
    // YOUR CODE IS RUN ONCE
}
```

  * The draw function is executed in a loop. It is run continuously throughout the execution of the processing program.

```java
void draw()
{
    // YOUR CODE IS RUN OVER AND OVER AGAIN
}
```

* GenArt listing 2.1 (expanding)


* [Random numbers](http://processing.org/reference/random_.html)
* Basic debugging: println
* Conditionals

* [ITP notes](http://itp.nyu.edu/varwiki/Syllabus/NotesWeek2) and [Dan O'Sullivan ITP notes](http://itp.nyu.edu/varwiki/Syllabus/ICM-Dan-OSullivan-F07-Basics)
  * [Bakse notes](http://pudt1203.justinbakse.com/wordpress/week-2/); [control flow](http://pudt1203.justinbakse.com/wordpress/week-3/); [interactivity](http://pudt1203.justinbakse.com/wordpress/week-4/)
  * [Solomon notes](http://a.parsons.edu/~solomonr/creative-computing/2011-spring/week02.html)

---

### Variables

[source](http://pudt1203.justinbakse.com/wordpress/week-2/)

In a computer program variables are named pieces of data. Using variables allows you to 
create code that is more general and reusable. For example: A piece of code that 
can add 2 and 3 together is specific; a piece of code that can add any two numbers you 
provide it is general, and much more useful.

There are many benefits to variables:

* Variables allow you to create general, reusable code.
* Variables let you store a value so you can use it later.
* Variables are used as parameters in functions.
* Giving values a name makes it easier to understand code.
* All variables have a name, a value and a type.

The name of a variable doesn’t really matter to the computer, but choosing 
good names is a very important part of creating readable code.

The value of a variable can be changed while the program runs. 
The value stays the same until your code changes it.

The type of the variable determine what kind of value the variable holds. 
`int` variables hold integer number values. `float` variables hold number 
values with a decimal part. There are types to hold colors, words, 
and even more complex concepts like images or videos.

To create a variable you declare it. This code declares a variable named `age`, of type `int`:

    int age;
    
This code also initializes the variable with a starting value:

    int age = 3;
    
Once a variable is assigned you can assign it a new value:

    age = 5;
    
You can assign a variable with the result of a calculation:

    age = 5 + 1;
    
When you use the variables name in code, its value will be used. The following expression would add the current value of age to 2:

    2 + age
    
This code will make the value go up by 1:

    age = age + 1;

(From _Generative Art_, Pearson)
![Processing Data Types](https://raw.github.com/nadeemabdulhamid/csc103-fall2013/master/slides/datatypes.png)
![Processing Data Types](https://raw.github.com/nadeemabdulhamid/csc103-fall2013/master/slides/operators.png)

### Scope

All variables have a *scope*. The variable’s scope determines how much of 
the code knows about the variable. With a few exceptions the scope of a 
variable is limited to the pair of braces it is declared within. Variables 
will not be visible to the program outside these braces.

http://processing.org/learning/basics/variablescope.html

### Style: Variable Names

* Most importantly, variable names should accurately describe the data they hold.
* Longer, more descriptive names should be used for variables used widely in the program.
* Shorter names make sense when the variable is only used in a single area.
* Seperate words an a variable useing camel case: buildingHeights, hitPoints, maxFuel.
* Avoid abbrevations.
* Be consistant

### Conditional Statements: “if”

Conditional statements allow you to specify that a block of code 
will only be executed when a condition or test is met.

This is the general syntax for a conditional statement:

    if (condition/test) {
        // do this if the test succeeds
    } else {
        // or do this instead
    }
This example draws a rectangle about 20% of the time.

    if (random(100) < 20){
        rect(10,10,10,10);
    }
The condition or test is an expression. Processing will 
evaluate the expression. If the result is True 
the code in the following block is executed. If 
the result is False the code is not run.

Relational operators like ==, !=, <, >, <=, and >= are 
used to compare values.

http://processing.org/reference/if.html

## Week 4

* Conditionals
  * if, else if, else
* bouncing ball
  * add mouse? distance; easing
* boolean variables (mousePressed)
* relational operators, logical operators
* quad_conditional: https://cs.berry.edu/moodle/mod/resource/view.php?id=2508
* mousePressed, keyPressed
* hold down button: http://www.learningprocessing.com/examples/chapter-5/example-5-4/
* button switch: http://www.learningprocessing.com/examples/chapter-5/example-5-5/
* square following edge: http://www.learningprocessing.com/examples/chapter-5/example-5-8/
* keys: Processing handbook: Input 2 (Keyboard) - p223 (unit 25 examples) 
  * ASCII codes
* `constrain()`, `map()`, `dist()`


## Week 5

### CREATING OUR OWN FUNCTIONS
(Adapted from [Shawn van Every](http://itp.nyu.edu/~sve204/icm_fall06/week3.html), NYU)

You can create your own functions that you can call anywhere else in your code. There are many
advantages to writing functions rather than putting everything in the `setup()` or `draw()` functions.
* Reuse: Writing a function for a commonly used set of commands that you can call over and over again. 
For instance, you have a complex shape that you use throughout your code. Rather than cutting and pasting
those instructions everywhere you can write them once and call it over and over again.
* Encapsulation: Putting functionality in a function and thereby seperating it from the
rest of the code helps in understanding the program. It also makes making changes to that code much easier.

Functions (or _methods_ as we will later call them) comprise of the following parts:
* Return Type: This is the type of data (or variable) that the function returns. So far we have only seen the built-in functions which return nothing and therefore use the type: `void`. Any of the other data types are acceptable as well.
* Name: This is simply the name of the function or method. You will call or execute the function using this. An example is setup.
* Arguments: You can pass data into a function through the use of arguments (also called _parameters_). These are specified as variables of a certain type (your choosing) that the function can then make use of. These variables are local to the function.
* Body: These are the instructions or code that the function will execute when called.

Here is an example:

        // return type, function name, arguments, including types
        int ourCoolFunction(int someInt, int someOtherInt)
        {
            // Declare a variable
            int aThridInt;
            // Do something valuable
            aThirdInt = someInt * someOtherInt;
            aThirdInt++;
            // Return something (an integeter in our case as it must match the return type)
            return aThirdInt;
        }
        
We would run this function somewhere else in our code such as:

        int myResult = ourCoolFunction(10,2);
        print(myResult);
        
        int a = 10;
        int b = 3;
        int c = ourCoolFuntion(a,b);
        print(c);

## Week 6: Iteration (Looping)

* random_lines1.pde : what if we want to stop at 100 lines; and see all the lines drawn at once...

Iteration: repetition of a block of code
Options:
* `while` loop
* `for` loop

### `while` loop

    while ( boolean_expression ) { 
       statements;
       // ... continue ...;
       // ... break ...;
    }
    
• Statements are repeatedly executed while the boolean expression remains true;
• To break out of a while loop, use `break`;
• To stop execution of statements and start again from the top of the loop,  use `continue`;
• All iterations can be written as while-loops.

* counter1.pde
* random_lines2.pde

### `for` loop

    for ( initialization; continuation_test; increment ) { 
        statements;
        // ... continue;
        // ... break;
    }
    
• initialization, continuation test and increment commands are part of statement

* counter2.pde

* Processing Examples: 
 * Getting Started book: Ex_04_06 to Ex_04_13
 * Processing Handbook: Unit 06: Control 2 

* Monitoring/Force-quitting Java applets

### Saving screenshots

* Use [`saveFrame()`](http://processing.org/reference/saveFrame_.html), e.g.


    void mousePressed() {
        saveFrame("frame_####.png");
    }
    
.







