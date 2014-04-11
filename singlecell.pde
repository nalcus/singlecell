// SingleCell
// alpha build 0003
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

static final int WINDOW_WIDTH = 640;
static final int WINDOW_HEIGHT = 480;
static final int FRAMERATE = 60;

boolean showLines;

TextHandler textHandler;
Cell cell;

void setup() {
  size (WINDOW_WIDTH, WINDOW_HEIGHT);
  frameRate (FRAMERATE);
  smooth();
  
  textHandler=new TextHandler();
  cell = new Cell();
  
  // default to not showing lines
  showLines=false;
}

void draw() {
  background (128); 
  cell.setGoal(mouseX, mouseY);
  cell.update();
  cell.display();
  textHandler.setTextToTitle();
  textHandler.shadowText("SingleCell",10,24); 
  textHandler.setTextToSubtitle();
  textHandler.shadowText("Copyright 2014 Nicholas Alcus",10,48);
  textHandler.setTextToDefault();
  textAlign(RIGHT);
  textHandler.shadowText( "The cell will accelerate toward the mouse cursor.",
    WINDOW_WIDTH-10, WINDOW_HEIGHT-50);
  textHandler.shadowText( "Its current goal is: [" + mouseX + ", " + mouseY+"]",
    WINDOW_WIDTH-10, WINDOW_HEIGHT-30);
      textHandler.shadowText( "Press the 'L' key to toggle physics lines display.",
    WINDOW_WIDTH-10, WINDOW_HEIGHT-10);
}

void keyPressed() {

  if (key == 'l' || key == 'L') {
    // toggle display of physics lines
    showLines=!showLines;
  }
}
