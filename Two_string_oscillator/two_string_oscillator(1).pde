Ball b;

void setup() {
  size(800, 800);
  frameRate(60);
  b = new Ball();
}

void draw() {
  background(255);
  b.update();
}