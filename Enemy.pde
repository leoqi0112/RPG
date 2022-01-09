class Enemy extends GameObject {
  
  int type = 0;
  
  Enemy() {
    location = new PVector(random(100,width-100), random(100,height-100));
    velocity = new PVector(0,0);
    hp = 100;
    size = 50;
    roomX = 2;
    roomY = 2;
    xp = 1;
  }
  
  Enemy(int _hp, int s, int x, int y) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    hp = _hp;
    size = s;
    roomX = x;
    roomY = y;
    xp = 5;
  }
  
   Enemy(int x, int y) {
    location = new PVector(random(100,width-100), random(100,height-100));
    velocity = new PVector(0,0);
    hp = 100;
    size = 60;
    roomX = x;
    roomY = y;
    xp = 2;
  }
  
  void show() {
    
    //stroke(black);
    //strokeWeight(2);
    //fill(slate);
    //circle(location.x, location.y, size);
    fill(black);
    image (seaweed, location.x, location.y, size, size);
    textSize(20);
    text(hp, location.x, location.y-40);
    
    if (inRoomWith(myHero)) {
    color1 = slate;
    color2 = azure;
    } 
    
  }
  
  void act() {
    super.act();
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.location.x, obj.location.y, location.x, location.y);
        if (d <= size/2 + obj.size/2) {
          //hp = hp - (int) obj.velocity.mag();
          hp = hp - (int) obj.damage;
          obj.hp = 0;
          if (hp<=0) {
            myObjects.add(new DroppedItem(location.x, location.y, roomX, roomY));
            if (myHero.roomX == 8 && myHero.roomY == 10 && type == 1)
            myObjects.add(new DroppedItem(location.x+20, location.y));
            myObjects.add(new message("+" + xp, location.x, location.y, roomX, roomY));
            myHero.xp += xp;
          }
        }
      }
      i++;
    }
  }
}
