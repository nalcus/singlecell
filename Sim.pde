// SingleCell
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// Sim.pde
// file version: a0011
// class definition for a simulation.

static final float AMBIENT_RESISTANCE = 0.5;
static final int DEFAULT_POPULATION = 1;

class Sim
{
  ArrayList<Agent> agents;
  Timer timer;

  Sim () {
    int totalPopulation=(int)((WINDOW_WIDTH*WINDOW_HEIGHT)/(INITIAL_MASS*INITIAL_MASS));
    agents = new ArrayList<Agent>();
    agents.add(new Emitter());
    for (int i=0;i<totalPopulation;i++) {
    agents.add(new Cell());
    }
    timer = new Timer();
  }

  void update () {
    //iterate frames. the first frame that is actually rendered is frame 1.
    timer.newFrame();

    for (Agent agent : agents) {     
      //agent.setGoal(mouseX, mouseY);
      agent.update(agents);
    }
  }

  void display() {

    //grey background
    background (128);


    // render agents
    for (Agent agent : agents) {
      agent.display();
    }

    // render title text
    textHandler.setTextToTitle();
    textHandler.shadowText("SingleCell", 10, 24); 
    textHandler.setTextToSubtitle();
    textHandler.shadowText("Copyright 2014 Nicholas Alcus", 10, 48);

    // render instructional text
    textHandler.setTextToDefault();
    textAlign(RIGHT);

    textHandler.shadowText( "Frame Time :"+ nf(timer.getFrameTimeMillis(), 1, 3)+" ms", 
    WINDOW_WIDTH-10, WINDOW_HEIGHT-30);

    textHandler.shadowText( "Current goal :[" + mouseX + ", " + mouseY+"]", 
    WINDOW_WIDTH-10, WINDOW_HEIGHT-10);
    ;
  }
}

