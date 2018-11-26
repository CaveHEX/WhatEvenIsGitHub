class Particle {

  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector acc = new PVector();

  float friction = 0.98;

  float lifeSpan = 255;
  float decay = 5.0;

  float hue;
  color c = hsbVaryS(g_base, 30);

  PVector wind;

  Particle() {
    
  }

  Particle(PVector force) {
    this.applyForce(force);
  }

  Particle(PVector pos_, PVector force, float hue_) {
    pos = pos_.copy();
    this.applyForce(force);
    c = color(ryb(hue_), saturation(g_base), brightness(g_base));
    c = hsbVaryS(c, 30);
  }

  void update() {
    wind = PVector.random3D();
    wind.mult(0.5);
    this.applyForce(wind);

    this.physics();
    lifeSpan -= decay;
    lifeSpan = (lifeSpan < 0) ? 0 : lifeSpan;
  }

  void render() {
    push();
    noStroke();
    fill(c, 80);
    translate(pos.x, pos.y, pos.z);
    rotateY(HALF_PI);
    rotateZ(PVector.angleBetween(new PVector(), vel));
    float s = map(lifeSpan, 255, 0, 0.6, 0);
    scale(s);
    shape(g_shape);
    pop();
  }

  void physics() {
    vel.add(acc);
    vel.mult(friction);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  boolean isDone() {
    return (lifeSpan == 0);
  }
}
