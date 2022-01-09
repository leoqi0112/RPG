class DroppedItem extends GameObject {
  
  color c;
  int Health;
  int type;
  PImage img;  
  
  DroppedItem(float x, float y, int rx, int ry) {
    
    int i = (int) random(0,3);
    if (i == 0) {
      type = HEALTHPOD;
    } else if (i == 1) {
      type = BULLET;
    } else if (i == 2) {
      type = INK;
    }
    
    if (type == HEALTHPOD) {
    Health = HEALTH;
    img = health;
    }
    
    if (type == BULLET) {
    img = bubble;
    }
    
    if (type == INK) {
    img = ink;
    }
    
    hp = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    roomX = rx;
    roomY = ry;
    
  }
  
  DroppedItem(float x, float y) {
    type = 4;
    img = KEY;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    hp = 1;
    roomX = 8;
    roomY = 10;
  }
  
  void show() {
      image(img, location.x, location.y, 40, 40);
  }
  
  void act() {
    //do nothing
  }
}
