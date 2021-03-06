// SingleCell
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// Cell.pde
// file version: a0013
// class definition for a cell.

static final boolean RANDOM_POSITION=true; 
static final float INITIAL_MASS=48.0;

class Cell extends Agent
{
  
  Cell() {
    super();
    
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
    
    mass = INITIAL_MASS*(0.5+(random(0.5)));  
    flocking = true;  
  }
  
  

  public void update(ArrayList<Agent> otherAgents)
  {
    
    super.update(otherAgents);
  }

  
  
  public void display()
  {
        
    // render cell
    // in this version we'll draw a simple ellipse to represent our cell
    // alpha 0004: add a little pulse with Perlin noise.
    // alpha 0005: show the velocity   
    float size = mass; 
    
    // outer halo
    //float sizePulse=map(noiseCache.getNoise(framesAlive),0,1,size,size+(size*0.5));
    fill(192,16);
    
    noStroke();
    //ellipse(position.x, position.y, sizePulse, sizePulse);
    
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
    PVector nucleus = new PVector(acceleration.x,acceleration.y);
    nucleus.mult(100.0);
    nucleus.limit(5.0);
    nucleus.add(position);
    ellipse(nucleus.x, nucleus.y, evenSmaller, evenSmaller);

    // render physics lines
    if (showLines) {
      // velocity line
      stroke (255,0,0);
      PVector velocityLine=new PVector(velocity.x,velocity.y);
      velocityLine.mult(10);
      line(position.x,position.y,
        position.x+velocityLine.x, position.y+velocityLine.y);
         
      // acceleration line
      stroke (0,255,0);
      PVector accelerationLine=new PVector(acceleration.x,acceleration.y);
      accelerationLine.mult(100);
      line(position.x,position.y,
        position.x+accelerationLine.x, position.y+accelerationLine.y);
    }
  }
  
}
