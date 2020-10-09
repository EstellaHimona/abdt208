import processing.sound.*;

float angle;
boolean fadeout = false;
boolean fadein = false;
int pos = 1;
float b = 10.0;
float fo = 250;
float fi = 0;

void setup () {
  size (1000, 900);
  noStroke ();
  fill (0, 15, 30);
  SoundFile sound = new SoundFile (this, "The Island - Survive.mp3");
  sound.play();
  
}

void draw () {
  background (#C1BBBB);

  if (frameCount == 200) {     
    fadeout = true;
  }

  if (frameCount == 400) {
    fadein = true;
  }

  translate (width/2, height/2);
  for (float a=0; a<360; a+=22.5) {
    rotate (radians (a));
    ellipseDraw (pos);
  }
  
  fadeOut ();
  fadeIn ();


angle += 0.01;
println (frameCount);
}



void ellipseDraw (int p) {
  float x = width;
  float num = 100;
  float rad = 120;

  pushMatrix();
  for (int i=0; i<num; i++) {
    scale (0.95);
    rotate ((p)*radians (angle));
    ellipse (x, 0, rad, rad);
  }
  popMatrix();

  pushMatrix();
  for (int i=0; i<num; i++) {
    scale (0.95);
    rotate ((-p)*radians (angle));
    ellipse (x, 0, rad, rad);
  }
  popMatrix();
}

void fadeOut () {
  if (fadeout == true) {
    fill (0, 15, 30, fo);
    ellipseDraw (pos);
    fo-=0.8;
    if (fo <= 0) {
      fill (0, 15, 30);
      ellipseDraw (pos);
    }
  }
}

void fadeIn () {
  if (fadein == true) {
    fill (0, 15, 30, fi);
    ellipseDraw (pos);
    fi+=0.9;
    if (fi >= 255) {
      fill (0, 15, 30);
      ellipseDraw (pos);
    }
  }
}
