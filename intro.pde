void intro() {
  
  background (black);
  myGIF.show();
  noStroke();

  fill(orange);
  stroke(black);
  textSize(250);
  textFont(box);
  textAlign(CENTER, CENTER);
  text ("Octopus", width/2-110, height*0.2);
  noStroke();
  fill(black);
  text ("Game", width/2+180, height*0.2);
  rectMode(CENTER);
  startButton.show();
  if (startButton.clicked) {
    mode = GAME;
  }
  
  //textbox
  stroke(azure);
  fill(black);
  strokeWeight(4);
  rect(150, 535, 300, 375);
  
  //instructions
  fill(azure);
  textSize(40);
  text("Instructions", width/4, height*0.4);
  fill(white);
  textSize(30);
  text("keys", width/4-140, height*0.5-25);
  text("1 = Normal Bubbles", width/4-50, height*0.5+25);
  text("2 = Sniper Bubbles", width/4-50, height*0.5+75);
  text("Collect Ink Sacs For\nAOE Damage, Overtime,\nYou Lose Health", width/4-50, height*0.6+125);
  
  //drop instructions
  stroke(azure);
  fill(black);
  strokeWeight(4);
  rect(300, 750, 600, 100);
  fill(azure);
  textSize(40);
  text("Drops", 360, 670);
  
  //health pod
  image(health, 50, height-50, 50,50);
  textSize(30);
  text("= +5hp", 140, height-50);
  
  //bubble
  image(bubble, 230, height-50, 50,50);
  text("= +50ammo", 330, height-50);
  
  //imk sac
  image(ink, 440, height-50, 50,50);
  text("= InkSac", 530, height-50);
}

void introClicks() {
  
}
