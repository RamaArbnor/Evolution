PImage bg;
Bunny b;

ArrayList<Carrot> carrots;
ArrayList<Bunny> bunnies;

void setup() {
  size(612, 612);
  bg = loadImage("grass.jpg");
  
  //PVector pos = new PVector(width/2, height/2);
  //b = new Bunny(pos);
  
  carrots = new ArrayList<Carrot>();
  bunnies = new ArrayList<Bunny>();
  
  for (int i = 0; i < 5; i++) {
    carrots.add(new Carrot(i));
  }
  for (int i = 0; i < 2; i++) {
    PVector pos = new PVector(width/2, height/2);
    bunnies.add(new Bunny(pos));
  }

}

void draw() {
  background(bg);


  for (int i = 0; i < carrots.size(); i++) {
    carrots.get(i).draw();
    carrots.get(i).update();
    for (int j = 0; j < 2; j++) {
      bunnies.get(j).look(carrots.get(i));
    }
  }

  for (int i = 0; i < 2; i++) {
    bunnies.get(i).draw();
    bunnies.get(i).update();
  }
}

void keyPressed() {
  for (int i = 0; i < 2; i++) {
    bunnies.get(i).jump();
  }
  //b.jump();
  //print(b.carrotSeen + " ");
}
