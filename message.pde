class message extends GameObject {
  
  String phrase;
  
  message(String s, float x, float y, int _x, int _y) {
    location = new PVector(x,y);
    velocity = new PVector(0,-3);
    roomX = _x;
    roomY = _y;
    phrase = s;
    hp = 1;
  }
  
  void show() {
    textAlign(CENTER,CENTER);
    fill(black);
    textSize(30);
    text(phrase,location.x,location.y);
  }
  
  void act() {

      super.act();

    if (location.y <= 100) 
    hp = 0;
  }
}
