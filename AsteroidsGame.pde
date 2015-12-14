
SpaceShip deucalion = new SpaceShip();
Stars [] vers = new Stars[100];
ArrayList<Rinda> rocklist = new ArrayList<Rinda>(); 
ArrayList<Inaho> slaine = new ArrayList<Inaho>();
boolean offScreen = false;
boolean loseGame= false;
String gameover = "GAME OVER";
PImage img;
String restart = "Restart";
int move = 0;
int startover=0;
String realrestart= "A/Z";
int points=0;
ArrayList<PImage> imageList= new ArrayList<PImage>();

public void setup() 
{
  size(700,700);

  for(int i =0; i<vers.length; i++)
  {
    vers[i] = new Stars();
    
  }
  for(int r =0; r<10; r++)
  {
    rocklist.add(new Rinda());
  }
 
 img=loadImage("Sad pepe New Zealand.jpg");
 img=loadImage("crithit.jpg");
 img=loadImage("finals.jpg");
 img=loadImage("honeycake.jpg");
 img=loadImage("maincharacterplz.jpg");
 img=loadImage("math.jpg");
 img=loadImage("owarino.jpg");
 img=loadImage("trashmeme.jpg");

}
public void draw() 
{ 
 background(0,0,0);
 deucalion.show();
 deucalion.move();
 for(int i =0; i<slaine.size(); i++)
 {
  slaine.get(i).move();
  slaine.get(i).show();
 }

 for(int m =0; m<vers.length; m++)
 {
  vers[m].show();
 }
 for(int n =0; n<rocklist.size(); n++)
 {
  rocklist.get(n).move();
  rocklist.get(n).show();
  for(int o =0;o<slaine.size();o++)
  {
    if(dist((float)slaine.get(o).getX(),(float)slaine.get(o).getY(),(float)rocklist.get(n).getX(),(float)rocklist.get(n).getY())<20)
    {
         rocklist.remove(n);
         slaine.remove(o);
         points++;
         break;
    }
  }
  if(dist((float)deucalion.getX(),(float)deucalion.getY(),(float)rocklist.get(n).getX(),(float)rocklist.get(n).getY())<20)
  {
    loseGame = true;
  }
  }
    for(int n =0; n<slaine.size(); n++)
    {
      if(slaine.get(n).getX()>690||slaine.get(n).getX()<10||slaine.get(n).getY()>690||slaine.get(n).getY()<10)
      {
      slaine.remove(n);
      break;
      }
    }
  if(loseGame==true)
  {
    image(img, 0, 0, 700, 700);
    fill(255,15,59);
    textSize(30);
    text(gameover,250,500);
    text(restart,move+27,550);
    fill(255,151,15);
    ellipse(50+startover,50+startover,50,50);
    text(realrestart,0+startover,0+startover,45,45);
  }
  text("Martian Kataphraktoi: "+points , 0, 0, 25, 25);
}
 public void mouseDragged()
{ 
  move=mouseX-25;
  if(move > 700 || move <0)
  {
    move=0;
  }
}
 /*public void mouseClicked()
 {
  if(move==0)
  {

  }
  if(startover==0)
  {
    loseGame==true;
  }
  else()
  {
    loseGame==false;
  }

 }
*/
 public void keyPressed()
      {

        if(keyCode == RIGHT)
        {
          deucalion.rotate(5);
        }
        if(keyCode == LEFT)
        {
          deucalion.rotate(-5);
        }
        if(keyCode== UP)
        { 
          deucalion.accelerate(0.099);
        } 
        if(key == 'v')
        {
          deucalion.setDirectionX(0);
          deucalion.setDirectionY(0);
          deucalion.setX((int)(Math.random()*670));
          deucalion.setY((int)(Math.random()*670));
          deucalion.setPointDirection((int)(Math.random()*180));
        }
        if(keyCode==DOWN)
        {
          deucalion.accelerate(-0.099);
          //deucalion.setDirectionY(0);
        }
        if(keyCode==' ')
        {
          
          slaine.add(new Inaho(deucalion));
          
        }

      }

class SpaceShip extends Floater  
{  
    public SpaceShip()
    {
      
      corners=10;
      xCorners=new int [corners];
      yCorners=new int [corners];
      int [] xC={10,-7,-1,-6,-7,-8,-7,-6,-1,-7};
      int [] yC={0,15,3,0,1,0,-1,0,-3,-15};
      xCorners=xC;
      yCorners=yC;     
      myColor=color(235,80,19);
      myDirectionX=0;
      myDirectionY=0;
      myCenterX=350;
      myCenterY=350;
      myPointDirection=0;
      
    } 
      public void setX(int x){myCenterX=x;}
      public int  getX(){return (int)myCenterX;}
      public void  setY(int y){myCenterY=y;}
      public int  getY(){return (int)myCenterY;}
      public void  setDirectionX(double x){myDirectionX=x;}
      public double  getDirectionX(){return myDirectionX;}
      public void  setDirectionY(double y){myDirectionY=y;}
      public double  getDirectionY(){return myDirectionY;}
      public void  setPointDirection(int degrees){myPointDirection=degrees;}
      public double  getPointDirection(){return myPointDirection;}
   
}
class Rinda extends Floater
{
      private int rota;
      public Rinda()
      {
       rota = (int)(Math.random()*1)-1;
       //Make the asteroid
       corners=8;
       xCorners=new int[corners];
       yCorners=new int[corners];
       int [] xC ={3,8,6,6,-1,-3,-7,-3};
       int [] yC ={6,0,-6,-10,-6,-3,-2,6};
       xCorners= xC;
       yCorners= yC;
       myColor=color(225,225,225);
       myDirectionX=(int)(Math.random()*7)-3;
       myDirectionY=(int)(Math.random()*7)-3;
       myCenterX=(int)(Math.random()*700);
       myCenterY=(int)(Math.random()*700);
       myPointDirection=0;

      }
      public void setX(int x){myCenterX=x;}
      public int  getX(){return (int)myCenterX;}
      public void  setY(int y){myCenterY=y;}
      public int  getY(){return (int)myCenterY;}
      public void  setDirectionX(double x){myDirectionX=x;}
      public double  getDirectionX(){return myDirectionX;}
      public void  setDirectionY(double y){myDirectionY=y;}
      public double  getDirectionY(){return myDirectionY;}
      public void  setPointDirection(int degrees){myPointDirection=degrees;}
      public double  getPointDirection(){return myPointDirection;}
      public void move()
      {
       rotate(rota);
       super.move();
      }
}
class Inaho extends Floater
{ 
  private int c;
  public Inaho(SpaceShip deucalion)
  {
   myPointDirection= deucalion.getPointDirection();
   double dRadians =myPointDirection*(Math.PI/180);
   myDirectionX= 5 * Math.cos(dRadians) + deucalion.getDirectionX();
   myDirectionY= 5 * Math.sin(dRadians) + deucalion.getDirectionY();
   myCenterX=deucalion.getX();
   myCenterY=deucalion.getY();
   c=color(225,0,0);
  }
  public void setX(int x){myCenterX=x;}
  public int  getX(){return (int)myCenterX;}
  public void  setY(int y){myCenterY=y;}
  public int  getY(){return (int)myCenterY;}
  public void  setDirectionX(double x){myDirectionX=x;}
  public double  getDirectionX(){return myDirectionX;}
  public void  setDirectionY(double y){myDirectionY=y;}
  public double  getDirectionY(){return myDirectionY;}
  public void  setPointDirection(int degrees){myPointDirection=degrees;}
  public double  getPointDirection(){return myPointDirection;}
  public void show()
  {
    fill(c);
    ellipse(getX(), getY(), 5, 5);
  }
  
}


class Stars 
{
  private int x, y, cA, cB, cC;
  public Stars()
  {
    x=(int)(Math.random()*700);
    y=(int)(Math.random()*700);
    cA=(int)(Math.random()*220)-27;
    cB=(int)(Math.random()*220)-34;
    cC=(int)(Math.random()*220)-10;
  }
  public void show()
  {
    stroke(cB);
    fill(cB,cA,cC);
    ellipse(x,y,1,1);
  }
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

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
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
      //System.out.println(xRotatedTranslated +", " +yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

