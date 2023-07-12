class Carrot {
  
  int x;
  int y;
  PVector pos;
  PImage carrot;
  
  boolean targeted;
  int id;
  
  Carrot(int id){
    this.x = (int) random(80, width - 80);
    this.y = (int)  random(80, height - 80);
    this.targeted = false;
    this.id = id;
    carrot = loadImage("carrot.png");
    carrot.resize(40,40);
    
  }
  
  void draw(){
    //if(targeted){
    //  fill(0,255,0,150);
    //}else{
    //  fill(255,0,0,150);
    //}
      
    //circle(this.x, this.y, 20);
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
