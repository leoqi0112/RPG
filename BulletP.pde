class BulletP extends GameObject {
  int t;
  
  BulletP(float x, float y, int s) {
    hp = 1;
    size = int (random(s/2, s));
    t = int(random(200,255));
    location = new PVector(x,y);
    velocity = new PVector(0,1);
    int i = 0;
     while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
      velocity.y = -1*myObj.velocity.y;
      velocity.x = -1*myObj.velocity.x;
      }
      i++;
      }
    velocity.rotate(random(-1.57, 1.57));
    velocity.setMag(2);
    roomX=myHero.roomX;
    roomY=myHero.roomY;
  }
  
  void show() {
    noStroke();
    fill(white,t);
    circle(location.x, location.y, size);
  }
  
  void act() {
    location.add(velocity);
    t = t-2;
    if (t <= 0) hp = 0;
  }
}
