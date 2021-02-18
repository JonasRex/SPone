class Enemy {
  PVector enemyLocation;
  int[][] grid;
 
  Enemy(PVector enemyLocation, int[][] grid) {
    this.enemyLocation = enemyLocation;
    this.grid = grid;
    
  }
  
   void updateEnemy() {
    // Had some out of bounds issues. Kept the try/catch just in case. My mistake was under movePlayer, where i forgot to set -1 after grid.length.
    try {
      grid[(int)enemyLocation.x][(int)enemyLocation.y]=3;
    } 
    catch (ArrayIndexOutOfBoundsException e) {
    }
  }
  
  
  
}
