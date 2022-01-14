class Weapon {

  int shotTimer;
  int threshold;
  int bulletSpeed;
  int bulletC;
  int strokeC;
  int size;
  double damage;

  Weapon() {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 5;
    bulletC = azure;
    strokeC = black;
    size = 10;
    damage = 1;
  }

  Weapon(int thr, int bs, color c, color c2, int s) {
    shotTimer = 0;
    threshold = thr;
    bulletSpeed = bs;
    bulletC = c;
    strokeC = c2;
    size = s;
  }

  void update() {
    shotTimer++;
  }

  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
      aimVector.setMag(bulletSpeed);
      if (bulletAmount > 0) {
        myObjects.add(new Bullet(aimVector, bulletC, strokeC, size, damage));
        bulletAmount--;
      }
      shotTimer = 0;
    }
  }

  void Pshoot() {
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Enemy) {
        if (shotTimer >= threshold) {
          PVector aimVector = new PVector(myObj.location.x-myPet.location.x, myObj.location.y-myPet.location.y);
          aimVector.setMag(bulletSpeed);
          myObjects.add(new Bullet(aimVector, bulletC, size, damage));
          shotTimer = 0;
        }
      }
    }
  }
}
