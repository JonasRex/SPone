Grid grid;
Menu menu;
boolean gameOver = false;
boolean startScreen = true;

void setup() {
  size(951, 951);
  frame.requestFocus();

  grid = new Grid();
  menu = new Menu();

  grid.displayGrid();
}

void draw() {
  if (startScreen) {
    menu.startMessage();
    if (keyCode == ENTER && startScreen) {
      keyCode =-1;
      startScreen = false;
      gameOver = false;
      clear();
      grid.displayGrid();
      grid.drawGrid();
    }
  } else if (!gameOver && !startScreen) {
    grid.drawGrid();
    grid.updateGrid();
    isGameOver();
  } else if (gameOver && !startScreen) {
    menu.gameOverMessage(grid.endScore);
  }
}

void keyPressed() {
  // Sends inputs to the Grid class.
  grid.keyInputPlayer();
}

void isGameOver() {
  gameOver = grid.isGameOver();
}
