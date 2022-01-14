class Obstacle {
  float x, y, s, roomx, roomy;

  Obstacle(float _x, float _y, float _s, int rx, int ry) {
    s = _s;
    x = _x;
    y = _y;
    roomx = rx;
    roomy = ry;
  }

  void show() {
    fill(tan);
    rectMode(CORNER);
    stroke(black);
    strokeWeight(4);
    square(x, y, s);
    fill(brown);
    noStroke();
    square(x+2, y+2, s/8);
    square(x-2+s-s/8, y+2, s/8);
    square(x+2, y-2+s-s/8, s/8);
    square(x-2+s-s/8, y-2+s-s/8, s/8);
  }

  void act() {
    if (myHero.roomX == roomx && myHero.roomY == roomy) {
    if (myHero.location.x+20 > x && myHero.location.x+20 <= x + s/2 && myHero.location.y > y && myHero.location.y < y + s)
      myHero.location.x = x-20;
    if (myHero.location.x-20 < x+s && myHero.location.x-20 >= x + s/2 && myHero.location.y > y && myHero.location.y < y + s)
      myHero.location.x = x + s + 20;
    if (myHero.location.x > x && myHero.location.x < x + s && myHero.location.y+20 > y && myHero.location.y +20 < y + s/2)
      myHero.location.y = y-20;
    if (myHero.location.x > x && myHero.location.x < x + s && myHero.location.y-80 < y+s && myHero.location.y-80 >= y + s/2)
      myHero.location.y = y + s + 80;
    }
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        if (myHero.roomX == roomx && myHero.roomY == roomy) {
          if (obj.location.x+20 > x && obj.location.x+20 <= x + s/2 && obj.location.y > y && obj.location.y < y + s)
            obj.hp--;
          if (obj.location.x-20 < x+s && obj.location.x-20 >= x + s/2 && obj.location.y > y && obj.location.y < y + s)
            obj.hp--;
          if (obj.location.x > x && obj.location.x < x + s && obj.location.y+20 > y && obj.location.y +20 < y + s/2)
            obj.hp--;
          if (obj.location.x > x && obj.location.x < x + s && obj.location.y-80 < y+s && obj.location.y-80 >= y + s/2)
            obj.hp--;
        }
      }
      if (obj instanceof TurretBullet) {
        if (myHero.roomX == roomx && myHero.roomY == roomy) {
          if (obj.location.x+20 > x && obj.location.x+20 <= x + s/2 && obj.location.y > y && obj.location.y < y + s)
            obj.hp--;
          if (obj.location.x-20 < x+s && obj.location.x-20 >= x + s/2 && obj.location.y > y && obj.location.y < y + s)
            obj.hp--;
          if (obj.location.x > x && obj.location.x < x + s && obj.location.y+20 > y && obj.location.y +20 < y + s/2)
            obj.hp--;
          if (obj.location.x > x && obj.location.x < x + s && obj.location.y-80 < y+s && obj.location.y-80 >= y + s/2)
            obj.hp--;
        }
      }
      i++;
    }
  }
}
