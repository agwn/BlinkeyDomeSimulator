
class BlinkeyLights {
  ArrayList<BlinkeyLight> blinkeyLights;

  BlinkeyLights( int r_, int w_, int h_) {
    blinkeyLights = new ArrayList<BlinkeyLight>();

    r_ = r_ * 20;

    for (int strip = 0; strip < strips; strip++) {  
      for (int light = 0; light < lights_per_strip; light++) {
        //println("l: "+light+" s: "+strip);

        float azimuth = (2*PI)*(strip/((float)strips));
        float radius  = r_ * (light/((float)lights_per_strip));
        //float azimuth = (2*PI)*((float)light/lights_per_strip);
        //float radius  = r_ *((float)strip/strips);

        float x = radius/20.0 + radius * cos(azimuth);
        float y = radius/20.0 + radius * sin(azimuth);
        //float x = radius/20.0 + radius * sin(azimuth);
        //float y = radius/20.0 + radius * cos(azimuth);
        float z = 0;

        blinkeyLights.add(new BlinkeyLight(x, y, z));
      }
    }
  }

  int size() {
    return blinkeyLights.size();
  }

  void update(color[] imageData) {
    for (int strip = 0; strip < strips; strip++) {  
      for (int light = 0; light < lights_per_strip; light++) {
        int loc = strip*lights_per_strip+light;
        //println("l: "+light+" s: "+strip);

        blinkeyLights.get(loc).setColor(imageData[loc]);
      }
    }
  }

  void draw() {
    //stroke(255, 100, 100, 1);
    strokeWeight(1);
    //noFill();

    for (int i = 0; i < blinkeyLights.size(); i++) { 
      (blinkeyLights.get(i)).draw();
    }
  }
}

