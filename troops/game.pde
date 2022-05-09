class Game {
  public ArrayList<Troop> player;
  public ArrayList<Troop> comp;
  public ArrayList<Troop> c1,c2;
  public int elixir1, elixir2;
  Game() {
    c1=new ArrayList<Troop>();
    c2=new ArrayList<Troop>();
    initAL(c1);
    initAL(c2);
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
}
