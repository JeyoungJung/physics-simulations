class Ball {
  PVector pos;
  PVector vel;
  PVector acc;

  Ball() {
    pos = new PVector(400, 0);
    vel = new PVector();
    acc = new PVector(0.98, 1.2);
  }    

  void update() {
    visualUpdate();
    posUpdate();
  }

  void visualUpdate() {
    strokeWeight(3);
  }

  void posUpdate() {   
    if (mousePressed) {    
      pos.x = mouseX;
      pos.y = mouseY;
    } else {
      vel.y+=acc.y;
      vel.x*=acc.x;
      pos.add(vel);
    }

    fill(206, 200, 228);
    ellipse(pos.x, pos.y, 70, 70); 

    if (pos.y>765) {
      pos.y = 765;
      vel.y -= (vel.y*2/1.2);
    }

    if (pos.y < 35) {
      pos.y = 35;
      vel.y -= (vel.y*2/1.2);
    }

    if (pos.x<35) {
      pos.x = 35;
      vel.x -= (vel.x*2/1.2);
    }

    if (pos.x>765) {
      pos.x = 765;
      vel.x -= (vel.x*2/1.2);
    }
  }
}

void mouseReleased() {
  if (mouseX < 0) {
    mouseX = 0;
  }
  if (mouseY > 800) {
    mouseY = 800;
  }
  b.vel.x = (mouseX - pmouseX)/0.5;
  b.vel.y = (mouseY - pmouseY)/0.5;
}
