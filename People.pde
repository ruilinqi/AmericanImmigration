//
class People {
  PVector startLoc;
  PVector pos;
  String  name;
  float num;
  MyMarker m;
  int r, g, b;

  People() {
    startLoc = new PVector(0, 0);
    pos = startLoc.copy();
    color col = color(random(255), random(255), random(255));
    r = (col >> 16) & 0xFF;
    g = (col >> 8) & 0xFF;
    b = col & 0xFF;
  }

  void setMarker(MyMarker m) {
    this.m = m;
    this.m.setMyColor(r, g, b);
  }

  void update() {
    //pos = PVector.lerp(pos, AmericaLoc, 0.1);

    m.update();
  }

  void move(float num) {
    pos = startLoc.copy();
    this.num = num;
    m.highlight();
    TS.addLine(startLoc, AmericaLoc, num
      , r, g, b
      );
  }

  void draw() {
    ellipse(pos.x, pos.y, num, num);
  }
}
