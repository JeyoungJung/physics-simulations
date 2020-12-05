class Ball {
  PVector[] pos;
  PVector[] vel;
  PVector[] acc;
  PVector anchor;
  PVector[] sForce;
  float[] x;
  int size = 10;                      // changes the amount of the balls 

  Ball() {      
    pos = new PVector[size];     
    vel = new PVector[size]; 
    acc = new PVector[size]; 
    anchor = new PVector (400, 400); 
    sForce = new PVector[size];  
    x = new float[size];
    for (int i=0; i<size; i++) {                         // initializes the pos, vel and acc values
      pos[i] = new PVector(random(200, 600), random(200, 600));            
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
    for (int i=0; i<size; i++) {
      fill(224-i*5, 187, 228);     
      line(anchor.x, anchor.y, pos[i].x, pos[i].y);  
      ellipse(pos[i].x, pos[i].y, 30, 30);
    }
  }

  void posUpdate() {
    for (int i=0; i<size; i++) {
      if (dist(mouseX, mouseY, pos[i].x, pos[i].y) < 30 && mousePressed) {    //allows the mouse to change the position of the ball when mouse is pressed
        pos[i].x = mouseX;
        pos[i].y = mouseY;
        vel[i].mult(0);
      }
      //vel[i].mult(0.992);      // cross this line out for simple oscillation    
      pos[i].add(vel[i]);      // adds velocity to the position
    }
  }

  void applyForce() {      
    for (int i=0; i<size; i++) {
      sForce[i] = PVector.sub(pos[i], anchor);    //finds the x and y distance between the ball position to the anchor
      x[i] = sForce[i].mag();            //x is set to the magnitude of sForce
      sForce[i].normalize();             //normalizes the vector to length 1
      sForce[i].mult(-1*random(0.001, 0.005)*x[i]);    //hooke's law   f = -kx
      acc[i].add(sForce[i]);           //the distance between the ball to the anchor is added to acceleration
      vel[i].add(acc[i]);              //accelertaion is added to the velocity
      acc[i].mult(0);                  //accleration is then set to zero to prevent it from acclerating over and over again
    }
  }
}
