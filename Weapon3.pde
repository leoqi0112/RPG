class ShotGun extends Weapon {
  
  ShotGun() {
    super(SHOTGUN_THRESHOLD,SHOTGUN_BULLET_SPEED,black,black,3);
    damage = 2;
  }
  
  void shoot() {
    if (shotTimer >= threshold) {
      for (int i = 0; i < 100; i++) {
        PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
        aimVector.rotate(random(-PI, PI));
        aimVector.setMag(random(bulletSpeed-1,bulletSpeed+1));
        myObjects.add(new Bullet(aimVector, black, black, 3, int(random(200,255)), damage));
      }
      shotTimer = 0;
    }
  }
}
