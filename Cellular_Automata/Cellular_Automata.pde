Cell[][] cells;
int res = 20;
int w, h;

boolean update;

void setup() {
  size(601, 601);
  frameRate(15);

  w = floor(width/res);
  h = floor(height/res);
  cells = new Cell[w][h];
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      cells[i][j] = new Cell(i*res, j*res, res);
    }
  }
  update = false;
}

void reset() {
  update = false;
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < w; j++) {
      cells[i][j].reset();
    }
  }
}

void draw() {
  
  // drawing cells
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      cells[i][j].neighbours = countNeighbours(i,j);
      cells[i][j].display(update);
    }
  }
  // updating cells
  if(update) {
    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {
        cells[i][j].update();
      }
    }
  }
  
}

void mouseClicked() {
  int mX = floor(mouseX/res);
  int mY = floor(mouseY/res);
  if (!update) {cells[mX][mY].flip();}
}

void keyPressed() {
  if (key == ENTER) { update = !update; }
  if (key == BACKSPACE) { reset(); }
  if (key == ' ') {
    for(int i = 0; i < w; i++) {
      for(int j = 0; j < h; j++) {
        cells[i][j].update();
      }
    }
  }
}

int countNeighbours(int x, int y) {
  int n = 0;
  try {
    if(cells[x-1][y-1].alive) {n++;}
  } catch(ArrayIndexOutOfBoundsException exception) {}
  try {
    if(cells[x-1][y].alive) {n++;}
  }catch(ArrayIndexOutOfBoundsException exception) {}
  try {
    if(cells[x-1][y+1].alive) {n++;}
  }catch(ArrayIndexOutOfBoundsException exception) {}
  
  try {  
    if(cells[x][y-1].alive) {n++;}
  }catch(ArrayIndexOutOfBoundsException exception) {}
  try {
    if(cells[x][y+1].alive) {n++;}
  }catch(ArrayIndexOutOfBoundsException exception) {}
  
  try {
    if(cells[x+1][y-1].alive) {n++;}
  }catch(ArrayIndexOutOfBoundsException exception) {}
  try {
    if(cells[x+1][y].alive) {n++;}
  }catch(ArrayIndexOutOfBoundsException exception) {}
  try {
    if(cells[x+1][y+1].alive) {n++;}
  }catch(ArrayIndexOutOfBoundsException exception) {}
  
  return n;
}