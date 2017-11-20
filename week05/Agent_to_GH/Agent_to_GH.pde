ArrayList balls;   

void setup() {
  size(720, 720);
  smooth(); 
  p5Setup();
  setupOsc();
  balls = new ArrayList();   
  for (int i = 0; i < 100; i++) {
    Vec3D startPoint = new Vec3D (random(0, width), random(0, height), 0);
    balls.add(new Ball(startPoint));
  }
}

void draw() {
  background(0);
  noFill();
  rect(100,100,520,520);
  initData();
  for (int i = 0; i < balls.size (); i++) {
    Ball mb = (Ball) balls.get(i);
    ArrayList otherBalls = getOthers(balls, mb);
    mb.run(otherBalls);
    getData(mb,i,balls.size ());
  }
  sendData();
}

ArrayList getOthers(ArrayList oldArray, Ball toRemove) {
  ArrayList otherBalls = new ArrayList();
  for (int i = 0; i < oldArray.size(); i++) {
    Ball other = (Ball) oldArray.get(i);
    if (other != toRemove) {
      otherBalls.add(balls.get(i));
    }
  }
  return otherBalls;
}