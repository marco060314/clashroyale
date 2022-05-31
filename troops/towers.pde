class Tower extends Troop {
  Tower(int x,int y) {
    super(x,y,150);
    hp=10000;
  }
  @Override
  public void move(ArrayList<Troop> t) {
    display();
  }
}
