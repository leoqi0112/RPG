class Bullet extends GameObject {

  color bulletfill, strokeC;

  int t;

  Bullet(PVector v, color c, color c2, int s, double d) {
    location = new PVector (myHero.location.x, myHero.location.y-42);
    velocity = v;
    bulletfill = c;
    strokeC = c2;
    size = s;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    hp = 1;
    t = 1000;
    damage = d;
  }

  Bullet(PVector v, color c, int s, double d) {
    location = new PVector (myPet.location.x, myPet.location.y);
    velocity = v;
    bulletfill = c;
    size = s;
    strokeC = c;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    hp = 1;
    t = 1000;
    damage = d;
  }

  Bullet(PVector v, color c, color c2, int s, int t, double d) {
    location = new PVector (myHero.location.x, myHero.location.y-42);
    velocity = v;
    bulletfill = c;
    strokeC = c2;
    size = s;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    hp = 1;
    this.t = t;
    damage = d;
  }

  void show() {
    fill(bulletfill, t);
    stroke(strokeC, t);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);

    t = t-2;
    if (t <= 0) hp = 0;

    if (location.y < 50+size/2) {
      myObjects.add(new BulletP(location.x, location.y, size/2));
      myObjects.add(new BulletP(location.x, location.y, size/2));
      myObjects.add(new BulletP(location.x, location.y, size/2));
      hp = 0;
    }
    if (location.y > height-50+size/2) {
      myObjects.add(new BulletP(location.x, location.y, size));
      myObjects.add(new BulletP(location.x, location.y, size/2));
      myObjects.add(new BulletP(location.x, location.y, size/2));

      hp = 0;
    }
    if (location.x < 50+size/2) {
      myObjects.add(new BulletP(location.x, location.y, size));
      myObjects.add(new BulletP(location.x, location.y, size/2));
      myObjects.add(new BulletP(location.x, location.y, size/2));
      hp = 0;
    }
    if (location.x > width-50+size/2) {
      myObjects.add(new BulletP(location.x, location.y, size));
      myObjects.add(new BulletP(location.x, location.y, size/2));
      myObjects.add(new BulletP(location.x, location.y, size/2));
      hp = 0;
    }
  }
}
