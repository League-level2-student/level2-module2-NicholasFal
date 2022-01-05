//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x;
int y;

// Add a constructor with parameters to initialize each variable.
Segment(int x, int y) {
  this.x = x;
  this.y = y;
}


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
int segment;
int foodX;
int foodY;
Segment head;
int snakeDirection = UP;
int foodEaten = 0;
ArrayList<Segment> tail = new ArrayList<Segment>();
boolean crash = false;

//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
head = new Segment(250, 250);
frameRate(20);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0, 0, 0);
  drawFood();
  move();
  drawSnake();
  eat();
}

void drawFood() {
  //Draw the food
  fill(255, 0, 0);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(70, 200, 0);
  rect(head.x, head.y, 10, 10);
  manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
  for(Segment s: tail) {
     fill(70, 200, 0);
    rect(s.x, s.y, 10, 10);
  }
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  Segment newSeg = new Segment(head.x, head.y); 
  tail.add(newSeg);
  tail.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  crash = false;
  for(Segment seg: tail) {
    if(head.x == seg.x && head.y == seg.y) {
      crash = true;
    }
  }
  if(crash) {
    foodEaten = 1;
    tail.clear();
    Segment newSeg = new Segment(head.x, head.y); 
    tail.add(newSeg);
  }
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode == UP && snakeDirection != DOWN) {
    snakeDirection = UP;
  } else if(keyCode == RIGHT && snakeDirection != LEFT) {
    snakeDirection = RIGHT;
  } else if(keyCode == DOWN && snakeDirection != UP) {
    snakeDirection = DOWN;
  } else if(keyCode == LEFT && snakeDirection != RIGHT) {
    snakeDirection = LEFT;
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(snakeDirection) {
  case UP:
  head.y-=10;
    // move head up here 
    break;
  case DOWN:
    // move head down here
    head.y+=10;
    break;
  case LEFT:
   // figure it out 
   head.x-=10;
    break;
  case RIGHT:
    // mystery code goes here 
    head.x+=10;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.x > 500) {
  head.x = 0; 
 } else if(head.x < 0) {
  head.x = 500; 
 }
 if(head.y > 500) {
   head.y = 0;
 } else if(head.y < 0) {
   head.y = 500; 
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if(foodX == head.x && foodY == head.y) {
   foodEaten++;
   dropFood();
   Segment newSeg = new Segment(head.x, head.y); 
   tail.add(newSeg);
  }
}
