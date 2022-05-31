class Troop{
  public int maxHp;
  public int hp;
  public int attackdamage,attackrange;
  public int movespeed;
  public int x;
  public int IsDead;
  public int y;
  public int atkCount,atkspeed;
  public int elixir;
  HashMap<String,Integer> properties;
  public int length;
  public Troop(int x, int y,int length){
    this.x = x;
    this.y = y;
    properties=new HashMap<String,Integer>();
    properties.put("x",x);  
    properties.put("y",y);
    fill(153);
    rect(x,y,150,150);
    hp=100;
    attackdamage=1;
    movespeed=1;
    this.length=length;
  }
  public Troop(){
    properties=new HashMap<String,Integer>();
  }
  
  public Troop(Troop t){
    properties=new HashMap<String,Integer>(t.properties);
    x=properties.get("x");
    y=properties.get("y");
  }
  
  
  public double distance(int x, int y, int x1, int y1){
    int xd = x-x1;
    int yd = y - y1;
    return Math.sqrt(xd*xd + yd*yd);
    
  }
  
  public void move(ArrayList<Troop> tal){ //THIS Troop is in tal
      double dist=100000;
      int xd=0,yd=0;
      Troop s=new Troop();
      for(Troop t:tal) {
        int xDist= x-t.x;
        int yDist=y-t.y;
        if(dist>Math.sqrt(xDist*xDist+yDist*yDist)) {
          dist=Math.sqrt(xDist*xDist+yDist*yDist);
          xd=xDist;
          yd=yDist;
          s=t;
        }
      }
      if(dist==0) {
        s.hp-=attackdamage;
        return;
      }
      if(dist>movespeed) {
        double ratio = Math.min(movespeed*1.0/dist,1.0);
        x-=xd*ratio;
        y-=yd*ratio;
      }
      else {
         x-=xd;
         y-=yd;
      }
      display();
  }
  
  public void display() {
    fill(153);
    rect(x,y,length,length);
    fill(0);
    text(""+hp,x+50,y+50);
  }
  
}
