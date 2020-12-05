class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector anchor, anchor2;
  PVector sForce;
  PVector x;
  
  Ball() {
    anchor = new PVector (500, 500);
    anchor2 = new PVector (300, 300);
    pos = new PVector(400, 400);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }    

  void update() {
    visualUpdate();
    posUpdate();
    applyForce();
  }

  void visualUpdate() {    
    if (mousePressed) {    
      pos.x = mouseX;
      pos.y = mouseY;
      vel.mult(0);
    }          
  }

  void posUpdate() {
    vel.mult(0.992);      // cross this line out for simple oscillator    
    pos.add(vel);
    fill(255, 221, 221); 
    line(anchor.x, anchor.y, pos.x, pos.y);
    line(anchor2.x, anchor2.y, pos.x, pos.y);
    ellipse(pos.x, pos.y, 30, 30); 
  }

  void applyForce() {
    PVector sForce = PVector.sub(pos, anchor).add(PVector.sub(pos, anchor2));  
    float x = sForce.mag();
    sForce.normalize();
    sForce.mult(-1*0.01*x);
    acc.add(sForce);
    vel.add(acc);
    acc.mult(0);
  }
}

void mouseReleased() {
  b.vel.x = (mouseX - pmouseX)/0.5;
  b.vel.y = (mouseY - pmouseY)/0.5;
}
