int numPart = 1;
Human[] Subject = new Human[101];
int bt = 10;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);

  fill(0);
  rect(0, 0, width, bt);
  rect(width - bt, 0, bt, height / 2 - bt);
  rect(width - bt, height / 2 + bt, bt, height / 2 - bt / 2);
  rect(0, height - bt, width, bt);
  rect(0, 0, bt, height / 2 - bt);
  rect(0, height / 2 + bt, bt, height / 2 - bt / 2);

  for (int i = 0; i < numPart - 10; i++) {
    Subject[i].show();
    Subject[i].move();
  }
}

void mouseClicked() {
  for (int i = 0; i < numPart; i++) {
    Subject[i] = new Human();
  }
  if (numPart < 100) {
    numPart += 10;
  }
}

class Human {
  int x, y, clr;

  Human() {
    x = (int)(Math.random() * (width - 200) + 100);
    y = (int)(Math.random() * (height - 200) + 100);
    clr = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }

  void move() {
    if (mouseX > x) {
      x += (int)(Math.random() * 8) - 2;
    } else {
      x += (int)(Math.random() * 8) - 6;
    }
    if (mouseY > y) {
      y += (int)(Math.random() * 4) - 1;
    } else {
      y += (int)(Math.random() * 4) - 3;
    }

    if (y < height / 2 - bt) {
      y = constrain(y, bt, height / 2 - bt / 4);
      x = constrain(x, bt, width - bt);
    } else if (y > height / 2 + bt) {
      y = constrain(y, height / 2 + bt, height - bt);
      x = constrain(x, bt, width - bt);
    }
    
    if(x < 10){
      x = 500;
    }
    if(x == width){
      x = 0;
    }
  }

  void show() {
    fill(clr);
    rect(x, y, 5, 10);
  }
}
