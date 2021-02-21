class Food {
  PVector[] foodLocation;
  int[][] grid;

  Food(PVector[] foodLocation, int[][] grid) {
    this.foodLocation = foodLocation;
    this.grid = grid;
  }

  void updateFood() {
    // Had some out of bounds issues. Kept the try/catch just in case. My mistake was under movePlayer, where i forgot to set -1 after grid.length.
    try {
      for (int i = 0; i < 4; i++) {
        grid[(int)foodLocation[i].x][(int)foodLocation[i].y]=2;
      }
    }
    catch (ArrayIndexOutOfBoundsException e) {
    }
  }
}
