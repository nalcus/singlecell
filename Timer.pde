// SingleCell
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// Timer.pde
// file version: a0002
// class definition for timer.
// handles timing related tasks.
// internally uses java nanosecond timer

class Timer {
  int frames;
  float startTime;
  float lastTime;
  float currentTime;
  float frameTime;
  
  Timer () {
    resetFrames();
    resetTime();
  }
  
  void resetFrames() {
    frames=0;
  }
  
  void resetTime() {
    startTime=rightNowNano();
    lastTime=startTime;
    currentTime=lastTime;
    frameTime=0.0;
  }
  
  void updateTime() {
    lastTime=currentTime;
    currentTime=rightNowNano();
    frameTime=currentTime-lastTime;
  }
  
  
  void addFrame() {
    frames++;
  }
  
  void newFrame() {
    addFrame();
    updateTime();
  }
  
  int getFrames() {
    return frames;
  }
  
  float getFrameTimeNano() {
    return frameTime;
  }
  
  float getFrameTimeMillis() {
    return frameTime*.000001;
  }
  
  float rightNowNano() {
    return System.nanoTime();
  }
}

