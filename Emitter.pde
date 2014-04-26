// SingleCell
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// Emitter.pde// file version: a0012
// class definition for an emitter agent. Cells are attracted to it.

static final float EMITTER_DISTANCE = 250.0;
static final float EMITTER_DISTANCE_SQUARED = EMITTER_DISTANCE*EMITTER_DISTANCE;

class Emitter extends Agent
{
  Emitter() {
    super();
    position = new PVector(random(WINDOW_WIDTH),
        random(WINDOW_HEIGHT)); 
    attractive=true;
  } 

  public void update(ArrayList<Agent> otherAgents) {
    position.x=mouseX;
    position.y=mouseY;
    for (Agent otherAgent : otherAgents)
    {
      float square_distance=distance_squared(position.x,position.y,otherAgent.position.x,otherAgent.position.y);
      if (square_distance < EMITTER_DISTANCE_SQUARED) {
        otherAgent.hasGoal=true;
        otherAgent.setGoal(position.x,position.y);
      }
    }
  }

  public void display() {
    ;
  }
  
}

