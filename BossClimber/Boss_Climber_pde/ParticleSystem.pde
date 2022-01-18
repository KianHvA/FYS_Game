//Fee Fee

class Particle {
  PVector position;
  PVector gravity;
  PVector speed;
  float lifespan;
  float particleSize = 5;
  float particleColour = 150;

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

  //Draw particle
  void display() {
    stroke(particleColour, lifespan);
    fill(particleColour, lifespan);
    circle(position.x, position.y + lava.playerHeight, particleSize);
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

  //Create particles when player moves
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
