SpaceShip neverTellMeTheOdds;
Stars[] ursaMajor = new Stars[500];
Asteroids[] belt = new Asteroids[15];
public void setup() 
{
  size(500,500);
  neverTellMeTheOdds = new SpaceShip();
  for(int i = 0; i < ursaMajor.length; i++){
    ursaMajor[i] = new Stars();
  }
  for (int i = 0; i < belt.length; i++){
    belt[i] = new Asteroids();
  }
}
public void draw() 
{
  background(0);
  for (int i = 0; i < ursaMajor.length; i++)
  {
    ursaMajor[i].show();
  }
  neverTellMeTheOdds.show();
  neverTellMeTheOdds.move();
  for (int i = 0; i < belt.length; i++){
    belt[i].show();
  }
  for (int i = 0; i < belt.length; i++){
    belt[i].move();
  }
}
public class Stars
{
  private int myX,myY;
  public Stars(){
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  public void show(){
    fill(255);
    noStroke();
    ellipse(myX,myY,1,1);
  }
}
class SpaceShip extends Floater  
{   
    SpaceShip(){
      corners = 7;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = 20;
      yCorners[0] = 0;
      xCorners[1] = 15;
      yCorners[1] = -5;
      xCorners[2] = 0;
      yCorners[2] = -5;
      xCorners[3] = -10;
      yCorners[3] = -15;
      xCorners[4] = -10;
      yCorners[4] = 15;
      xCorners[5] = 0;
      yCorners[5] = 5;
      xCorners[6] = 15;
      yCorners[6] = 5;
      myColor = color(132, 80, 80);
      myCenterX = 250;
      myCenterY = 250;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    }
    public void setX(int x){myCenterX = x;}
    public void setY(int y){myCenterY = y;}
    public int getX(){return (int)myCenterX;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}   
    public double getDirectionX(){return myDirectionX;}   
    public void setDirectionY(double y){myDirectionY = y;} 
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}  
    public double getPointDirection(){return myPointDirection;}
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  public void accelerate (double dAmount)   
  {          
       
    double dRadians =myPointDirection*(Math.PI/180);       
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
public void keyPressed(){
  if (key == 'f'){
    neverTellMeTheOdds.accelerate(0.5);
  }
  if (key == 's'){
    neverTellMeTheOdds.accelerate(-0.5);
  }
  if (key == 'd'){
    neverTellMeTheOdds.setPointDirection((int)(Math.random()*360));
    neverTellMeTheOdds.setDirectionY(0);
    neverTellMeTheOdds.setDirectionX(0);
    neverTellMeTheOdds.setX((int)(Math.random()*500));
    neverTellMeTheOdds.setY((int)(Math.random()*500));
  }
  if (key == 'r'){
    neverTellMeTheOdds.rotate(8);
  }
  if (key == 'w'){
    neverTellMeTheOdds.rotate(-8);
  }
}


class Asteroids extends Floater
{
  private int mySpeed, mySize;
  public Asteroids(){
    mySpeed = (int)(Math.random()*10-5);
    mySize = (int)(Math.random()*10+1);
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 1 * mySize ;
    xCorners[1] = 2 * mySize;
    xCorners[2] = 3 * mySize;
    xCorners[3] = 5 * mySize;
    xCorners[4] = 4 * mySize;
    xCorners[5] = 5 * mySize;
    xCorners[6] = 2 * mySize;
    xCorners[7] = 0 * mySize;
    xCorners[8] = -1 * mySize;
    xCorners[9] = -1 * mySize;
    xCorners[10] = -2 * mySize;
    xCorners[11] = -2 * mySize;
    yCorners[0] = -4 * mySize;
    yCorners[1] = -3 * mySize;
    yCorners[2] = -4 * mySize;
    yCorners[3] = -2 * mySize;
    yCorners[4] = -1 * mySize;
    yCorners[5] = 1 * mySize;
    yCorners[6] = 3 * mySize;
    yCorners[7] = 1 * mySize;
    yCorners[8] = 1 * mySize;
    yCorners[9] = -1 * mySize;
    yCorners[10] = -2 * mySize;
    yCorners[11] = -4 * mySize;
    myColor = color(127);
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
    myDirectionX = (int)(Math.random()*4)-2;
    myDirectionY = (int)(Math.random()*4)-2;
    myPointDirection = (int)(Math.random()*360);
  }
    public void setX(int x){myCenterX = x;}
    public void setY(int y){myCenterY = y;}
    public int getX(){return (int)myCenterX;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}   
    public double getDirectionX(){return myDirectionX;}   
    public void setDirectionY(double y){myDirectionY = y;} 
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}  
    public double getPointDirection(){return myPointDirection;}
    public void setSize(int size){mySize = size;}
    public int getSize(){return mySize;}
    public void setColor(int mcolor){myColor = mcolor;}
    public void move(){
    rotate(mySpeed);
    super.move();
}
}