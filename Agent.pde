// SingleCell
// alpha build 0006
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// Agent.pde
// class definition for an agent. Everything on our main stage will be an agent.

static final float AGENT_MAXIMUM_VELOCITY=2.0; 

class Agent
{
  PVector position; // where it is
  PVector velocity; // how fast its going
  PVector acceleration; // change in velocity
  PVector goal; // where it wants to go
  float mass; // mass of agent
  
  Agent() {
    position = new PVector(0,0);
    velocity = new PVector(0,0); 
    acceleration = new PVector(0,0);
    goal=new PVector(position.x,position.y);
    mass=0.00001; // [nothing has zero mass]
  ;} 
      
  public void setGoal(int x_, int y_) {
    goal.x=x_;
    goal.y=y_;
  }
  
  public void update() {
    // move agent toward goal
    
    // fixed acceleration
    acceleration.mult(0.0);
    acceleration.add(position);
    acceleration.sub(goal);
    acceleration.limit(0.1);
    acceleration.mult(-1.0);
    
    // add accleration to velocity
    velocity.add(acceleration);
    
    // limit velocity by max speed
    velocity.limit(AGENT_MAXIMUM_VELOCITY);
    
    // translate position by velocity
    position.add(velocity);
  ;}
  
  public void display() {;}
  
}
