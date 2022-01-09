class Pet extends GameObject {

  float angle = 0;
  Weapon petW;

  Pet() {
    location = new PVector(width/2, height/2);
    velocity = new PVector (0, 0);
    hp = 1;
    speed = 2;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    size = 50;
    petW = new PWeapon();
    pet = new GIFS(6, "squid_", "_delay-0.1s.png", location.x, location.y, size, size);
  }

  void show() {
    angle += 0.02;
    if (angle > 2*PI) {
      angle = 0;
    }
    location = new PVector(myHero.location.x+cos(angle)*100, myHero.location.y+sin(angle)*100);
    pet.show(location.x, location.y);
  }

  void act() {
    super.act();
    petW.update();
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Enemy) {
        if(myObj.inRoomWith(myHero))
        petW.Pshoot();
      }
    }
  }
}
