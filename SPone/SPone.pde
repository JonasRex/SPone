Grid grid;


void setup() {
  size(951, 951);
  frame.requestFocus();
  
  grid = new Grid();
 
}

void draw() {
  grid.drawGrid();
  grid.updateGrid();
  
  grid.moveEnemy();
  
  grid.detectCollision();
  
  //grid.getDistance();

}

void keyPressed() {
  // Sends inputs to the Grid class.
  grid.keyInputPlayer();
  
  
}
