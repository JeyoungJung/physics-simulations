Ball b;

void setup() {
  size(800, 800);
  frameRate(60);
  b = new Ball();
}

void draw() {
  fill(255, 255, 255, 80);
  rect(0, 0, 800, 800, 0);
  b.update();
}