class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector anchor;
  PVector sForce;
  PVector x;

  Ball() {
    anchor = new PVector (400, 400);
    pos = new PVector(600, 400);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }    

  void update() {
    visualUpdate();
    posUpdate();
    applyForce();
  }

  void visualUpdate() {    
    fill(249, 247, 232);
    strokeWeight(3);
    line(anchor.x, anchor.y, pos.x, pos.y);
    ellipse(pos.x, pos.y, 30, 30);
  }

  void posUpdate() {
    vel.mult(0.992);      // cross this line out for simple oscillator    
    vel.y += 1.2;
    pos.add(vel);
    if (mousePressed) {    
      pos.x = mouseX;
      pos.y = mouseY;
      vel.mult(0);
    }
  }

  void applyForce() {
    PVector sForce = PVector.sub(pos, anchor);
    float x = sForce.mag();
    sForce.normalize();
    sForce.mult(-1*0.01*x);
    acc.add(sForce);
    vel.add(acc);
    acc.mult(0);
  }
}
