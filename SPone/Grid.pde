class Grid {
  Player player;
  Enemy enemy;
  Gui gui;

  // My grid is 19 x 19. center is x: 9 y: 9   OBS: Always odd numbers for this game.
  int[][]grid = new int[19][19];

  // Player always starts in the center of the grid. I choose to use PVector instead of 2 separate int variables for x and y. 
  PVector playerLocation = new PVector(grid.length/2, grid.length/2);

  PVector enemyLocation = new PVector(1, 1);
  PVector collision = new PVector(0, 0);
  
  int squareSize = width/grid.length;


  Grid() {
    player = new Player(playerLocation, grid);
    enemy = new Enemy(enemyLocation, grid);
    gui = new Gui();
  }


  void drawGrid() {
    // Here we initialize the grid with the value zero.
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        grid[i][j]=0;
      }
    }
    // Draws the player and enemies on the grid.
    player.updatePlayer();
    enemy.updateEnemy();
    gui.displayGui();


    //player.movePlayer();        // Dont put it here cause it will keep looping it in the draw function, and make the player move uncontrollably.
  }

  void updateGrid() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        rectMode(CORNER);
        stroke(0);
        strokeWeight(1);
        fill(colorGrid(grid[i][j]));
        rect(i*squareSize, j*squareSize, squareSize, squareSize);
      }
    }
    //player.updatePlayer();
    //enemy.updateEnemy();
    gui.updateGui();
  }


  color colorGrid(float type) {
    // Sets the color of the tile.
    color c = 0;
    switch((int)type) {
    case 0:
      c = color(155); // Grey
      break;
    case 1:
      c = color(0, 255, 0); // Green
      break;
    case 2:
      c = color(0, 0, 255); // Blue
      break;
    case 3:
      c = color(255, 0, 0); // Red
      break;
    }

    return c;
  }

  void keyInputPlayer() {

    player.movePlayer();
  }



  void moveEnemy() {

    if (frameCount%20 == 0) {
      if (playerLocation.x < enemyLocation.x) {
        enemyLocation.x -=1;
      } else if (playerLocation.x > enemyLocation.x) {
        enemyLocation.x +=1;
      }

      if (playerLocation.y < enemyLocation.y) {
        enemyLocation.y -=1;
      } else if (playerLocation.y > enemyLocation.y) {
        enemyLocation.y +=1;
      }
    }
  }

  void detectCollision() {
    if (playerLocation.x-enemyLocation.y == 0 && playerLocation.y-enemyLocation.y == 0)  {
      println("hit");
    }
  }


  /*
  void getDistance() {
   //playerLocation.sub(enemyLocation);
   
   stroke(0);
   line(playerLocation.x*squareSize, playerLocation.y*squareSize, enemyLocation.x*squareSize, enemyLocation.y*squareSize);
   }
   */
}
