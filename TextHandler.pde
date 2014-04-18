// SingleCell
// alpha build 0006
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// TextHandler.pde
// class definition for text handler.
// all font licensing can be found in singlecell/font

static final int DEFAULT_SHADOW_DISTANCE = 2;

class TextHandler 
{
  PFont titleFont;
  PFont subtitleFont;
  PFont defaultFont;
  
  TextHandler() {
    titleFont=loadFont("Comfortaa-Bold-24.vlw"); 
    subtitleFont=loadFont("Comfortaa-Thin-18.vlw"); 
    defaultFont=loadFont("saxMono-14.vlw");
    setTextToDefault();    
  }
  
  void setTextToDefault() {
    textFont(defaultFont);
    textAlign(LEFT);
    fill(255);
  }
  
  void setTextToTitle() {
    textFont(titleFont);
    textAlign(LEFT);
    fill(255);
  }
  
  void setTextToSubtitle() {
    textFont(subtitleFont);
    textAlign(LEFT);
    fill(255);
  }
   
  // display some text with a shadow
  void shadowText(String message, int x,int y) {
    fill(0);
    text(message, x+DEFAULT_SHADOW_DISTANCE,
      y+DEFAULT_SHADOW_DISTANCE);
    fill(255);
    text(message,x,y);
  }
  
  // display some text of a specific color
  void colorText(String message, int x, int y, color c) {
    fill(c);
    text(message, x, y);
  }
      
}
