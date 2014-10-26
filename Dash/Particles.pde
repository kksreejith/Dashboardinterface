class Particles {
  PShape particles;
  int fcount, lastm;
  int fint = 3;
  float frate;
  int npartTotal;
  float factor;

  Particles(int count, float speedTemp) {
    PImage sprite;
    float partSize = 3;
    npartTotal = count;
    factor = speedTemp;
    particles = createShape(PShape.GROUP);
    sprite = loadImage("sprite.png");
    for (int n = 0; n < npartTotal; n++) {
      float cx = random(0, width);
      float cy = random(0, height); 
      float cz = random(-500, +500);

      PShape part = createShape();
      part.beginShape(QUAD);
      part.noStroke();
      part.tint(255);
      part.texture(sprite);
      part.normal(0, 0, 1);
      part.vertex(cx - partSize/2, cy - partSize/2, cz, 0, 0);
      part.vertex(cx + partSize/2, cy - partSize/2, cz, sprite.width, 0);
      part.vertex(cx + partSize/2, cy + partSize/2, cz, sprite.width, sprite.height);
      part.vertex(cx - partSize/2, cy + partSize/2, cz, 0, sprite.height);    
      part.endShape();    
      particles.addChild(part);
    }
    hint(DISABLE_DEPTH_MASK);
  }
  void update(float speed) {
    speed /= factor;
    for (int n = 0; n < npartTotal; n++) {
      PShape temp = particles.getChild(n);
      for (int i = 0; i < 4; i++) {
        PVector v = temp.getVertex(i);
        v.z += speed;
        if (v.z > 500) {
          v.z -= 500;
        }
        temp.setVertex(i, v.x, v.y, v.z);
      }
    }
    shape(particles);
    fcount += 1;
    int m = millis();
    if (m - lastm > 1000 * fint) {
      frate = float(fcount) / fint;
      fcount = 0;
      lastm = m;
      println("fps: " + frate); 
    }
  }
}
