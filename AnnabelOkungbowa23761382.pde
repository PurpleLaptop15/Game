Player player; //<>//
Obstacle [] enemy;
PImage ALIEN, blue, space;

void setup() //
{
  frameRate(60);
  size(800, 800);
  blue = loadImage("blue.png");
  //blue.resize(100,100);
  imageMode(CENTER);
  player = new Player(250, 250, blue);
  player.blueImage.resize(100, 100);

  ALIEN = loadImage("A..png");
  ALIEN.resize(100, 100);
  imageMode(CENTER);
  enemy = new Obstacle[15];

  for (int i = 0; i< enemy.length; i++)
  {
    int xPos = (int) random(0, width); //enemies go random location
    int yPos = (int) random(0, height);
    enemy[i] = new Obstacle (xPos, yPos, ALIEN);
  }
}

void draw()
{
  space = loadImage("space.jpg");
  space.resize(800, 800);
  background(space);
  int s = millis();  // Values from 0 - 59
  print(s);
  
  //draw things, possibly move
  player.display();
  for (int i = 0; i< enemy.length; i++) {
    if (enemy[i] != null) {
      enemy[i].display();
      enemy[i].move();
      if (enemy[i].collidesWith(player)) // collisions?
      {
        enemy[i] = null; // delete enemy when collides with player
        print("Hit");
      }
    }
  }
}
void keyPressed()
{
  for (int i = 0; i < enemy.length; i++)
  {
    if ( enemy[i] != null ) {
      if (key == CODED) {
        if (keyCode == UP) {
          enemy[i].moveDown(); //move all obstacles down
        } else if (keyCode == RIGHT)
        {
          enemy[i].moveLeft();// move all obstacles left
        } else if (keyCode == DOWN )
        {
          enemy[i].moveUp(); //move all obstacles right
        } else if (keyCode == LEFT)
        {
          enemy[i].moveRight(); // move all obstacle right
        }
      }
    }
  }
}
