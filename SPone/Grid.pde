class Grid {
  Player player;
  Enemies enemies;
  HUD hud;
  Food food;

  // My grid is 19 x 19. center is x: 9 y: 9   OBS: Always odd numbers for this game.
  int[][]grid = new int[19][19];

  // Player always starts in the center of the grid. I choose to use PVector instead of 2 separate int variables for x and y. 
  PVector playerLocation = new PVector(grid.length/2, grid.length/2);
  PVector[]enemiesLocation = new PVector[4];
  PVector[]foodLocation = new PVector[4];

  int squareSize = width/grid.length;
  int startHealth = 100;
  int currentHealth = startHealth;
  int endScore;

  Grid() {
    player = new Player(playerLocation, grid);
    enemies = new Enemies(grid);
    food = new Food(grid);
    hud = new HUD(startHealth);

    // Initialize Enemies at (0, 0)
    for (int i = 0; i < enemiesLocation.length; i++) {
      enemiesLocation[i] = new PVector(0, 0);
      foodLocation[i] = new PVector(0, 0);
    }
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

    enemies.updateEnemies(enemiesLocation);
    food.updateFood(foodLocation);
  }

  void displayGrid() {
    // Draws the objects initial positions
    food.displayFood(foodLocation);
    enemies.displayEnemies(enemiesLocation);
    hud.displayHUD();
  }

  void updateGrid() {
    // This redraws the grid for every tick with new coord for the gameobjects.
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        rectMode(CORNER);
        stroke(0);
        strokeWeight(1);
        fill(colorGrid(grid[i][j]));
        rect(i*squareSize, j*squareSize, squareSize, squareSize);
      }
    }
    // Calls all the update and move methods for the game
    player.updatePlayer();
    enemies.updateEnemies(enemiesLocation);
    food.updateFood(foodLocation);
    hud.updateHUD();

    enemies.moveEnemies(playerLocation, enemiesLocation);
    food.moveFood(playerLocation, foodLocation);

    detectEnemiesCollision();
    detectFoodCollision();

    healthReduction();
    endScore = hud.getScore();
  }


  color colorGrid(float type) {
    // Sets the color of the tile.
    color c = 0;
    switch((int)type) {
    case 0:
      c = color(#45C9BD); // Light blue background color
      break;
    case 1:
      c = color(#FF6600); // Orange Player color 
      break;
    case 2:
      c = color(#4C953E); // Dark green food color
      break;
    case 3:
      c = color(#6C7274); // Grey Enemies
      break;
    }
    return c;
  }

  void keyInputPlayer() {
    player.movePlayer();
  }

  void detectEnemiesCollision() {
    for (int i = 0; i < 4; i++) { 
      if (playerLocation.x-enemiesLocation[i].x == 0 && playerLocation.y-enemiesLocation[i].y == 0) {
        //println("hit");
      }
    }
  }

  void detectFoodCollision() {
    for (int i = 0; i < 4; i++) { 
      if (playerLocation.x == foodLocation[i].x && playerLocation.y == foodLocation[i].y) {
        hud.increaseScore(1);
        foodLocation[i].x=(int)random(18);
        foodLocation[i].y=(int)random(18);
        if (currentHealth <= startHealth) {
          currentHealth = currentHealth + 1;
        }
      }
    }
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
    hud.setPlayerHealth(currentHealth);
  }

  boolean isGameOver() {
    boolean gameOver;
    if (hud.currentHealth <= 0) {
      gameOver = true;
      return gameOver ;
    } else {
      gameOver = false;
      return gameOver;
    }
  }
}
