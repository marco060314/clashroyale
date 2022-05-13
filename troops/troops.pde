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
  public Troop(int x, int y){
    this.x = x;
    this.y = y;
    properties=new HashMap<String,Integer>();
    properties.put("x",x);  
    properties.put("y",y);
    fill(153);
    rect(x,y,150,150);
    hp=100;
    movespeed=10;
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
  public void setting(int dmg, int health, int eli){
    elixir = eli;
    attackdamage = dmg;
    maxHp = health;
    hp = health;
  }
  
  public void move(ArrayList<Troop> tal){ //THIS Troop is in tal
      double dist=100000;
      int xd=0,yd=0;
      Troop s;
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
      if(dist>movespeed) {
        double ratio = Math.min(movespeed*1.0/dist,1.0);
        System.out.println(dist);
        System.out.println(ratio);
        x-=xd*ratio;
        y-=yd*ratio;
        if(s instanceof Tower) {
        }
      }
      else {
         x-=xd;
         y-=yd;
      }
      System.out.println("rect("+x+","+y+", 150, 150)");
      rect(x,y,150,150);
  }
  
  public void interact(ArrayList<Troop> tal) {
    if (IsDead == 0){
      if (hp < 0){
        IsDead = 1;
        fill(365);
      }
      for(Troop t:tal) {
        if(distance(x,y,t.x,t.y)<=attackrange) {
          t.hp-=attackdamage;
          break;
        }
      }
    }
  }
  
  
  
}
