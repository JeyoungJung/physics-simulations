class Ball {
  PVector[] pos;
  PVector[] vel;
  PVector[] acc;  
  PVector[] sForce;
  float[] x;
  PVector anchor;
  int size = 5;                      // changes the amount of the balls 

  Ball() {      
    size +=1;
    pos = new PVector[size];     
    vel = new PVector[size]; 
    acc = new PVector[size];    
    sForce = new PVector[size];  
    x = new float[size];
    anchor = new PVector (400, 100); 
    for (int i=0; i<size; i++) {                         // initializes the pos, vel and acc values
      pos[i] = new PVector(400, 150+i*500/size);            
      vel[i] = new PVector();
      acc[i] = new PVector();
    }
  }    

  void update() {
    visualUpdate();
    posUpdate();
    applyForce();
  }

  void visualUpdate() {    
    strokeWeight(3);
    for (int i=0; i<size-1; i++) {
      if (i>0) {
        line(anchor.x, anchor.y, pos[0].x, pos[0].y);
        line(pos[i].x, pos[i].y, pos[i-1].x, pos[i-1].y);
      }
    }
    for (int i=0; i<size-1; i++) {
      fill(255-i*5, 255, 207);
      ellipse(pos[i].x, pos[i].y, 30, 30); 
    }
  }

  void posUpdate() {
    for (int i=0; i<size; i++) {
      vel[i].mult(0.992);      // cross this line out for simple oscillation    
      pos[i].add(vel[i]);      // adds velocity to the position
    }
  }

  void applyForce() {      
    for (int i=0; i<size-1; i++) {
      if (i==0) {
        sForce[i] = PVector.sub(pos[i], anchor).sub(PVector.sub(pos[i+1], pos[i]));
      } else if (i>0) {
        sForce[i] = PVector.sub(pos[i], pos[i-1]).sub(PVector.sub(pos[i+1], pos[i]));
      }
      x[i] = sForce[i].mag();            //x is set to the magnitude of sForce
      sForce[i].normalize();             //normalizes the vector to length 1
      sForce[i].mult(-1*0.01*x[i]-0.02);    //hooke's law   f = -kx
      acc[i].add(sForce[i]);           //the distance between the ball to the anchor is added to acceleration
      vel[i].add(acc[i]);              //accelertaion is added to the velocity
      acc[i].mult(0);                  //accleration is then set to zero to prevent it from acclerating over and over again
    }
  }
}

void mouseDragged() {
  for (int i=0; i<b.size-1; i++) {
    if (dist(mouseX, mouseY, b.pos[i].x, b.pos[i].y) < 30) {    //allows the mouse to change the position of the ball when mouse is pressed
      b.pos[i].x = mouseX;
      b.pos[i].y = mouseY;
      b.vel[i].mult(0);
    }
  }
}