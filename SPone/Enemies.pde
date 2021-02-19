class Enemies {
  PVector[] enemiesLocation;
  int[][] grid;
  Enemies(PVector[] enemiesLocation, int[][] grid) {
    this.enemiesLocation = enemiesLocation;
    this.grid = grid;
  }


  void updateEnemies() {
    // Had some out of bounds issues. Kept the try/catch just in case. My mistake was under movePlayer, where i forgot to set -1 after grid.length.
    try {
      for (int i = 0; i < 4; i++) {
        grid[(int)enemiesLocation[i].x][(int)enemiesLocation[i].y]=3;
      }
    }
    catch (ArrayIndexOutOfBoundsException e) {
    }
    
  }
}
