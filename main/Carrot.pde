class Carrot {
  
  int x;
  int y;
  PVector pos;
  PImage carrot;
  
  Carrot(){
    this.x = (int) random(80, width - 80);
    this.y = (int)  random(80, height - 80);
    
    
    carrot = loadImage("carrot.png");
    carrot.resize(40,40);
    
  }
  
  void draw(){
    image(carrot, this.x, this.y);
    
  }
  
  void update(){
    pos = new PVector(this.x, this.y);
  }
  
  void respawn(){
    this.x = (int) random(80, width - 80);
    this.y = (int)  random(80, height - 80);
  }
  
}
