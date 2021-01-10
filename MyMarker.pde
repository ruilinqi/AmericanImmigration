//signal country
class MyMarker {
  Marker m;
  int r, g, b;
  float alpha;
  float fadeSpeed = random(2, 5);

  MyMarker(Marker m) {
    this.m = m;
  }

  void setMyColor(int r, int g, int b) {
    this.r =r;
    this.g =g;
    this.b =b;
  }

  void highlight() {
    alpha = 0;
  }

  void update() {
    alpha += fadeSpeed;
    alpha = min(255, alpha);
    //alpha = map(mouseX, 0, width, 0, 255);

    m.setColor(color(r, g, b, alpha));
    if (alpha == 255) {
      m.setColor(color(0));
    }

    //println(alpha);
  }
}
