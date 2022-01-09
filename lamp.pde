class lamp extends GameObject {
  lamp(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }
  
  void show() {
    //fill(orange);
    //noStroke();
    //ellipse(location.x, location.y, 30, 30);
    lantern.show(location.x, location.y, 60,60);
  }
  
  void act() {
    super.act();
  }
  
}
