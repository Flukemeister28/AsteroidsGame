public class Bullet extends Floater
{
	private double myCenterX,myCenterY,myDirectionX,myDirectionY;
	public Bullet(SpaceShip neverTellMeTheOdds){
		myCenterX = neverTellMeTheOdds.getX();
		myCenterY = neverTellMeTheOdds.getY();
		myPointDirection = neverTellMeTheOdds.getPointDirection();
		double dRadians =myPointDirection*(Math.PI/180);
		myDirectionX = ((float)(6*Math.cos(dRadians)) + (float)(neverTellMeTheOdds.getDirectionX()));
		myDirectionY = ((float)(6*Math.sin(dRadians)) + (float)(neverTellMeTheOdds.getDirectionY()));
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
	public void show(){
		fill(19, 160, 31);
		noStroke();
		ellipse((float)myCenterX,(float)myCenterY,(float)5,(float)5);
	}
	public void move()
	{
		myCenterX += myDirectionX;
		myCenterY += myDirectionY;
	}
	
}