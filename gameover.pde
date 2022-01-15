void gameover() {
  background(black);
  if (myHero.hp <= 0) {
    textSize(60);
    fill(red);
    text("You Failed", width/2, height/2);
  } else {
    fill(white);
    text("You Won", width/2, height/2);
  }
}

void gameoverClicks() {

  mode = INTRO;
  size(800, 800, FX2D);

  //room colors
  color1 = dBlue;
  color2 = slate;

  //add gif
  myGIF = new GIFS(48, "frame_", "_delay-0.2s.png", width/2, height/2, width, height);

  //skeleton
  skeletonUp = new GIFS(4, 10, "skeleton/up/Skeleton_", ".png");
  skeletonDown = new GIFS(4, 10, "skeleton/down/Skeleton_", ".png");
  skeletonLeft = new GIFS(4, 10, "skeleton/left/Skeleton_", ".png");
  skeletonRight = new GIFS(4, 10, "skeleton/right/Skeleton_", ".png");
  skeleton2 = new GIFS(4, 10, "Gnoll - Shaman/GnollShaman_Walk_", ".png");

  //lantern
  lantern = new GIFS(4, 10, "frame_", "_delay-0.16s.png");

  //boss initial
  bossI = new GIFS(81, 10, "boss/frame_", "_delay-0.06s.png");
  //boss mid
  bossM = new GIFS(25, 10, "bossM/frame_", "_delay-0.06s copy.png");
  //boss death
  bossD = new GIFS(52, 10, "bossD/frame_", "_delay-0.06s copy.png");

  map = loadImage("map.png");

  //add enemies
  crab = loadImage("crab.png");
  seaweed = loadImage("Seaweed.png");
  shrimp = loadImage("shrimp.png");
  lobster = loadImage("Lobster.png");
  fishTank = loadImage("fishTank.png");
  fish = loadImage("fish.png");
  health = loadImage("health.png");
  bubble = loadImage("bubble.png");
  ink = loadImage("Ink.png");
  wave = loadImage("wave.png");
  octopus2 = loadImage("friend.png");
  cage = loadImage("cage.png");
  KEY = loadImage("key.png");
  kraken = loadImage("kraken.jpeg");

  //OBgrid setup

  for (int i = 0; i < OBgrid.length; i++) {
    for (int k = 0; k < OBgrid[0].length; k++) {
      OBgrid[i][k] = (int) random(0, 3);
      print(OBgrid[i][k]);
    }
  }

  //initialize obstacle
  int obx = 120;
  int oby = 50;
  for (int i = 0; i < OBgrid.length; i++) {
    for (int k = 0; k < OBgrid[0].length; k++) {
      if (OBgrid[i][k] == 0) {
        obstacles.add(new Obstacle(obx, oby, 70, 6, 3));
        obx += 70;
      } else {
        obx += 70;
      }
    }
    oby += 70;
    obx = 120;
  }

  //Create darkness
  darkness = new ArrayList<DarknessCell> (1000);
  int size = 5;
  rectMode(CORNER);
  int x = 0, y = 0;
  darkness.add(new DarknessCell(0, 0, size));
  while (x <= width && y <= height) {

    darkness.add(new DarknessCell(x, y, size));

    x = x + size;

    if (x == width) {
      y = y + size;
      x = 0;
    }
  }

  //add font
  box = createFont("LTEnergy.ttf", 100);

  //add button
  startButton = new Buttons(width/2+100, height/2-130, 375, 40, "Start", black, blue);
  buttonH = new Buttons(width/2, height/2-90, 40, 40, "", white, blue);
  buttonV = new Buttons(width/2, height/2+10, 40, 40, "", white, blue);

  myHero = new Hero();
  myPet = new Pet();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myHero);
  myObjects.add(myPet);

  myParticles = new ArrayList<Particles>();

  //loading the enemies from the map
  x = 0;
  y = 0;
  while (y < map.height) {
    color roomColor = map.get(x, y);
    if (roomColor == aqua) {
      myObjects.add(new Follower(x, y));
    }
    if (roomColor == blue) {
      myObjects.add(new Enemy(x, y));
      myObjects.add(new Enemy(x, y));
      myObjects.add(new Enemy(x, y));
      myObjects.add(new Enemy(x, y));
      myObjects.add(new Enemy(x, y));
    }
    if (roomColor == pink) {
      myObjects.add(new Turret(x, y));
    }
    if (roomColor == purple) {
      myObjects.add(new Lurker(x, y));
    }
    if (roomColor == azure) {
      myObjects.add(new SpawnPool(x, y));
    }
    if (roomColor == dBlue) {
      myObjects.add(new boss(x, y));
    }
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }

  gun1 = gun2 = gun3 = false;
}
