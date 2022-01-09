class Follower extends Enemy {
  
  GIFS currentAction;
  
  Follower(int x, int y) {
    super(100, 50, x, y);
    currentAction = skeletonDown;
  }
  
  void show() {
    //noStroke();
    //fill(pink);
    //circle(location.x, location.y, size);
    //image (crab, location.x, location.y, 87.5, 58);
    //fill(black);
    
    currentAction.show(location.x, location.y, 50, 80);
    textSize(30);
    fill(black);
    text(hp, location.x, location.y-60);
    
    if (inRoomWith(myHero)) {
    color1 = blueGreen;
    color2 = aqua;
    } 
  }
  
  void act() {
    super.act();
    
    velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(3);
    
    //direction
    if (abs(velocity.y) > abs(velocity.x)) {
      if (velocity.y > 0) currentAction = skeletonDown;
      else currentAction = skeletonUp;
    } else {
      if (velocity.x > 0) currentAction = skeletonRight;
      else currentAction = skeletonLeft;
    }
    
  }
}
