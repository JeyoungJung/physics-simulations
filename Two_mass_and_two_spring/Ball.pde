class Ball {
  PVector pos, pos2;
  PVector vel, vel2;
  PVector acc, acc2;
  PVector anchor, anchor2;
  PVector sForce, sForce2;
  PVector x, x2;

  Ball() {      
    pos = new PVector(400, 500);
    pos2= new PVector(400, 600);
    anchor = new PVector (400, 400);  
    vel = new PVector(0, 0);
    vel2 = new PVector(0, 0);
    acc = new PVector(0, 0);
    acc2 = new PVector(0, 0);
  }    

  void update() {
    visualUpdate();
    posUpdate();
    applyForce();
  }

  void visualUpdate() {    
    strokeWeight(3);
    line(anchor.x, anchor.y, pos.x, pos.y);
    line(pos.x, pos.y, pos2.x, pos2.y); 
    fill(249, 255, 203);     
    ellipse(pos.x, pos.y, 30, 30); 
    fill(133, 222, 119);       
    ellipse(pos2.x, pos2.y, 30, 30);
  }

  void posUpdate() {
    vel.mult(0.992);      // cross this line out for simple oscillator    
    pos.add(vel);
    vel2.mult(0.992);
    pos2.add(vel2);
    if (dist(mouseX, mouseY, pos.x, pos.y) < 100 && mousePressed) {    
      pos.x = mouseX;
      pos.y = mouseY;
      vel.mult(0);
    } else if (dist(mouseX, mouseY, pos2.x, pos2.y) < 100 && mousePressed) {    
      pos2.x = mouseX;
      pos2.y = mouseY;
      vel2.mult(0);
    }
  }

  void applyForce() {   
    PVector sForce2 = PVector.sub(pos2, pos);  
    float x2 = sForce2.mag();
    sForce2.normalize();
    sForce2.mult(-1*0.01*x2);
    acc2.add(sForce2);
    vel2.add(acc2);
    acc2.mult(0);

    PVector sForce = PVector.sub(pos, anchor).sub(PVector.sub(pos2, pos));  
    float x = sForce.mag();
    sForce.normalize();
    sForce.mult(-1*0.01*x);
    acc.add(sForce);
    vel.add(acc);
    acc.mult(0);
  }
}
