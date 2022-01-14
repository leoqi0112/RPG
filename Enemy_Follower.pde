class Follower extends Enemy {

  GIFS currentAction;

  Follower(int x, int y) {
    super(300, 50, x, y);
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

    rectMode(CORNER);
    fill(black);
    rect(location.x-map(300, 0, 300, 0, 80)/2, location.y-60, map(300, 0, 300, 0, 80), 10);
    fill(aqua, 200);
    rect(location.x-map(300, 0, 300, 0, 80)/2, location.y-60, map(hp, 0, 300, 0, 80), 10);

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
    
    //spawn minions
    if (hp <= 0) {
    myObjects.add(new Follower3(roomX, roomY, location.x+60, location.y));
    myObjects.add(new Follower3(roomX, roomY, location.x-60, location.y));
    myObjects.add(new Follower3(roomX, roomY, location.x, location.y));
    }
  }
}
