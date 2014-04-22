// SingleCell
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// singlecell.pde
// file version: a0009
// Main single cell application


static final int WINDOW_WIDTH = 1280;
static final int WINDOW_HEIGHT = 720;
static final int FRAMERATE = 60;

boolean showLines;

NoiseCache noiseCache;
TextHandler textHandler;
Sim sim;


void setup() {
  size (WINDOW_WIDTH, WINDOW_HEIGHT);
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
