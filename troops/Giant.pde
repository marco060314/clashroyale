class Giant extends Troop {
    public Giant(int x, int y){
      super(x,y,250);
      movespeed=1;
      attackdamage=8;
      hp=1200;
      elixir=5;
    }
    public Giant() {
    }
    @Override
    public void move(ArrayList<Troop>t) {
      for(int i=0; i<t.size();i++) {
        if(t.get(i) instanceof Tower) {
            super.move(new ArrayList<Troop>(t.subList(i,i+1)));
            break;
        }
      }
    }
}
