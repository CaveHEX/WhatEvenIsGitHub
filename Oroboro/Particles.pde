class Particles {

  ArrayList<Particle> ps;

  Particles() {
    ps = new ArrayList<Particle>();
  }

  void update() {
    Iterator<Particle> it = ps.iterator();
    while ( it.hasNext() ) {
      Particle p = it.next();
      p.applyForce(g_wind);
      p.update();
      if ( p.isDone() ) {
        it.remove();
      }
    }
  }

  void render() {
    for ( Particle p : ps ) {
      p.render();
    }
  }

  void run() {
    this.update();
    this.render();
  }

  void addParticle(PVector pos, PVector force, int nb, float hue) {
    for ( int i = 0; i < nb; ++i ) {
      ps.add(new Particle(pos, force, hue));
    }
  }
}
