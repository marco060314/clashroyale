class Game {
  public ArrayList<Troop> player;
  public ArrayList<Troop> comp;
  public ArrayList<Troop> c1,c2;
  public int elixir1, elixir2;
  public int cardSelected=0;
  Tower t1,t2;
  int timer=0;
  Game() {
    c1=new ArrayList<Troop>();
    c2=new ArrayList<Troop>();
    initAL(c1);
    initAL(c2);
    t1=new Tower(500-75,10);
    t2=new Tower(500-75,600);
    player=new ArrayList<Troop>();
    comp=new ArrayList<Troop>();
    player.add(t2);
    comp.add(t1);
  }
  public void initAL(ArrayList<Troop> t) {
    t.add(new Hog());
    t.add(new Pekka());
    t.add(new Knight());
    t.add(new Musk());
    t.add(new Skel());
    t.add(new Goblin());
    t.add(new Valk());
    t.add(new Giant());
  }
  public void tick() {
    if(timer%30==0){
      elixir1++;
      elixir2++;
    }
    if(timer%120==0){
      comp.add(new Knight((int)(Math.random()*800),(int) (Math.random()*300)));
    }
    background(255);
    for(int i=player.size()-1; i>=0; i--) {
      if(player.get(i).hp<=0) {
        player.remove(i);
      }
      else {
        player.get(i).move(comp);
      }
    }
    for(int i=comp.size()-1; i>=0; i--) {
      if(comp.get(i).hp<=0) {
        comp.remove(i);
      }
      else {
        comp.get(i).move(player);
      }
    }
    timer++;
  }
  public void placeCard() {
    Troop t = c1.get(cardSelected);
    if(elixir1-t.elixir<-1) {
      System.out.println("Not enough elixir!");
      return;
    }
    if(t instanceof Knight) {
        placeCard(new Knight(mouseX,Math.max(mouseY,400)));
    }
    else if(t instanceof Goblin) {
        placeCard(new Goblin(mouseX,Math.max(mouseY,400)));
        elixir1+=2;
        placeCard(new Goblin(mouseX+50,Math.max(mouseY,400)));
        elixir1+=2;
        placeCard(new Goblin(mouseX-50,Math.max(mouseY,400)));
    }
    else if(t instanceof Giant) {
        placeCard(new Giant(mouseX,Math.max(mouseY,400)));
    }
    else if(t instanceof Hog) {
        placeCard(new Hog(mouseX,Math.max(mouseY,400)));
    }
    else if(t instanceof Musk) {
        placeCard(new Musk(mouseX,Math.max(mouseY,400)));
    }
    else if(t instanceof Pekka) {
        placeCard(new Pekka(mouseX,Math.max(mouseY,400)));
    }
    else if(t instanceof Skel) {
        placeCard(new Skel(mouseX,Math.max(mouseY,400)));
        elixir1+=1;
        placeCard(new Skel(mouseX+50,Math.max(mouseY,400)));
        elixir1+=1;
        placeCard(new Skel(mouseX-50,Math.max(mouseY,400)));
    }
    else if(t instanceof Valk) {
        placeCard(new Valk(mouseX,Math.max(mouseY,400)));
    }
    c1.add(t);
    System.out.println(c1.size());
    c1=new ArrayList<Troop>(c1.subList(1,9));
    System.out.println(c1.size());
  }
  private void placeCard(Troop t) {
      t.x=mouseX;
      t.y=Math.max(400,mouseY);
      player.add(t);
      elixir1-=t.elixir;
  }
}
