import java.util.*;
Manager m;
PVector g_wind;
color g_base;
float g_hue = 120;

PShape g_shape;
PShader neon;
PFont font;

void setup() {
  size(1000, 1000, P3D);
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  //blendMode(ADD);
  m = new Manager();
  g_wind = new PVector();
  g_base = color(120, 50, 100);
  g_shape = makeShapeDiamond();
  
  neon = loadShader("data/shader/neon.glsl");
  font = createFont("data/font/lcd.ttf", 64);
}

void draw() {
  background(0);
  float amp = 0.1;
  g_wind.x = random(-amp, amp);
  g_wind.y = random(-amp, amp);
  g_wind.z = random(-amp, amp);

  float rot_x = frameCount * 0.01;
  float rot_y = frameCount * 0.008;
  float rot_z = frameCount * 0.0825;

  m.update();

  push();
  {
    lights();
    translate(width * 0.5, height * 0.5, -350);
    push();
    {
      rotateX(rot_x);
      rotateY(rot_y);
      rotateZ(rot_z);
      m.render();
    }
    pop();
    push();
    {
      rotateX(-rot_x * 0.2);
      rotateY(-rot_y * 1.2);
      rotateZ(rot_z);
      scale(1.3);
      m.render();
    }
    pop();
  }
  pop();

  g_hue += 0.3;
  
  filter(neon);
  signature();
  //record(2000);
}

void mousePressed() {
  screenshot();
}
