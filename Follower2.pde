class Follower2 extends Enemy {

  PVector direction;

  Follower2(int x, int y, float locx, float locy) {
    super(20, 50, x, y);
    location.x = locx;
    location.y = locy;
    direction = new PVector(location.x-myHero.location.x, location.y-myHero.location.y);
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image (fish, 0, 0, 70, 70);
    
    popMatrix();
  }

  void act() {
    super.act();

    direction = new PVector(location.x-myHero.location.x, location.y-myHero.location.y);

    velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(3);
  }
}
