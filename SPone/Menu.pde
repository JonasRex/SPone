class Menu {

  Menu() {
  }

  void startMessage() {

    // Background with clownfish stripes 
    background(255);
    rectMode(CORNER);
    noStroke();
    for (int i = 0; i < width; i++) {
      fill(#FF6600);
      rect(i*200, 0, width/10, height);
    }

    // Center frame
    rectMode(CENTER);
    fill(255);
    stroke(0);
    strokeWeight(25);
    rect(width/2, height/2, width/2, height/2);

    // Frame with no fill
    rectMode(CORNERS);
    noFill();
    rect(0, 0, width, height);

    // Start message
    textAlign(CENTER);
    fill(0);
    textSize(90);
    text("Welcome!", width/2, height/3+20);

    textSize(30);
    text("Nemo the clownfish is hungry.", width/2, height/3+90);
    text("But so are the sharks...", width/2, height/3+130);
    text("Each piece of food yields", width/2, height/3+190);
    text("1 point. Good luck!", width/2, height/3+230);

    fill(#57D858);
    text("Press ENTER!", width/2, height/3+330);
  }

  void gameOverMessage(int score) {
    clear();
    rectMode(CENTER);
    fill(#D3CF5A);
    stroke(255);
    strokeWeight(3);
    rect(width/2, height/2, width/2, height/2);

    textAlign(CENTER);
    fill(0);
    textSize(50);
    text("You lost!", width/2, height/2-20);
    text("Score: " + score, width/2, height/2+60);
    textSize(30);
    text("Press ENTER to start again.", width/2, height/2+120);
    if (keyCode == ENTER && gameOver) {

      keyCode =-1;
      startScreen = true;
      gameOver = false;
      clear();
      setup();
    }
  }
}
