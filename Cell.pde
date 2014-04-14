// SingleCell
// alpha build 0005
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// Cell.pde
// class definition for a cell.

static final boolean RANDOM_POSITION=true; 
static final float MAXIMUM_SPEED=2.0; 
static final float INITIAL_SIZE=64.0;

class Cell
{
  PVector position; // where it is
  PVector velocity; // how fast its going
  PVector acceleration; // change in velocity
  PVector goal; // where it wants to go
  
  float size; // how big it is
  
  Cell() {
    if (RANDOM_POSITION) {
      position = new PVector(random(WINDOW_WIDTH),
        random(WINDOW_HEIGHT)); 
    }
    else {
      position = new PVector(WINDOW_WIDTH*0.5,
        WINDOW_HEIGHT*0.5); 
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
    // alpha 0004: add a little pulse with Perlin noise.
    // alpha 0005: show the velocity   
    noStroke();
    
    // outer halo
    float sizePulse=map(noiseCache.getNoise(frames),0,1,size,size+(size*0.5));
    fill(192,16);
    ellipse(position.x, position.y, sizePulse, sizePulse);
    
    // shell
    fill(192,192);
    ellipse(position.x, position.y, size, size);
    
    
    // velocity indicating layer
    fill(255,128);
    float smaller=size*0.75;
    ellipse(position.x+velocity.x, position.y+velocity.y, 
    smaller, smaller);
    
    // acceleration indicating nucleus
    fill(255,64,0,64);
    float evenSmaller=size*0.3;
    PVector nukePosition= new PVector((50.0*acceleration.x)+position.x,
      (50.0*acceleration.y)+position.y);    
    ellipse(nukePosition.x, nukePosition.y, evenSmaller, evenSmaller);

    // render physics lines
    if (showLines) {
      
      // velocity line
      stroke (255,0,0);
      PVector velocityLine=new PVector(velocity.x,velocity.y);
      velocityLine.mult(10);
      line(position.x,position.y,
        position.x+velocityLine.x, position.y+velocityLine.y);
      textHandler.setTextToDefault();
      textHandler.colorText ("Vel",int(position.x+velocityLine.x),
        int(position.y+velocityLine.y), color(255,0,0));
         
      // acceleration line
      stroke (0,255,0);
      PVector accelerationLine=new PVector(acceleration.x,acceleration.y);
      accelerationLine.mult(100);
      line(position.x,position.y,
        position.x+accelerationLine.x, position.y+accelerationLine.y);
      textHandler.setTextToDefault();
      textHandler.colorText ("Acc",int(position.x+accelerationLine.x),
        int(position.y+accelerationLine.y), color(0,255,0));
    }
  }
  
}
