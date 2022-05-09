Game g;



void setup() {
//  size(1000,1000);
}

void draw() {  
}
void keyPressed() {
  if (key==113) {
    background((int)(Math.random()*100));
    g.cardSelected=1;
  }
  else if(key==119) {
        background((int)(Math.random()*100));
            g.cardSelected=2;

  }
  else if(key==101) {
        background((int)(Math.random()*100));
            g.cardSelected=3;

  }
  else if(key==114) {
        background((int)(Math.random()*100));
            g.cardSelected=4;

  }
  
}
void mouseClicked(){
  g.placeCard(mouseX,mouseY);
}
