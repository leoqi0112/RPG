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
    fill(black);
    textSize(30);
    text(hp, location.x, location.y-60);
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
