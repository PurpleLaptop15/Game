class Obstacle
{
  float x, y, dx, dy; //1.data members = variables
  float speed = 10;
  PImage alienImage;

  Obstacle(int x, int y, PImage image)
  {
    this.x = x;
    this.y = y;
    this.dx = random(-2, 2);
    this.dy = random(-2, 2); //2. Constructor
    this.alienImage = image;


    //random colours
  }
  //3.other methods
  void display()
  {
    fill(250, 0, 0); //colour of the enemy
    image(alienImage, this.x, this.y, 100, 100);
  }
  void move()
  {
    x += dx*6;
    y += dy*6;
    // Check boundaries and reverse direction if necessary
    if (x > width || x < 0)
    {
      dx *= -1; // Reverse direction in x
    }
    if (y > height || y < 0)
    {
      dy *= -1; // Reverse direction in y
    }
  }
  void moveDown()
  {
    this.y += 1*speed;
  }
  void moveUp()
  {
    this.y -= 1*speed;
  }
  void moveRight()
  {
    this.x += 1*speed;
  }
  void moveLeft()
  {
    this.x-= 1*speed;
  }

  boolean collidesWith(Player other) {
    return dist(this.x, this.y, other.x, other.y) < 60;
  }
}
