//three bg images
class Back {
  PImage img;
  float  x;
  Timer  timer;
  float  alpha;
  boolean hasArrived;
  boolean toFade;
  boolean isDone;

  Back(String path) {
    img = loadImage(path);
    x = -img.width * 0.5;
    alpha = 255;
    timer = new Timer();
  }

  void update() {
    if (isDone) return;
    if (x > width*1.5) {
      SM.loadNextScene();
      isDone = true;
    }

    hasArrived = x > width*0.5 - 1;

    if (!hasArrived) {
      x = lerp(x, width * 0.5, 0.1);
    } else {
      if (!timer.started) {
        timer.reStart();
      } else if (timer.hasPassed(IMG_SUSTAIN_TIME)) {
        x = lerp(x, width*2, 0.02);
        alpha = lerp(alpha, 0, 0.005);
      } else {
        // sustain
      }
    }
  }

  void draw() {
    if (isDone) return;
    pushStyle();
    tint(255, alpha);
    image(img, x, height * 0.5);
    popStyle();
  }
}
