class Particles {
  PVector location;
  PVector velocity;
  int hp;
  int size;
  float speed;
  int t;
  
  Particles(float x, float y) {
    hp = 1;
    size = 10;
    t = int(random(200,255));
    location = new PVector(x,y);
    velocity = new PVector(0,1); 
    velocity.rotate(PI+random(-PI/2, PI/2));
    velocity.setMag(random(0,5));
  }
  
  void show() {
    
    noStroke();
    fill(azure,t);
    circle(location.x, location.y, size);
  }
  
  void act() {
    location.add(velocity);
    t = t-2;
    if (t <= 0) hp = 0;
  }
}
