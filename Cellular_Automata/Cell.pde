class Cell {
  private boolean alive;
  private PVector pos;
  private int size;
  private int neighbours;
  
  Cell(int x, int y, int s) {
    pos = new PVector(x, y);
    size = s;
    alive = false;
  }
  
  void display(boolean playing) {
    if(playing) {stroke(255,0,0);}
    if(!playing) {stroke(0);}
    if(alive) {fill(255, 255, 0);}
    if(!alive) {fill(105, 105, 105);}
    strokeWeight(0.1);
    rect(pos.x, pos.y, size, size);
    //fill(0);
    //text(neighbours, pos.x, pos.y+size/2);
  }
  
  void update() {
    if(alive && !(neighbours == 2 || neighbours == 3)) {flip();}
    if(!alive && (neighbours == 3)) {flip();}
  }
  
  void flip() {alive = !alive;}
  void reset() {alive = false;}
  
}