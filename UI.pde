class UI {
  String timeline;
  String event;

  UI(int i) {
    timeline = timelines[i];
    event = events[i];
  }

  void update() {
  }

  void draw(int year) {
    pushStyle();
    fill(255);
    textSize(24);
    text(timeline, 10, height - 60);
    textSize(17);
    text(event, 10, height - 30);
    textSize(20);
    text(year, width - 60, height - 36);
    popStyle();

    textSize(14);
    ArrayList<People> ps = SM.mgrts[SM.index/2 - 1].ps;

    try {
      Collections.sort(ps, new CountComparator());
    }
    catch(Exception e) {
      println("sort wrong");
    }

    int i = 0;
    pushMatrix();
    translate(250, height - 42);
    noStroke();
    float w = 110;
    float h = 20;
    for (People p : ps) {
      if (i >= 8) break;
      fill(p.r, p.g, p.b);
      float x = i%4 * w;
      float y = i/4 * h;
      ellipse(x, y, 12, 12);
      fill(240);
      text(p.name, x+12, y-5.5);
      i++;
      //println(i, p.num);
    }
    popMatrix();
  }
}
