class Tower extends Troop {
  int midX,midY;
  Tower(int x,int y) {
    super(x,y);
  }
  @Override
  public void move(ArrayList<Troop> t) {
    fill(153);
    rect(x,y,150,150);
  }
}
