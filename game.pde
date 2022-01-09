void game() {
  drawRoom(color1, color2);
  drawGameObjects();
  drawDarkness();

  drawMiniMap();

  myPet.roomX = myHero.roomX;
  myPet.roomY = myHero.roomY;

  //indicate hp
  //if (immunityT > immunityThreshold) {
  //  fill(azure);
  //}
  //if (immunityT < immunityThreshold) {
  //  fill(red);
  //}
  //textSize(30);
  //text("Hp: " + myHero.hp, width-80, 30);

  if (immunityT > immunityThreshold) {
    noStroke();
  }
  if (immunityT < immunityThreshold) {
    stroke(white);
    strokeWeight(2);
  }
  rectMode(CORNER);
  fill(black);
  rect(myHero.location.x-map(myHero.hpMax, 0, myHero.hpMax, 0, 80)/2, myHero.location.y-110, map(myHero.hpMax, 0, myHero.hpMax, 0, 80), 10);
  fill(aqua, 200);
  rect(myHero.location.x-map(myHero.hpMax, 0, myHero.hpMax, 0, 80)/2, myHero.location.y-110, map(myHero.hp, 0, myHero.hpMax, 0, 80), 10);

  //indicate bullet amount
  fill(white);
  textSize(15);
  text("Bullet: " + bulletAmount, myHero.location.x-map(myHero.hpMax, 0, myHero.hpMax, 0, 80)/2+33, myHero.location.y-125);

  //pause button
  if (dist(50, height-50, mouseX, mouseY) < 25) {
    noFill();
    noStroke();
    circle(50, height-50, 50);
    noStroke();
    fill(255);
    strokeWeight(3);
    triangle(40, height-40, 40, height-60, 60, height-50);
  } else {
    noFill();
    noStroke();
    circle(50, height-50, 50);
    stroke(255);
    strokeWeight(3);
    line(40, height-40, 40, height-60);
    line(60, height-40, 60, height-60);
  }

  //weapon type display
  stroke(tan);
  fill(tan, 100);
  rect(width-210, height-75, 200, 80);
  textSize(30);
  fill(black);
  text("Weapon: ", width-140, height-35);
  if (myHero.gun1T) {
    image (bubble, width-50, height-35, 40, 40);
  } else if (myHero.gun2T) {
    noStroke();
    fill(pink);
    circle(width-50, height-30, 20);
  } else if (myHero.inkT) {
    image (ink, width-50, height-35, 40, 40);
  } else {
    stroke(black);
    strokeWeight(4);
    fill(white, 100);
    circle(width-50, height-35, 40);
  }

  //position map
  fill(gray, 100);
  noStroke();
  rect(200, 80, 120, 120);

  if (northRoom != #aab7b8) {
    noStroke();
    fill(black);
    ellipse(260, 80, 20, 10);
    myObjects.add(new lamp(width/2-80, 30));
    myObjects.add(new lamp(width/2+80, 30));
  }
  if (eastRoom != #aab7b8) {
    noStroke();
    fill(black);
    ellipse(320, 140, 10, 20);
    myObjects.add(new lamp(width-30, height/2-80));
    myObjects.add(new lamp(width-30, height/2+80));
  }
  if (southRoom != #aab7b8) {
    noStroke();
    fill(black);
    ellipse(260, 200, 20, 10);
    myObjects.add(new lamp(width/2-80, height-30));
    myObjects.add(new lamp(width/2+80, height-30));
  }
  if (westRoom != #aab7b8) {
    noStroke();
    fill(black);
    ellipse(200, 140, 10, 20);
    myObjects.add(new lamp(30, height/2-80));
    myObjects.add(new lamp(30, height/2+80));
  }

  //position

  float dx = map(myHero.location.x, 0, width, 0, 120);
  float dy = map(myHero.location.y, 0, height, 0, 120);

  fill(orange);
  noStroke();
  circle(200+dx, 80+dy, 10);
  strokeWeight(2);
  stroke(black);
  PVector v = new PVector(myHero.velocity.x, myHero.velocity.y);
  v.setMag(10);
  line(200+dx, 80+dy, 200+dx+v.x, 80+dy+v.y);

  if (myHero.hasKey) {
  textSize(60);
  fill(white);
  if (ti < 150) {
    text("You Got The Key", width/2, height/2);
  }
  ti++;
  }

  setLightValue();
}

void drawDarkness() {
  int i = 0;
  while (i < darkness.size()) {
    DarknessCell dark = darkness.get(i);
    dark.show(lightValue[i]);
    i++;
  }
}

void setLightValue() {
  for (int i = 0; i < darkness.size(); i++) {
    DarknessCell dark = darkness.get(i);
    int max = 0;
    //if ( map(dist(dark.x,dark.y,myHero.location.x,myHero.location.y), 0, 300, 0, 255) > max)
    //max = (int) map(dist(dark.x,dark.y,myHero.location.x,myHero.location.y), 0, 300, 0, 255);


    for (int ii = 0; ii < myObjects.size(); ii++) {
      GameObject myObj = myObjects.get(ii);
      if (myObj instanceof lamp) {
        if (map(dist(dark.x, dark.y, myObj.location.x, myObj.location.y), 0, 40, 0, 255) > map(dist(dark.x, dark.y, myHero.location.x, myHero.location.y), 0, 300, 0, 255)) {
          max = (int) map(dist(dark.x, dark.y, myHero.location.x, myHero.location.y), 0, 300, 0, 255);
        }
      }
    }

    for (int ii = 0; ii < myObjects.size(); ii++) {
      GameObject myObj = myObjects.get(ii);
      if (myObj instanceof lamp) {
        if ( map(dist(dark.x, dark.y, myObj.location.x, myObj.location.y), 0, 40, 0, 255) <= map(dist(dark.x, dark.y, myHero.location.x, myHero.location.y), 0, 300, 0, 255)) {
          max = (int) map(dist(dark.x, dark.y, myObj.location.x, myObj.location.y), 0, 40, 0, 255);
        }
        //if (map(dist(dark.x,dark.y,myObj.location.x,myObj.location.y), 0, 80, 0, 255) > map(dist(dark.x,dark.y,myHero.location.x,myHero.location.y), 0, 300, 0, 255)){
        //max = (int) map(dist(dark.x,dark.y,myHero.location.x,myHero.location.y), 0, 300, 0, 255);
        //}
      }
    }
    lightValue[i] = max;
  }
}

void drawGameObjects() {
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    if (myObj.roomX == myHero.roomX && myObj.roomY == myHero.roomY) {
      myObj.show();
      myObj.act();
    }
    if (myObj.hp <= 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }
}

void drawRoom(color c1, color c2) {
  background (c1);
  noStroke();

  //setting

  //corners
  stroke(black);
  strokeWeight(4);
  line(0, 0, 800, 800);
  line(800, 0, 0, 800);

  //draw exits
  //#1 Find out which directions have exits
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX-1, myHero.roomY);

  //#2 Draw the doors where there are exits
  noStroke();
  fill(black);
  if (northRoom != #aab7b8) {
    ellipse(width/2, 60, 100, 100);
  }
  if (eastRoom != #aab7b8) {
    ellipse(740, height/2, 100, 100);
  }
  if (southRoom != #aab7b8) {
    ellipse(width/2, 740, 100, 100);
  }
  if (westRoom != #aab7b8) {
    ellipse(60, height/2, 100, 100);
  }

  //draw floor
  rectMode(CENTER);
  stroke(black);
  fill(c2);
  rect(width/2, height/2, 700, 700);

  //cage
  if (myHero.roomX == 10 && myHero.roomY == 8) {
    image(octopus2, 650, 150, 100, 100);
    image(cage, 650, 150, 150, 150);
    if (myHero.hasKey && myHero.location.x > 575 && myHero.location.x < 725 && myHero.location.y > 75 && myHero.location.y < 225)
    mode = GAMEOVER;
  }
  
}

void drawMiniMap() {
  float size = 10;
  int x = 0;
  int y = 0;
  while (y < map.height) {
    color c = map.get(x, y);
    noStroke();
    fill(c, 180);
    square(x*10+80, y*10+80, size);
    x += 1;
    if (x >= map.width) {
      x = 0;
      y += 1;
    }
  }

  //dot
  fill(orange);
  stroke(black);
  strokeWeight(2);
  rectMode(CENTER);
  if (s <= 10) {
    timer = 60;
  }
  if (s > size && timer < 0) {
    s -= constant;
  } else {
    s += constant;
  }
  timer -= 1;
  square((myHero.roomX*10+85), (myHero.roomY*10+85), s);
}

void gameClicks() {
  if (dist(50, height-50, mouseX, mouseY) < 25) {
    mode = PAUSE;
  }
}
