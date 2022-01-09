class GIFS {
  //instance variables
  PImage[] pics;
  int numFrames;
  int currentFrame;
  float x, y, w, h;
  int rate;
  
  GIFS(int nf, String pre, String post, float x, float y, float w, float h) {
    
    numFrames = nf;
    pics = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
    
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
    GIFS(int nf, int r, String pre, String post) {
    numFrames = nf;
    currentFrame = 0;
    pics = new PImage[nf];
    int i = 0;
    while (i < nf) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    rate = r;
  }
  
  //behaviour functions
  void show() {
    imageMode(CENTER);
    if (currentFrame == numFrames) currentFrame = 0;
    image(pics[currentFrame], x, y, w, h);
    if (frameCount % 5 == 0)
    currentFrame++;
  }
  
  void show(float a, float b) {
    imageMode(CENTER);
    if (currentFrame == numFrames) currentFrame = 0;
    image(pics[currentFrame], a, b, w, h);
    if (frameCount % 4 == 0)
    currentFrame++;
  }
  
  void show(float x, float y, float w, float h) {
    imageMode(CENTER);
    if (currentFrame == numFrames) currentFrame = 0;
    image(pics[currentFrame], x, y, w, h);
    if (frameCount % rate == 0)
    currentFrame++;
  }
}
