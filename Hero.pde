class Hero extends GameObject {
  //Instance variables

  Weapon myWeapon;

  int InkTimer = 501;
  int InkThreshold = 500;
  boolean inkT, gun1T, gun2T = false;
  boolean hasKey = false;

  Hero() {
    location = new PVector(width/2, height/2);
    velocity = new PVector (0, 0);
    hp = HERO_HP;
    hpMax = hp = HERO_HP;
    speed = 2;
    roomX = 2;
    roomY = 2;
    myWeapon = new Weapon();
    size = HERO_SIZE;
    immunityT = 0;
    immunityThreshold = 200;
    squid = new GIFS(12, "frame_", "_delay-0.1s.png", location.x, location.y, 300, 300);
  }

  void show() {
    squid.show(location.x, location.y);
    //pushMatrix();
    //translate (location.x, location.y);
    //fill(black);
    //noStroke();
    //circle(0, 0, size);

    //if (immunityT < immunityThreshold) {
    //  stroke(aqua, 240);
    //  fill(black);
    //  circle(0, 0, size);
    //}
    //popMatrix();
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        damage = myObj.damage;
      }
    }
  }

  void act() {
    super.act();

    immunityT++;

    //guns
    //if (gun1) {
    //  myWeapon = new AutoPistol();
    //}
    //if (gun2) {
    //  print(0);
    //  myWeapon = new SniperRifle();
    //}
    //if (gun3) {
    //  myWeapon = new ShotGun();
    //}
    if (InkTimer <= InkThreshold) {
      InkTimer++;
    }
    if (InkTimer > InkThreshold) {
      if (gun1) {
        myWeapon = new AutoPistol();
        gun1T = true;
        gun2T = false;
        inkT = false;
      }
      if (gun2) {
        print(0);
        myWeapon = new SniperRifle();
        gun2T = true;
        gun1T = false;
        inkT = false;
      }
      if (inkT && frameCount%50 ==0) {
        hp--;
      }
    }

    //controls
    if (upkey) {
      velocity.y = -speed;
    } else if (downkey) {
      velocity.y = speed;
    } else if (!upkey && !downkey) {
      velocity.y = 0;
    }

    if (rightkey) {
      velocity.x = speed;
    } else if (leftkey) {
      velocity.x = -speed;
    } else if (!rightkey && !leftkey) {
      velocity.x = 0;
    }

    if (velocity.mag() > 5)
      velocity.setMag(5);

    //check exits
    //north
    if (northRoom != #aab7b8 && location.y == 80 && location.x >= width/2-50 && location.x <= width/2+50) {
      roomY--;
      location = new PVector (width/2, 720-10);
      cleanUp();
    }
    //south
    if (southRoom != #aab7b8 && location.y == 720 && location.x >= width/2-50 && location.x <= width/2+50) {
      roomY++;
      location = new PVector (width/2, 80+10);
      cleanUp();
    }
    //east
    if (eastRoom != #aab7b8 && location.x == 720 && location.y >= height/2-50 && location.y <= height/2+50) {
      roomX++;
      location = new PVector (80+10, height/2);
      cleanUp();
    }
    //west
    if (westRoom != #aab7b8 && location.x == 80 && location.y >= height/2-50 && location.y <= height/2+50) {
      roomX--;
      location = new PVector (720-10, height/2);
      cleanUp();
    }

    myWeapon.update();
    if (space) myWeapon.shoot();

    //collision
    if (immunityT > immunityThreshold) {
      int i = 0;
      while (i < myObjects.size()) {
        GameObject myObj = myObjects.get(i);
        if (myObj instanceof Enemy) {
          if (isCollidingWith(myObj)) {
            //if (roomX == myObj.roomX && roomY == myObj.roomY) {
            //if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
            hp = hp - 5;
            immunityT = 0;
            //}
            //  }
          }
        }

        if (myObj instanceof DroppedItem && isCollidingWith(myObj)) {
          DroppedItem item = (DroppedItem) myObj;
          if (item.type == HEALTHPOD) {

            hp += HEALTH;
            if (hp > hpMax)
              hp = hpMax;

            myObj.hp = 0;
          }
          if (item.type == BULLET) {
            if (bulletAmount < 150)
              bulletAmount += BULLETADD;
            else
              bulletAmount += 200-bulletAmount;

            myObj.hp = 0;
          }
          if (item.type == INK) {
            InkTimer = 0;
            myWeapon = new ShotGun();
            gun2T = false;
            gun1T = false;
            inkT = true;
            myObj.hp = 0;
          }
          if (item.type == 4) {
            hasKey = true;
            myObj.hp = 0;
          }
        }
        i++;
      }
      int ii = 0;
      while (ii < myObjects.size()) {
        GameObject myObj = myObjects.get(ii);
        if (myObj instanceof TurretBullet) {
          if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
            hp = hp - 2;
            immunityT = 0;
          }
        }
        ii++;
      }
    }

    //color check
    int ii = 0;
    while (ii < myObjects.size()) {
      GameObject myObj = myObjects.get(ii);
      if (myObj instanceof Enemy) {
        if (!(roomX == myObj.roomX) && !(roomY == myObj.roomY)) {
          color1 = dBlue;
          color2 = slate;
        }
      }
      ii++;
    }
    if (hp <= 0) {
      mode = GAMEOVER;
    }

    for (int i = 0; i < obstacles.size(); i++) {
      if (roomX == obstacles.get(i).roomx && roomY == obstacles.get(i).roomy) {
        if (myHero.location.x+20 > obstacles.get(i).x && myHero.location.x+20 <= obstacles.get(i).x + obstacles.get(i).s/2 && myHero.location.y > obstacles.get(i).y && myHero.location.y < obstacles.get(i).y + obstacles.get(i).s)
          myHero.location.x = obstacles.get(i).x-20;
        if (myHero.location.x-20 < obstacles.get(i).x+obstacles.get(i).s && myHero.location.x-20 >= obstacles.get(i).x + obstacles.get(i).s/2 && myHero.location.y > obstacles.get(i).y && myHero.location.y < obstacles.get(i).y + obstacles.get(i).s)
          myHero.location.x = obstacles.get(i).x + obstacles.get(i).s + 20;
        if (myHero.location.x > obstacles.get(i).x && myHero.location.x < obstacles.get(i).x + obstacles.get(i).s && myHero.location.y+20 > obstacles.get(i).y && myHero.location.y +20 < obstacles.get(i).y + obstacles.get(i).s/2)
          myHero.location.y = obstacles.get(i).y-20;
        if (myHero.location.x > obstacles.get(i).x && myHero.location.x < obstacles.get(i).x + obstacles.get(i).s && myHero.location.y-80 < obstacles.get(i).y+obstacles.get(i).s && myHero.location.y-80 >= obstacles.get(i).y + obstacles.get(i).s/2)
          myHero.location.y = obstacles.get(i).y + obstacles.get(i).s + 80;
      }
    }
  }

  void cleanUp() {
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        if (!inRoomWith(obj)) {
          myObjects.remove(i);
          i--;
        }
      }
    }
  }
}
