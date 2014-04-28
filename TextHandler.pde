// SingleCell
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// TextHandler.pde
// file version: a0013
// class definition for text handler.
// all font licensing can be found in singlecell/font

static final int DEFAULT_SHADOW_DISTANCE = 2;

class TextHandler 
{
  PGraphics textOverlay;
  
  PFont titleFont;
  PFont subtitleFont;
  PFont defaultFont;
  
  TextHandler() {
    // create overlay for text
    textOverlay = createGraphics(WINDOW_WIDTH, WINDOW_HEIGHT);
    
    // load fonts
    titleFont=loadFont("Comfortaa-Bold-24.vlw"); 
    subtitleFont=loadFont("Comfortaa-Thin-18.vlw"); 
    defaultFont=loadFont("saxMono-14.vlw");
    setTextToDefault();    
  }
  
  void setTextToDefault() {
    textOverlay.beginDraw();
    textOverlay.textFont(defaultFont);
    textOverlay.textSize(14);
    textOverlay.textAlign(LEFT);
    textOverlay.fill(255);
    textOverlay.endDraw();
  }
  
  void setTextToTitle() {
    textOverlay.beginDraw();
    textOverlay.textFont(titleFont);
    textOverlay.textAlign(LEFT);
    textOverlay.textSize(24);
    textOverlay.fill(255);
    textOverlay.endDraw();
  }
  
  void setTextToSubtitle() {
    textOverlay.beginDraw();
    textOverlay.textFont(subtitleFont);
    textOverlay.textAlign(LEFT);
    textOverlay.textSize(18);
    textOverlay.fill(255);
    textOverlay.endDraw();
  }
   
  // display some text with a shadow
  void shadowText(String message, int x,int y, color c) {
    color shadowColor = color(0,128);
    colorText(message, x+DEFAULT_SHADOW_DISTANCE,
      y+DEFAULT_SHADOW_DISTANCE,shadowColor);
    colorText(message, x,y,c);
  }
  
  // display some text of a specific color
  void colorText(String message, int x, int y, color c) {
    textOverlay.beginDraw();
    textOverlay.fill(c);
    textOverlay.text(message, x, y);
    textOverlay.endDraw();
  }
  
  void alignRight() {
    textOverlay.beginDraw();
    textOverlay.textAlign(RIGHT);
    textOverlay.endDraw();
  }

  void clearTextOverlay() {
    textOverlay.clear();
  }

  void renderTextOverlay() {
    image(textOverlay,0,0);
  }    
}
