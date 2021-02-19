class Gui {
  int startHealth;
  int healthBarWidth = 200;
  int currentHealth;

  Gui(int startHealth) {
    this.startHealth = startHealth;
  }
  void displayGui() {
    rectMode(CORNER);
    stroke(0);
    strokeWeight(2);
    fill(255);
    rect(24, 24, 201, 51);
    noStroke();
    fill(#2BFA33);
    rect(26, 26, 198, 48);
  }

  void updateGui() {
    int w = healthBarWidth/startHealth*currentHealth;

    rectMode(CORNER);
    stroke(0);
    strokeWeight(2);
    fill(255);      
    rect(24, 24, 201, 51);
    noStroke();
    if (w > healthBarWidth*0.8) {
      fill(#2BFA33); // Green
    } else if (w > healthBarWidth/4) {
      fill(#B6CE4B); // Yellow
    } else {
      fill(#CE4B4B); // Red
    }
    rect(26, 26, w-2, 48);
    //println(startHealth);
    //println(currentHealth);
  }
  void setPlayerHealth(int currentHealth) {
    this.currentHealth = currentHealth;
  }
}
