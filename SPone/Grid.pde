class Grid {
  Player player;
  Enemies enemies;
  Gui gui;


  // My grid is 19 x 19. center is x: 9 y: 9   OBS: Always odd numbers for this game.
  int[][]grid = new int[19][19];

  // Player always starts in the center of the grid. I choose to use PVector instead of 2 separate int variables for x and y. 
  PVector playerLocation = new PVector(grid.length/2, grid.length/2);
  PVector[]enemiesLocation = new PVector[4];

  int squareSize = width/grid.length;
  int startHealth = 100;
  int currentHealth = startHealth;


  boolean[][]occupiedTile = new boolean[19][19];


  Grid() {
    player = new Player(playerLocation, grid);
    enemies = new Enemies(enemiesLocation, grid);

    gui = new Gui(startHealth);



    // Initialize Enemies at (0, 0)
    for (int i = 0; i < enemiesLocation.length; i++) {
      enemiesLocation[i] = new PVector(0, 0);
    }
  }


  void drawGrid() {
    // Here we initialize the grid with the value zero. 
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        grid[i][j]=0;
        occupiedTile[i][j]= false;
      }
    }
    // Draws the player and enemies on the grid.
    player.updatePlayer();


    //enemy.updateEnemy();


    //placeEnemies();
    enemies.updateEnemies();

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
    case 4:
      c = (#D8A0A0);
    }

    return c;
  }

  void keyInputPlayer() {

    player.movePlayer();
  }



  void moveEnemies() {

    if (frameCount%30 == 0) {
      for (int i = 0; i < 4; i++) {
        if (playerLocation.x < enemiesLocation[i].x) {
          enemiesLocation[i].x -=(int)random(0,2);
        } else if (playerLocation.x > enemiesLocation[i].x) {
          enemiesLocation[i].x +=(int)random(0,2);
        }

        if (playerLocation.y < enemiesLocation[i].y) {
          enemiesLocation[i].y -=(int)random(0,2);
        } else if (playerLocation.y > enemiesLocation[i].y) {
          enemiesLocation[i].y +=(int)random(0,2);
        }
      }
    }
  }


  void detectCollision() {
    for (int i = 0; i < 4; i++) { 
      if (playerLocation.x-enemiesLocation[i].x == 0 && playerLocation.y-enemiesLocation[i].y == 0) {
        //println("hit");
      }
    }
  }



  void placeEnemies() {
    enemiesLocation[0]= new PVector(2, 2);
    enemiesLocation[1]= new PVector(2, 16);
    enemiesLocation[2]= new PVector(16, 2);
    enemiesLocation[3]= new PVector(16, 16);
  }


  void healthReduction() {
    for (int i = 0; i < 4; i++) {
      if (currentHealth > 0 && frameCount%1 == 0) {
        if (playerLocation.x == enemiesLocation[i].x && playerLocation.y == enemiesLocation[i].y)  
          currentHealth = currentHealth - 1;
        continue;
      }
      continue;
    }
    gui.setPlayerHealth(currentHealth);
    //println(playerLocation);
    //println(enemiesLocation[1]);
  }


  /*
  void getDistance() {
   //playerLocation.sub(enemyLocation);
   
   stroke(0);
   line(playerLocation.x*squareSize, playerLocation.y*squareSize, enemyLocation.x*squareSize, enemyLocation.y*squareSize);
   }
   */
}
