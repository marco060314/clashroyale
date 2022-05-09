class Game {
  public ArrayList<Troop> player;
  public ArrayList<Troop> comp;
  public ArrayList<Troop> c1,c2;
  public int elixir1, elixir2;
  public int cardSelected=1;
  Game() {
    c1=new ArrayList<Troop>();
    c2=new ArrayList<Troop>();
    initAL(c1);
    initAL(c2);
  }
  public void initAL(ArrayList<Troop> t) {
 /*   t.add(new Hog());
    t.add(new Pekka());
    t.add(new Knight());
    t.add(new Musk());
    t.add(new Skel());
    t.add(new Goblin());
    t.add(new Valk());
    t.add(new Giant());*/
  }
  public void tick() {
    for(int i=player.size()-1; i>=0; i--) {
      if(player.get(i).hp<0) {
        player.remove(i);
      }
    }
    for(int i=comp.size()-1; i>=0; i--) {
      if(comp.get(i).hp<0) {
        comp.remove(i);
      }
    }
  }
  public void placeCard(){
    Troop t = new Troop(c1.get(cardSelected));
    t.properties.put("x",mouseX);
    t.properties.put("y",mouseY);
    player.add(t);
  }
}
