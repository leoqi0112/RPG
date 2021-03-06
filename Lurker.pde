class Lurker extends Enemy {

  Lurker(int x, int y) {
    super(100, 50, x, y);
    int i = (int) random(0, 1);
    int locx, locy;
    if (i == 0) {
      locx = width-100;
      locy = 100;
    } else {
      locx = 100;
      locy = height-100;
    }
    location = new PVector(locx, locy);
  }

  void show() {
    image (lobster, location.x, location.y, 163, 88);
    fill(black);
    rectMode(CORNER);
    fill(black);
    rect(location.x-map(100, 0, 100, 0, 80)/2, location.y-40, map(100, 0, 100, 0, 80), 10);
    fill(aqua, 200);
    rect(location.x-map(100, 0, 100, 0, 80)/2, location.y-40, map(hp, 0, 100, 0, 80), 10);

    if (inRoomWith(myHero)) {
      color1 = wisteria;
      color2 = periwinkle;
    }
  }

  void act() {
    super.act();
    if (dist(myHero.location.x, myHero.location.y, location.x, location.y) <= 200) {
      velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      velocity.setMag(3);
    } else {
      velocity.x = 0;
      velocity.y = 0;
    }
  }
}
