class Follower3 extends Enemy {

  Follower3(int x, int y, float locx, float locy) {
    super(20, 50, x, y);
    location.x = locx;
    location.y = locy;
  }

  void show() {
    skeleton2.show(location.x, location.y, 80, 80);

    rectMode(CORNER);
    fill(black);
    rect(location.x-map(20, 0, 20, 0, 80)/2, location.y-30, map(20, 0, 20, 0, 80), 10);
    fill(aqua, 200);
    rect(location.x-map(20, 0, 20, 0, 80)/2, location.y-30, map(hp, 0, 20, 0, 80), 10);
  }

  void act() {
    super.act();

    velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(1);
  }
}
