// SingleCell
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// singlecell.pde
// file version: a0013
// Main single cell application


static final int WINDOW_WIDTH = 600;
static final int WINDOW_HEIGHT = 600;
static final int FRAMERATE = 60;

boolean showLines;

NoiseCache noiseCache;
TextHandler textHandler;
Sim sim;


void setup() {
  size (WINDOW_WIDTH, WINDOW_HEIGHT, P3D);
  frameRate (FRAMERATE);
  smooth();
  
  noiseCache = new NoiseCache();
  textHandler=new TextHandler();
  sim = new Sim();
  
  // default to not showing lines
  showLines=false;
  
}

void draw() {

  sim.update();
  sim.display();
}

void keyPressed() {

  if (key == 'l' || key == 'L') {
    // toggle display of physics lines
    showLines=!showLines;
  }
}

// calculation the square root is costly. for most purposes we don't even need it!
float distance_squared (float x1, float y1, float x2,float y2) {
  return ((x2-x1)*(x2-x1))+((y2-y1)*(y2-y1));
}
