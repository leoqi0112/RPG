class Turret extends Enemy {
  PVector direction;
  PVector aim;
  int shotTimer, threshold;
  Turret(int x, int y) {
    super(TURRET_HP, TURRET_SIZE, x, y);
    direction = new PVector (0, -0.1);

    velocity = new PVector(0, 0);
    shotTimer = 0;
    threshold = TURRET_THRESHOLD;
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image (shrimp, 0, 0, 80, 80);
    popMatrix();
    
    rectMode(CORNER);
    fill(black);
    rect(location.x-map(200, 0, 200, 0, 80)/2, location.y-60, map(200, 0, 200, 0, 80), 10);
    fill(aqua, 200);
    rect(location.x-map(200, 0, 200, 0, 80)/2, location.y-60, map(hp, 0, 200, 0, 80), 10);

    if (inRoomWith(myHero)) {
      color1 = red;
      color2 = azure;
    }
  }

  void act() {
    super.act();

    direction = new PVector(myHero.location.x-location.x, myHero.location.y-location.y);

    shotTimer++;
    if (shotTimer >= threshold) {
      aim = new PVector (myHero.location.x-location.x, myHero.location.y-location.y);
      aim.setMag(5);
      myObjects.add(new TurretBullet(location.x, location.y, aim));
      shotTimer = 0;
    }
  }
}
