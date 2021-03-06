import processing.opengl.*;

class BlinkeyLight {
  float rad = 0.5;
  float x = 0;
  float y = 0;
  float z = 0;
  color c = color(1, 1, 1);

  BlinkeyLight(float x_, float y_, float z_) {
    x = x_;
    y = y_;
    z = z_;
  }

  void setColor(color c_) {
    c = c_;
  }

  void draw() {
    pushMatrix();
    translate(x, y, z);
    stroke(c);
    //scale(rad);
    //fill(c);
    //ellipse(0,0,0.5,0.5);
    point(0, 0);
    popMatrix();
  }
}

