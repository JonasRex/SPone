class Enemies {
  int[][] grid;

  Enemies(int[][] grid) {
    this.grid = grid;
  }

  void updateEnemies(PVector[] eLoc) {
    PVector enemiesLocation[] = eLoc;
    // Had some out of bounds issues. Kept the try/catch just in case. My mistake was under movePlayer, where i forgot to set -1 after grid.length.
    try {
      for (int i = 0; i < 4; i++) {
        grid[(int)enemiesLocation[i].x][(int)enemiesLocation[i].y]=3;
      }
    }
    catch (ArrayIndexOutOfBoundsException e) {
    }
  }

  void displayEnemies(PVector[] eLoc) {
    PVector enemiesLocation[] = eLoc;
    enemiesLocation[0]= new PVector(2, 2);
    enemiesLocation[1]= new PVector(2, 16);
    enemiesLocation[2]= new PVector(16, 2);
    enemiesLocation[3]= new PVector(16, 16);
  }

  void moveEnemies(PVector pLoc, PVector[] eLoc) {
    PVector playerLocation = pLoc;
    PVector enemiesLocation[] = eLoc;
    if (frameCount%20 == 0) {
      for (int i = 0; i < 4; i++) {
        if (playerLocation.x < enemiesLocation[i].x) {
          enemiesLocation[i].x -=(int)random(2);
        } else if (playerLocation.x > enemiesLocation[i].x) {
          enemiesLocation[i].x +=(int)random(2);
        }
        
        if (playerLocation.y < enemiesLocation[i].y) {
          enemiesLocation[i].y -=(int)random(2);
        } else if (playerLocation.y > enemiesLocation[i].y) {
          enemiesLocation[i].y +=(int)random(2);
        }
      }
    }
  }
}
