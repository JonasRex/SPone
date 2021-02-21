class Player {
  PVector playerLocation;
  int[][] grid;
  int playerHealth;

  Player(PVector playerLocation, int[][] grid) {
    this.playerLocation = playerLocation;
    this.grid = grid;
    playerHealth = 100;
  }

  void updatePlayer() {
    // Had some out of bounds issues. Kept the try/catch just in case. My mistake was under movePlayer, where i forgot to set -1 after grid.length.
    try {
      grid[(int)playerLocation.x][(int)playerLocation.y]=1;
    } 
    catch (ArrayIndexOutOfBoundsException e) {
    }
  }

  void movePlayer() {
    if (keyCode == UP && playerLocation.y!= 0) {
      playerLocation.y -=1;
      printPlayerLocation();
    } else if (keyCode == DOWN && playerLocation.y != grid.length-1) {
      playerLocation.y +=1;
      printPlayerLocation();
    } else if (keyCode == LEFT && playerLocation.x != 0) {
      playerLocation.x -=1;
      printPlayerLocation();
    } else if (keyCode == RIGHT && playerLocation.x != grid.length-1) {
      playerLocation.x +=1;
      printPlayerLocation();
    } else {
      //println("Out of bound Or Wrong key!!!");
    }
  }

  void printPlayerLocation() {
    // Made for debugging
    //println(playerLocation);
  }

  int getPlayerHealth(int playerHealth) {
    int h = playerHealth;
    return h;
  }
}
