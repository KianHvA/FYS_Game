class Particle {
  PVector position;
  PVector gravity;
  PVector speed;
  float lifespan;

  Particle(PVector life) {
    gravity= new PVector(0, 0.01);
    speed = new PVector(random(-1, 0), random(-0.75, 0));
    position = life.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    speed.add(gravity);
    position.add(speed);
    lifespan -= 3;
  }

  void display() {
    stroke(150, lifespan);
    fill(150, lifespan);

    ////collision
    //if (position.y> height-45) {
    //  position.y=height-45;
    //}

    ellipse(position.x, position.y + 20, 5, 5);
  }

  boolean Dead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    if (player.moveLeft || player.moveRight) {
      if (player.hasCollision) {
        particles.add(new Particle(new PVector(player.posPlayer.x, player.posPlayer.y)));
      }
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.Dead()) {
        particles.remove(i);
      }
    }
  }
}

class sparks {
  
}
