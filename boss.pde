class boss extends Enemy {
  PVector aim;
  int shotTimer, threshold, threshold2, shotTimer2;
  int shotCDT, shotCDTH;
  int spawnT, spawnThreshold;
  int GifT;

  boss(int x, int y) {
    super(200, 200, x, y);
    velocity = new PVector(0, 0);
    shotTimer = 0;
    shotTimer2 = 0;
    threshold = 20;
    threshold2 = 40;
    shotCDT = 0;
    shotCDTH = 200;
    spawnT = 0;
    spawnThreshold = 500;
    hp = 1500;
  }

  void show() {

    if (inRoomWith(myHero)) {
      color1 = dBlue;
      color2 = azure;

      if (hp > 100) {
        if (GifT < 550) {
          bossI.showB(location.x, location.y, 500, 500);
          GifT++;
        }
        if (GifT >= 549) {
          bossM.show(location.x, location.y, 500, 500);
        }
      } else {
        bossD.showC(location.x, location.y, 500, 500);
      }

      rectMode(CORNER);
      fill(black);
      rect(location.x+10-map(1500, 0, 1500, 0, 80)/2, location.y-90, map(1500, 0, 1500, 0, 80), 10);
      fill(aqua, 200);
      rect(location.x+10-map(1500, 0, 1500, 0, 80)/2, location.y-90, map(hp, 0, 1500, 0, 80), 10);
    }

  }

  void act() {
    super.act();
    if (GifT >= 549) {
      shotTimer++;
      if (shotTimer >= threshold) {
        aim = new PVector (myHero.location.x-location.x, myHero.location.y-location.y);
        aim.setMag(5);
        myObjects.add(new TurretBullet(location.x, location.y, aim, black));
        shotTimer = 0;
      }

      shotCDT++;
      if (shotCDT <= shotCDTH) {
        shotTimer2++;
        if (shotTimer2 >= threshold2) {
          for (int i = 0; i < 50; i++) {
            PVector aimVector = new PVector(myHero.location.x-location.x, myHero.location.y-location.y);
            aimVector.rotate(random(-PI, PI));
            aimVector.setMag(5);
            myObjects.add(new TurretBullet(location.x, location.y, aimVector));
            shotTimer2 = 0;
          }
        }
      }
      
      spawnT++;
      if (spawnT >= spawnThreshold) {
        myObjects.add(new Follower2(10, 8, location.x, location.y));
        myObjects.add(new Follower2(10, 8, location.x, location.y));
        myObjects.add(new Follower2(10, 8, location.x, location.y));
        spawnT = 0;
      }
      if (shotCDT >= shotCDTH+300)
        shotCDT = 0;
    }
  }
}
