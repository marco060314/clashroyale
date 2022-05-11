Game g;

void settings(){
    size(1000,1000);
}
void setup() {
    background(255);
    g=new Game();
}

void draw() {  
  g.tick();
}
void keyPressed() {
  if (key==113) {
    g.cardSelected=1;
  }
  else if(key==119) {
      g.cardSelected=2;
  }
  else if(key==101) {
      g.cardSelected=3;
  }
  else if(key==114) {
      g.cardSelected=4;
  }
  
}
void mouseClicked(){
  Troop t = new Knight(mouseX, mouseY);
   g.placeCard(t);
}
