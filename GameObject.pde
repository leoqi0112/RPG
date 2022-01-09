class GameObject {
  int roomX, roomY;
  PVector location;
  PVector velocity;
  int hp, hpMax;
  int size;
  int xp;
  float speed;
  double damage;
  
  GameObject() {
    
  }
  
  void show() {
    
  }
  
  void act() {
    //move
    location.add(velocity);
    
    //check for hitting walls
    if (location.y < 50+size/2) location.y = 50+size/2;
    if (location.y > height-50-size/2) location.y = height-50-size/2;
    if (location.x < 50+size/2) location.x = 50+size/2;
    if (location.x > width-50-size/2) location.x = width-50-size/2;
    
  }
  
  public boolean inRoomWith(GameObject myObj) {
    return myObj.roomX == roomX && myObj.roomY == roomY;
  }
  
  boolean isCollidingWith(GameObject myObj) {
    float d = dist(myObj.location.x, myObj.location.y, location.x, location.y);
    if (inRoomWith(myObj) && d < size/2 + myObj.size/2 && hp>0)
      return true;
    else
      return false;
  }
  
  //void explode(int n) {
  //  int i = 0;
  //  myObjects.add(new Ring(loc, c));
  //  while (i < n) {
  //    myObjects.add(new Particles(loc, c));
  //    i++;
  //  }
  //  }
  }
  
