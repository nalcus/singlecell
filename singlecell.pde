// SingleCell
// alpha build 0002
// Copyright (c) 2014 Nicholas Alcus
// see README.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

static final int WINDOW_WIDTH = 640;
static final int WINDOW_HEIGHT = 480;
static final int FRAMERATE = 60;

TextHandler textHandler;
Cell cell;

void setup() {
  size (WINDOW_WIDTH, WINDOW_HEIGHT);
  frameRate (FRAMERATE);
  smooth();
  
  textHandler=new TextHandler();
  cell = new Cell();
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
    WINDOW_WIDTH-10, WINDOW_HEIGHT-30);
  textHandler.shadowText( "Its current goal is: [" + mouseX + ", " + mouseY+"]",
    WINDOW_WIDTH-10, WINDOW_HEIGHT-10);
}

