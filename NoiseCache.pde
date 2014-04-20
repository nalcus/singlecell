// SingleCell
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// NoiseCache.pde
// file version: a0007
// Cache some Perlin noise to save processor juice at runtime.

static final float DEFAULT_INTERVAL = 0.01;
static final float DEFAULT_OFFSET = 0.0;
static final int CACHE_SIZE = 2048;

class NoiseCache {
  float[] cache = new float[CACHE_SIZE];
  NoiseCache() {
    resetCache(DEFAULT_OFFSET, DEFAULT_INTERVAL);
  }
 
  void resetCache( float offset, float interval) {
    float n=offset;
    for (int count=0;count<CACHE_SIZE;count++) {
      cache[count]=noise(n);
      n+=interval;
    }
  }
  
  float getNoise(int n) {
    return cache[n%2048];
  }
} 
