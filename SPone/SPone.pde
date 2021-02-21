Grid grid;
boolean gameOver = false;

void setup() {
  size(951, 951);
  frame.requestFocus();

  grid = new Grid();

  grid.placeEnemies();
  grid.placeFood();
}

void draw() {
  if (!gameOver) {
    grid.drawGrid();
    grid.updateGrid();


    grid.moveEnemies();
    grid.moveFood();

    grid.detectCollision();
    grid.detectFoodCollision();

    grid.healthReduction();
    isGameOver();
    
  } else if(gameOver) {
    rectMode(CENTER);
    fill(#D3CF5A);
    stroke(255);
    strokeWeight(3);
    rect(width/2, height/2, width/2, height/2);
    
    textAlign(CENTER);
    fill(0);
    textSize(50);
    text("You lost!", width/2, height/2);
    
  }
}

void keyPressed() {
  // Sends inputs to the Grid class.
  grid.keyInputPlayer();
}

void isGameOver() {
  gameOver = grid.isGameOver();
  
}
