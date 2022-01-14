class SpawnPool extends Enemy {
    
    int shotTimer, threshold;
    int x,y;
    
    SpawnPool(int x, int y) {
    super(SPAWN_POOL_HP, SPAWN_POOL_SIZE, x, y);
      this.x = x;
      this.y = y;
    velocity = new PVector(0,0);
    shotTimer = 0;
    threshold = 60;
    type = 1;
  }
    void show() {
    image (fishTank, location.x, location.y, 100, 100);
    rectMode(CORNER);
    fill(black);
    rect(location.x-map(200, 0, 200, 0, 80)/2, location.y-80, map(200, 0, 200, 0, 80), 10);
    fill(aqua, 200);
    rect(location.x-map(200, 0, 200, 0, 80)/2, location.y-80, map(hp, 0, 200, 0, 80), 10);
  }
  
  void act() {
    super.act();
    
    shotTimer++;
    
    if (shotTimer >= threshold) {
      myObjects.add(new Follower2(x, y, location.x, location.y));
      shotTimer = 0;
    }
  }
}
