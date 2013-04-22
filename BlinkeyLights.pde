
class BlinkeyLights {
  ArrayList<BlinkeyLight> blinkeyLights;

  BlinkeyLights( int radius_, int strips_, int lights_per_strip_) {
    blinkeyLights = new ArrayList<BlinkeyLight>();

    radius_ = radius_ * 20;

    for (int light = lights_per_strip_ -1; light > 0; light--) {
      for (int strip = 0; strip < strips_; strip++) {  

        float azimuth     = (2*PI)*((float)strip/strips_);
        float radius = radius_ * ((float)light/lights_per_strip_);

        float x = radius/20 + radius * cos(azimuth);
        float y = radius/20 + radius * sin(azimuth);
        float z = 0;

        blinkeyLights.add(new BlinkeyLight(x, y, z));
      }
    }
  }

  int size() {
    return blinkeyLights.size();
  }

  void update(color[] imageData) {
    for (int i = 0; i < blinkeyLights.size(); i++) {
      blinkeyLights.get(i).setColor(imageData[i]);
    }
  }

  void draw() {
    stroke(255, 100, 100, 50);
    strokeWeight(1);
    noFill();

    for (int i = 0; i < blinkeyLights.size(); i++) { 
      (blinkeyLights.get(i)).draw();
    }
  }
}

