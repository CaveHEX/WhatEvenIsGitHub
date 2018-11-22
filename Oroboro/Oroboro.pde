import java.util.*;
Manager m;
PVector g_wind;
color g_base;
float g_hue = 120;

void setup() {
  fullScreen(P3D);
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  //blendMode(ADD);
  sphereDetail(1, 2);
  m = new Manager();
  g_wind = new PVector();
  g_base = color(120, 50, 100);
}

void draw() {
  background(0);
  float amp = 0.1;
  g_wind.x = random(-amp, amp);
  g_wind.y = random(-amp, amp);
  g_wind.z = random(-amp, amp);

  push();
  lights();
  translate(width * 0.5, height * 0.5, -200);
  rotateX(frameCount * 0.012);
  rotateY(frameCount * 0.01);
  rotateZ(frameCount * 0.0075);
  m.run();
  pop();

  g_hue += 0.5;
}
