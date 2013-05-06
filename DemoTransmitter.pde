class DemoTransmitter extends Thread {

  int animationStep = 0;

  color[] MakeDemoFrame() {
    int image_size = strips*lights_per_strip;

    color[] imageData = new color[image_size];

    for (int strip = 0; strip < strips; strip++) {
      for (int light =0; light < lights_per_strip; light++) {
        int loc = lights_per_strip*strip+light;

        if (animationStep == strip%4) {
          imageData[loc] = color(0,0,255);
        }
        else {
          imageData[loc] = color(0, 0, 0);
        }
      }
    }

    animationStep = (animationStep + 1)%4;

    return imageData;
  }

  DemoTransmitter() {
  }

  void run() {
    while (demoMode) {
      try {
        if (newImageQueue.size() < 1) {
          color imageData[] = MakeDemoFrame();
          newImageQueue.put(imageData);
        }
        Thread.sleep(250);
      } 
      catch( InterruptedException e ) {
        println("Interrupted Exception caught");
      }
    }
  }
}

