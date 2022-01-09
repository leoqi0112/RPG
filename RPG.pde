import processing.javafx.*;

//Leo Qi
//Oct 21st
GIFS myGIF;
GIFS squid;
GIFS pet;
GIFS skeletonUp;
GIFS skeletonDown;
GIFS skeletonLeft;
GIFS skeletonRight;
GIFS lantern;

Buttons startButton, buttonH, buttonV;
boolean upkey, downkey, leftkey, rightkey, space, gun1, gun2, gun3;
ArrayList<GameObject> myObjects;
ArrayList<Particles> myParticles;
ArrayList<DarknessCell> darkness;
int[] lightValue = new int[25761];

//settings: dropped item types
final int HEALTH = 2;
final int BULLETADD = 50;

//constants
final int TURRET_HP = 40;
final int TURRET_SIZE = 80;
final int TURRET_THRESHOLD = 60;
final int TURRET_BULLET_SIZE = 10;

final int SPAWN_POOL_HP = 30;
final int SPAWN_POOL_SIZE = 80;

final int HERO_SIZE = 60;
final int HERO_HP = 50;

final int SNIPER_THRESHOLD = 100;
final int SNIPER_BULLET_SPEED = 20;

final int SHOTGUN_THRESHOLD = 50;
final int SHOTGUN_BULLET_SPEED = 5;

final int AUTOPISTOL_THRESHOLD = 10;
final int AUTOPISTOL_BULLET_SPEED = 5;

final int HEALTHPOD = 1;
final int BULLET = 2;
final int INK = 3;

//colors
color coral = #EF767A;
color slate = #63768D;
color blue = #8AC6D0;
color dBlue = #566573;
color aqua = #A3E4D7;
color purple = #BB8FCE;
color orange = #EB984E;
color pink = #E37383;
color red = #E74C3C;
color green = #58D68D;
color black = #212121;
color white = #EBEDEF;
color Twhite = #FFFFFF;
color brown = #B0916E;
color darkBrown = #AD8762;
color blueGreen = #5F9EA0;
color azure = #F0FFFF;
color wisteria = #BDB5D5;
color periwinkle = #CCCCFF;
color tan = #dec29d;
color gray = #C5C6D0;

//room color
color color1, color2;

//Images
PImage map;
PImage crab;
PImage seaweed;
PImage shrimp;
PImage lobster;
PImage fishTank;
PImage fish;
PImage health;
PImage bubble;
PImage ink;
PImage pause;
PImage wave;
PImage octopus2;
PImage cage;
PImage KEY;

color northRoom, eastRoom, southRoom, westRoom;

//font
PFont box;

//modes
int mode;

//Hero
int immunityT, immunityThreshold;

//dot variables
float constant = 0.05;
float s = 10;
int timer = 60;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//mouse control variables
boolean mouseReleased;
boolean wasPressed;

//Hero
Hero myHero;
int ti = 0;
int tx = width/2;
int ty = height/2;

//pet
Pet myPet;

//bullet
int bulletAmount = 200;

void setup() {
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

  //lantern
  lantern = new GIFS(4, 10, "frame_", "_delay-0.16s.png");

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
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }

  gun1 = gun2 = gun3 = false;
}

void draw() {
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  } else {
    mouseReleased = false;
  }
  //mode framework
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}

void keyPressed() {

  if (key == 'W' || key == 'w') upkey = true;
  if (key == 'S' || key == 's') downkey = true;
  if (key == 'A' || key == 'a') leftkey = true;
  if (key == 'D' || key == 'd') rightkey = true;

  if (key == ' ') space = true;
  if (keyCode == '1') gun1 = true;
  if (keyCode == '2') gun2 = true;
  if (keyCode == '3') gun3 = true;
}

void keyReleased() {
  if (key == 'W' || key == 'w') upkey = false;
  if (key == 'S' || key == 's') downkey = false;
  if (key == 'A' || key == 'a') leftkey = false;
  if (key == 'D' || key == 'd') rightkey = false;

  if (key == ' ') space = false;
  if (keyCode == '1') gun1 = false;
  if (keyCode == '2') gun2 = false;
  if (keyCode == '3') gun3 = false;
}
