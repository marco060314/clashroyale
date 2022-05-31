class Hog extends Troop {
    public Hog(int x, int y){
      super(x,y,150);
      movespeed=3;
      attackdamage=15;
      hp=230;
      elixir=4;
    }
        public Hog() {
    }
    @Override
    public void move(ArrayList<Troop> t) {
      for(int i=0; i<t.size();i++) {
        if(t.get(i) instanceof Tower) {
            super.move(new ArrayList<Troop>(t.subList(i,i+1)));
            break;
        }
      }
    }
}
