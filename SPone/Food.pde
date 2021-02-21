class Food {
  int[][] grid;

  Food(int[][] grid) {
    this.grid = grid;
  }

  void updateFood(PVector[] foodLoc) {
    PVector foodLocation[] = foodLoc;
    // Had some out of bounds issues. Kept the try/catch just in case. My mistake was under movePlayer, where i forgot to set -1 after grid.length.
    try {
      for (int i = 0; i < 4; i++) {
        grid[(int)foodLocation[i].x][(int)foodLocation[i].y]=2;
      }
    }
    catch (ArrayIndexOutOfBoundsException e) {
    }
  }

  void displayFood(PVector[] foodLoc) {
    PVector foodLocation[] = foodLoc;
    foodLocation[0]= new PVector(1, 1);
    foodLocation[1]= new PVector(17, 1);
    foodLocation[2]= new PVector(1, 17);
    foodLocation[3]= new PVector(17, 17);
  }


  void moveFood(PVector pLoc, PVector[] foodLoc) {
    PVector playerLocation = pLoc;
    PVector foodLocation[] = foodLoc;

    if (frameCount%20 == 0) {
      for (int i = 0; i < 4; i++) {
        if (playerLocation.x < foodLocation[i].x && foodLocation[i].x < grid.length-1) {
          foodLocation[i].x +=(int)random(-2, 2);
        } else if (playerLocation.x > foodLocation[i].x && foodLocation[i].x >0) {
          foodLocation[i].x -=(int)random(-2, 2);
        }

        if (playerLocation.y < foodLocation[i].y && foodLocation[i].y < grid.length-1) {
          foodLocation[i].y +=(int)random(-2, 2);
        } else if (playerLocation.y > foodLocation[i].y && foodLocation[i].y >0) {
          foodLocation[i].y -= (int)random(-2, 2);
        }
      }
    }
  }
}
