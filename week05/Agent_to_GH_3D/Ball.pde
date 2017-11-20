import toxi.geom.*;

class Ball {
  float radius = 15;
  Vec3D pos = new Vec3D(0, 0, 0); 
  Vec3D vel = new Vec3D(random(-2, 2), random(-2, 2), random(-2, 2));
  Vec3D accel = new Vec3D();
  PShape lines;
  Ball(Vec3D pos_) {
    pos = pos_;
  }
  void run() {
    update();
    bounce();
    //gravity();
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    pushStyle();
    noStroke();
    fill(255, 240);
    //-------------------display yes/no and size, cp5 toggle and slider bar----------------------  
    sphere(radius/8); //size is 1.875
    popStyle();
    popMatrix();
    //--------------------
  }

  void update() {
    vel.addSelf(accel); 
    vel.limit(2);
    pos.addSelf(vel);
  }

  void bounce() {
    //x  
    if (pos.x < -size/2) {      
      pos.x = -size/2;
      vel.x *= -2;
    } else if ( pos.x > size/2) {
      pos.x = size/2;      
      vel.x *= -2;
    }
    //y
    if (pos.y < -size/2) {
      pos.y = -size/2;
      vel.y *= -2;
    } else if (pos.y > size/2) {
      pos.y = size/2;
      vel.y *= -2;
    }
    //z
    if (pos.z < -size/2) {
      pos.z = -size/2;
      vel.z *= -2;
    } else if (pos.z > size/2) {
      pos.z = size/2;
      vel.z *= -2;
    }
  }

  void gravity() {
    vel.y += 0.2;
  }

  void lineBetween(ArrayList others) {

    for (int i = 0; i < others.size (); i ++) {
      Ball otherBall = (Ball) others.get(i); 
      float distance = pos.distanceTo(otherBall.pos);
      float disCheck = 5*radius;
      if (distance >0 && distance < disCheck) { //dis range: 0 ~ 75
        pushStyle();
        colorMode(HSB, 360, 100, 100);
        //--------------------dispaly color, cp5 slider bar 0 to 360----------------------------
        int hue = 160;
        int sat = (int)map(distance, 0, 75, 100, 30);
        int bri = (int)map(distance, 0, 75, 97, 3);
        stroke(hue, sat, bri);
        strokeWeight(0.3);
        line(pos.x, pos.y, pos.z, otherBall.pos.x, otherBall.pos.y, otherBall.pos.z);
        popStyle();
      }
    }
  }

  void flock(ArrayList others) {
    separate(separateMagnitude, others);
    cohesion(cohesionMagnitude, others);
    align(alignMagnitude, others);
    //--------------show line between yes/no, cp5 toggle---------------------
    lineBetween(others);
  }

  void separate(float magnitude, ArrayList others) {
    Vec3D _accel = new Vec3D();
    int count = 0;
    for (int i = 0; i < others.size (); i ++) {
      Ball otherBall = (Ball) others.get(i); 
      float distance = pos.distanceTo(otherBall.pos);
      if (distance > 0 && distance < 2*radius) {
        Vec3D vecBetween = pos.sub(otherBall.pos); 
        vecBetween.normalizeTo(1.0/distance);
        _accel.addSelf(vecBetween);
        count ++;
      }
    }
    if (count > 0) {
      _accel.scaleSelf(1.0/count);//control
    }
    _accel.scaleSelf(magnitude);
    accel.addSelf(_accel);
  }

  void cohesion(float magnitude, ArrayList others) {
    Vec3D sum = new Vec3D();
    int count = 0;
    for (int i = 0; i < others.size (); i ++) {
      Ball otherBall = (Ball) others.get(i); 
      float distance = pos.distanceTo(otherBall.pos);
      if (distance > 0 && distance < 8*radius) {
        sum.addSelf(otherBall.pos);
        count ++;
      }
    }
    if (count > 0) {
      sum.scaleSelf(1.0/count);
    }
    Vec3D _accel = sum.sub(pos);
    _accel.scaleSelf(magnitude);
    accel.addSelf(_accel);
  }

  void align(float magnitude, ArrayList others) {
    Vec3D _accel = new Vec3D();
    int count = 0;
    for (int i = 0; i < others.size (); i ++) {
      Ball otherBall = (Ball) others.get(i); 
      float distance = pos.distanceTo(otherBall.pos);
      if (distance > 0 && distance < 2*radius) {
        _accel.addSelf(otherBall.vel);
        count ++;
      }
    }
    if (count > 0) {
      _accel.scaleSelf(1.0/count);
    }
    _accel.scaleSelf(magnitude);
    accel.addSelf(_accel);
  }
}

//funtion to get otherBalls
ArrayList get_otherBalls(ArrayList oldArray, Ball toRemove) {
  ArrayList otherBalls = new ArrayList();
  for (int i = 0; i < oldArray.size(); i++) {
    Ball other = (Ball) oldArray.get(i);
    if (other != toRemove) {
      otherBalls.add(balls.get(i));
    }
  }
  return otherBalls;
}