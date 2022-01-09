void pause() {
  background(black);
  image(wave, width/2, 800, 800, 550);

  //pause button
  if (dist(50, height-40, mouseX, mouseY) < 25) {
    noFill();
    noStroke();
    circle(50, height-40, 50);
    noStroke();
    fill(black);
    strokeWeight(3);
    triangle(40, height-30, 40, height-50, 60, height-40);
  } else {
    noFill();
    noStroke();
    circle(50, height-50, 50);
    stroke(black);
    strokeWeight(5);
    line(40, height-30, 40, height-50);
    line(60, height-30, 60, height-50);
  }

  //text
  fill(coral);
  textSize(60);
  text("Upgrade Options", width/2, 80);

  //Exp
  fill(white);
  textSize(40);
  text("Exp: " + myHero.xp, width/2, 140);

  //Max health
  fill(coral);
  textSize(45);
  text("MAX HP: " + myHero.hpMax, width/2+200, height/2-100);

  //Speed
  fill(white);
  textSize(45);
  text("SPEED: " + myHero.speed, width/2+200, height/2);

  //Damage
  fill(gray);
  textSize(45);
  text("Current Weapon\nDamage: " + myHero.damage, width/2+130, height/2+100);

  rectMode(CENTER);
  buttonH.show2();
  if (buttonH.clicked == true) {
    if (myHero.xp >= 5) {
      myHero.hpMax += 5;
      myHero.xp -= 5;
      for (int i = 0; i < 60; i++) {
        myParticles.add(new Particles(width/4, height/2+50));
      }
    }
  }
  buttonV.show2();
  if (buttonV.clicked && myHero.xp >= 5) {
    myHero.speed += 1;
    myHero.xp -= 5;
    for (int i = 0; i < 60; i++) {
      myParticles.add(new Particles(width/4, height/2+50));
    }
  }

  squid.show(width/4, height/2);

  int index = 0;
  while (index < myParticles.size()) {
    Particles myP = myParticles.get(index);
    myP.show();
    myP.act();
    if (myP.hp <= 0) {
      myParticles.remove(index);
    } else {
      index++;
    }
  }

  //sprite border
  noFill();
  stroke(tan);
  strokeWeight(5);
  rect(200, 420, 175, 300);
  fill(tan);
  noStroke();
  rect(120, 275, 10, 10);
  rect(280, 275, 10, 10);
  rect(120, 565, 10, 10);
  rect(280, 565, 10, 10);

  image(octopus2, width-100, 700, 300, 300);
}

void pauseClicks() {
  if (dist(50, height-50, mouseX, mouseY) < 25) {
    mode = GAME;
  }
}
