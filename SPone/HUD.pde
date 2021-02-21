class HUD {
  int startHealth;
  int healthBarWidth = 200;
  int currentHealth;

  int score = 0;

  HUD(int startHealth) {
    this.startHealth = startHealth;
  }
  void displayHUD() {
    displayHealthBar();
    displayScore();
  }

  void updateHUD() {
    updateHealthBar();
    displayScore();
  }

  void displayHealthBar() {
    rectMode(CORNER);
    stroke(0);
    strokeWeight(2);
    fill(255);
    rect(24, 24, 202, 51);
    noStroke();
    fill(0);
    rect(26, 26, 198, 48);
  }

  void displayScore() {
    rectMode(CORNER);
    stroke(0);
    strokeWeight(2);
    fill(255);
    rect(726, 26, 198, 48);

    fill(0);
    textAlign(RIGHT);
    textSize(30);
    text(score, 915, 60);
  }

  void updateHealthBar() {
    int w = healthBarWidth/startHealth*currentHealth;

    rectMode(CORNER);
    stroke(0);
    strokeWeight(2);
    fill(255);      
    rect(24, 24, 202, 51);
    noStroke();
    if (w > healthBarWidth*0.8) {
      fill(#2BFA33); // Green
    } else if (w > healthBarWidth/4) {
      fill(#B6CE4B); // Yellow
    } else {
      fill(#CE4B4B); // Red
    }
    rect(26, 26, w-1, 48);
    
    // Makes sure the frame of the healthbar stays black and om top. 
    rectMode(CORNER);
    stroke(0);
    strokeWeight(3);
    noFill();
    rect(24, 24, 202, 51);
    
  }

  void setPlayerHealth(int currentHealth) {
    this.currentHealth = currentHealth;
  }

  void increaseScore(int points) {
    score = score + points;
  }

  int getScore() {
    int s = score;
    return s;
  }
}
