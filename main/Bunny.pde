public class Bunny {

  PVector pos;
  int bwidth;
  int bheight;
  PImage bunny;

  int jumpForce;
  int energy;

  int seeRange;
  int eatRange;
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
    this.eatRange = 20;

    bunny = loadImage("bunny.png");
    bunny.resize(this.bwidth, this.bheight);
  }

  void draw() {
    image(this.bunny, this.pos.x - this.bwidth/2, this.pos.y - this.bheight/2);
    fill(255, 0, 0);
    rect(this.pos.x, this.pos.y, map(energy, 0, 10, 0, this.bwidth), 10);
    noFill();
    //circle(this.pos.x, this.pos.y, this.seeRange*2);
    //circle(this.pos.x, this.pos.y, this.eatRange*2);
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
    if (dist(this.pos.x, this.pos.y, c.x, c.y) < this.seeRange ) {
      c.targeted = true;
      this.targetCarrot = c;
      this.carrotSeen = true;
      //print("seen");
    } else {
      c.targeted = false;

    }
  }

  void jump() {

    if (this.energy > 0 && !this.carrotSeen) {
      PVector step = PVector.random2D();
      step.setMag(this.jumpForce);
      pos.add(step);

      this.energy -= 1;
    } else if (this.energy > 0 && this.carrotSeen) {
      pos.add(this.targetCarrot.pos.sub(this.pos).setMag(this.jumpForce));
      this.energy -= 1;

      //print("Energy: " + this.energy + "\n Carrot Seen " + this.carrotSeen + "\n Vector: " + this.targetCarrot.pos.sub(this.pos).setMag(this.jumpForce) + "\n");

    }
  }
  
  void checkCollision(){
  Carrot c = this.targetCarrot;
  if(this.targetCarrot != null && dist(this.pos.x, this.pos.y, c.x, c.y) < this.eatRange ){
    this.energy += 5;
    c.respawn();
    //this.targetCarrot = null;
    print("eat");
  }
}

}
