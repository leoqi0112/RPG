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
  
}
