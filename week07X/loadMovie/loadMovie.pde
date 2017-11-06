import processing.video.*;
Movie someMovieFile;

void setup(){
size(800,600);
someMovieFile = new Movie(this,"kinect-particle.mov");
someMovieFile.play();
}

void draw(){
image(someMovieFile,0,0,width,height);
}

void movieEvent(Movie m){
m.read();
}