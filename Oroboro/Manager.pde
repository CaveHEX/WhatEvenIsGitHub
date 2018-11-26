class Manager {

  Particles particles;

  Manager() {
    particles = new Particles();
  }

  void update() {
    addParticleCircle(1);

    particles.update();
  }

  void render() {
    particles.render();
  }

  void run() {
    this.update();
    this.render();
  }

  void addParticleCircle(int nb) {
    //float a = frameCount * map(mouseX, 0, width, 0.01, 0.1);
    float a = frameCount * 0.025;
    float r = 350 + sin(frameCount * 0.02) * 50 + cos(frameCount * 0.1) * 20;
    float x = cos(a) * r;
    float y = sin(a) * r;
    PVector pos = new PVector(x, y, 0);
    a -= PI * 0.5;
    float xa = cos(a);
    float ya = sin(a);
    PVector dir = new PVector(xa, ya, 0);
    //dir.mult(map(mouseY, 0, height, 20, 5)); // 5
    dir.mult(8.3); // 5
    particles.addParticle(pos, dir, nb, g_hue);
    pos.mult(-1);
    dir.mult(-1);
    particles.addParticle(pos, dir, nb, g_hue + 180);
  }
}
