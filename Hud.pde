class Hud {

  float x;
  float y;
  int h = 100;
  int w = 32; 

  String hudText = new String("Dome Scheiße");

  Hud(float x_, float y_, int w_, int h_) {
    x = x_;
    y = y_;
    h = h_;
    w = w_;
  }

  void setHudText(String newText) {
    hudText = newText;
  }

  void draw() {
    pCamera.beginHUD();
    noLights();
    strokeWeight(0);
    fill(255, 255, 255, 200);
    rect(10, 10, width-20, 30);
    textFont(font);
    fill(0, 0, 0);
    textAlign(CENTER);
    text(hudText, width/2-20, 32);

    fill(255, 255, 255, 100);
    rectMode(CORNER);
    rect(10, height-h-30, w+20, h+20);
    pCamera.endHUD();
  }
}

