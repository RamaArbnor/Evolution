public class Bunny {

  PVector pos;
  int bwidth;
  int bheight;
  PImage bunny;

  int jumpForce;
  int energy;

  int seeRange;

  boolean carrotSeen;
  Carrot targetCarrot;

  Bunny(PVector pos) {
    this.pos = pos;
    this.bwidth = 80;
    this.bheight = 80;
    this.jumpForce = 30;

    this.energy = 10;
    this.carrotSeen = false;
    this.targetCarrot = null;
    this.seeRange = 200;

    bunny = loadImage("bunny.png");
    bunny.resize(this.bwidth, this.bheight);
  }

  void draw() {
    image(this.bunny, this.pos.x - this.bwidth/2, this.pos.y - this.bheight/2);
    //fill(255, 0, 0);
    //rect(this.pos.x, this.pos.y, map(energy, 0, 10, 0, this.bwidth), 10);
    noFill();
    circle(this.pos.x, this.pos.y, this.seeRange*2);
  }

  void update() {
      checkCollision();
    if (this.pos.x > width) {
      this.pos.x = 0;
    } else if (this.pos.x < 0) {
      this.pos.x = width - this.bwidth;
    } else if (this.pos.y < 0) {
      this.pos.y = height;
    } else if (this.pos.y > height) {
      this.pos.y = 0;
    }
  }

  void look(Carrot c) {
    if (dist(b.pos.x, b.pos.y, c.x, c.y) < b.seeRange ) {
      b.targetCarrot = c;
      b.carrotSeen = true;
      //print("seen");
    } else {
      b.targetCarrot = null;
      b.carrotSeen = false;
    }
  }

  void jump() {

    if (energy > 0 && !carrotSeen) {
      PVector step = PVector.random2D();
      step.setMag(this.jumpForce);
      pos.add(step);

      //this.energy -= 0.1;
    } else if (energy > 0 && carrotSeen) {
      pos.add(targetCarrot.pos.sub(this.pos).setMag(this.jumpForce));
    }
  }
  
  void checkCollision(){
  Carrot c = targetCarrot;
  if(targetCarrot != null && dist(b.pos.x, b.pos.y, c.x, c.y) < 20 ){
    b.energy += 5;
    c.x = (int) random(80, width - 80);
    c.y = (int) random(80, height - 80);
    
  }
}

}
