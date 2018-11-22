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
    float a = frameCount * 0.1;
    float r = 200 + sin(frameCount * 0.02) * 100;
    float x = cos(a) * r;
    float y = sin(a) * r;
    PVector pos = new PVector(x, y, 0);
    a -= PI * 0.5;
    float xa = cos(a);
    float ya = sin(a);
    PVector dir = new PVector(xa, ya, 0);
    dir.mult(10); // 5
    particles.addParticle(pos, dir, nb, g_hue);
    pos.mult(-1);
    dir.mult(-1);
    particles.addParticle(pos, dir, nb, g_hue + 180);

    beginShape(LINES);

    strokeWeight(5.0);
    stroke(ryb(g_hue), 100, 100, 255);
    vertex(x, y);
    stroke(ryb(g_hue + 180), 100, 100, 255);
    vertex(pos.x, pos.y);

    endShape();
  }
}
