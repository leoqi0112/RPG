class TurretBullet extends GameObject {

  color c;

  TurretBullet(float x, float y, PVector v) {
    location = new PVector(x, y);
    velocity = v;
    size = TURRET_BULLET_SIZE;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    hp = 1;
    c = red;
  }

  TurretBullet(float x, float y, PVector v, color c) {
    location = new PVector(x, y);
    velocity = v;
    size = TURRET_BULLET_SIZE;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    hp = 1;
    this.c = c;
  }


  void show() {
    fill(c);
    noStroke();
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);

    if (location.y < 50+size/2) {
      hp = 0;
    }
    if (location.y > height-50+size/2) {
      hp = 0;
    }
    if (location.x < 50+size/2) {
      hp = 0;
    }
    if (location.x > width-50+size/2) {
      hp = 0;
    }
  }
}
