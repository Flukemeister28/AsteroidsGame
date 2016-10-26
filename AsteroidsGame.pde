SpaceShip neverTellMeTheOdds;
Stars[] ursaMajor = new Stars[100];
public void setup() 
{
  size(1000,1000);
  neverTellMeTheOdds = new SpaceShip();
}
public void draw() 
{
  background(0);
  neverTellMeTheOdds.show();
  neverTellMeTheOdds.move();
  for (i = 0; i < ursaMajor.length; i++)
  {
    ursaMajor[i].show();
  }
}
public class Stars
{
  private int myX,myY;
  public Stars(){
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*1000);
  }
  public void show(){
    fill(255);
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
      myCenterX = 500;
      myCenterY = 500;
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
class Stars
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
    neverTellMeTheOdds.setX((int)(Math.random()*1000));
    neverTellMeTheOdds.setY((int)(Math.random()*1000));
  }
  if (key == 'r'){
    neverTellMeTheOdds.rotate(8);
  }
  if (key == 'w'){
    neverTellMeTheOdds.rotate(-8);
  }
}

