// SingleCell
// alpha build 0003
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// Cell.pde
// class definition for a cell.

static final boolean RANDOM_POSITION=true; 
static final float MAXIMUM_SPEED=2.0; 

class Cell
{
  PVector position; // where it is
  PVector velocity; // how fast its going
  PVector acceleration; // change in velocity
  PVector goal; // where it wants to go
  
  int size; // how big it is
  
  Cell() {
    if (RANDOM_POSITION) {
      position = new PVector(random(WINDOW_WIDTH),
        random(WINDOW_HEIGHT)); 
    }
    else {
      position = new PVector(WINDOW_WIDTH/2,
        WINDOW_HEIGHT/2); 
    }
      
    velocity = new PVector(0,0); 
    acceleration = new PVector(0,0);
    goal=new PVector(position.x,position.y);
    
    size = 48;
  }
  
  public void setGoal(int x_, int y_) {
    goal.x=x_;
    goal.y=y_;
  }
  
  public void update()
  {
    // move cell toward goal
    
    // in this version we're going to add fixed acceleration
    // in the direction of the mouse cursor
    acceleration.mult(0.0);
    acceleration.add(position);
    acceleration.sub(goal);
    acceleration.limit(0.1);
    acceleration.mult(-1.0);
    
    // add accleration to velocity
    velocity.add(acceleration);
    // limit velocity by max speed
    velocity.limit(MAXIMUM_SPEED);
    // translate position by velocity
    position.add(velocity);
  }
  
  public void display()
  {
    // render cell
    // in this version we'll draw a simple ellipse to represent our cell
    stroke(0);
    fill(192);
    ellipse(position.x, position.y, size, size);
    // render physics lines
    if (showLines) {
      // velocity line
      stroke (255,0,0);
      PVector velocityLine=new PVector(velocity.x,velocity.y);
      velocityLine.mult(10);
      line(position.x,position.y,
        position.x+velocityLine.x, position.y+velocityLine.y);
      textHandler.setTextToDefault();
      textHandler.colorText ("V",int(position.x+velocityLine.x),
        int(position.y+velocityLine.y), color(255,0,0));
      // acceleration line
      stroke (0,255,0);
      PVector accelerationLine=new PVector(acceleration.x,acceleration.y);
      accelerationLine.mult(100);
      line(position.x,position.y,
        position.x+accelerationLine.x, position.y+accelerationLine.y);
      textHandler.setTextToDefault();
      textHandler.colorText ("A",int(position.x+accelerationLine.x),
        int(position.y+accelerationLine.y), color(0,255,0));

    }
  }
  
}
