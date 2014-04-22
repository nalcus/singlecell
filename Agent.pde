// SingleCell
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// Agent.pde
// file version: a0010
// class definition for an agent. Everything on our main stage will be an agent.

static final float AGENT_MAXIMUM_VELOCITY=4.0; 
static final float IDEAL_SEPARATION=75.0;
static final float SEPARATION_SCALAR=75.0;
static final float ARRIVAL_RADIUS=50.0;

class Agent
{
  PVector position; // where it is
  PVector velocity; // how fast its going
  PVector acceleration; // change in velocity
  PVector accumulated_force; // forces
  PVector goal; // where it wants to go
  float mass; // mass of agent
  
  int framesAlive; // lifespan in frames
  
  boolean flocking; // is this agent counted in flocking behaviors?

  Agent() {
    position = new PVector(0, 0);
    velocity = new PVector(0, 0); 
    acceleration = new PVector(0, 0);
    accumulated_force = new PVector(0, 0);
    goal=new PVector(position.x, position.y);
    mass=0.00001; // [nothing has zero mass]
    framesAlive=0;
    flocking=false;
  } 

  public void setGoal(int x_, int y_) {
    goal.x=x_;
    goal.y=y_;
  }

  public void seek(PVector target)
  {
    // find difference between desired velocity and current velocity and apply it as a force
    PVector desired_velocity = new PVector(position.x, position.y);
    desired_velocity.sub(target);
    //desired_velocity.limit(AGENT_MAXIMUM_VELOCITY);
    PVector steering_force = new PVector(velocity.x, velocity.y);
    steering_force.sub(desired_velocity);
    steering_force.limit(AGENT_MAXIMUM_VELOCITY);
    applyForce(steering_force);
  }  

  public void seekArrival(PVector target)
  {
    // find difference between desired velocity and current velocity and apply it as a force
    PVector desired_velocity = new PVector(position.x, position.y);
    desired_velocity.sub(target);
    //desired_velocity.limit(AGENT_MAXIMUM_VELOCITY);
    PVector steering_force = new PVector(velocity.x, velocity.y);
    steering_force.sub(desired_velocity);
    steering_force.limit(AGENT_MAXIMUM_VELOCITY);
    //float distance=PVector.dist(target,position)
    applyForce(steering_force);
    
    

    
  }

  public void applyForce(PVector force) {
    accumulated_force.add(force);
  }

  public void applyResistance(float magnitude) {
    // apply a resistance (air, fluid, whatever) in the opposite direction of the current velocity.
    PVector resistance_force = new PVector(velocity.x, velocity.y);
    resistance_force.mult(-magnitude); 
    applyForce(resistance_force);
  }  

  public void update(ArrayList<Agent> otherAgents) {
    // iterate frame count
    framesAlive++;
        
    // move agent toward goal
    seek(goal);
    
    // separate from other agents
    if (flocking) {
      separate(otherAgents);
    }

    // apply some resistance since we are not in a vaccuum
    // this also helps us to not go into orbit around our goal
    applyResistance(AMBIENT_RESISTANCE);

    // acceleration equals accumulated force over mass
    acceleration.mult(0.0);
    acceleration.add(accumulated_force);
    acceleration.div(mass);

    // add accleration to velocity
    velocity.add(acceleration);

    // limit velocity by max speed
    velocity.limit(AGENT_MAXIMUM_VELOCITY);

    // translate position by velocity
    position.add(velocity);

    // reset forces for next frame
    accumulated_force.mult(0.0);
    
  }

  public void display() {
    ;
  }
  
  
  void separate(ArrayList<Agent> otherAgents)
  {
    int count=0;
    PVector steering_force = new PVector(0,0);
    for (Agent otherAgent : otherAgents) {
      // get the distance to each other agent
      if (otherAgent.flocking) {
        float distance = PVector.dist(position, otherAgent.position);
        if ((distance>0) && (distance < IDEAL_SEPARATION)) {
          count++;
          PVector difference = new PVector(position.x,position.y);
          difference.sub(otherAgent.position);
          difference.normalize();
          difference.div(distance);
          steering_force.add(difference);
        }
      }
    }
    steering_force.mult(SEPARATION_SCALAR);
    //steering_force.limit(AGENT_MAXIMUM_VELOCITY);
    //println(count+", "+steering_force);
    applyForce(steering_force);
    
  }
}

