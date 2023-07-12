PImage bg;
Bunny b;
Carrot c;

void setup() {
  size(612,612);
  bg = loadImage("grass.jpg");
  PVector pos = new PVector(width/2, height/2);
  b = new Bunny(pos);
  c = new Carrot();
  
}

void draw() {
  background(bg);
  b.draw();
  c.draw();
  
  b.update();
  c.update();

  b.look(c);
}

void keyPressed() {
  b.jump();
}
