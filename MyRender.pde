//render the person
import tracer.renders.Render;
import java.util.Collection;

class MyRender extends Render {
  ArrayList<Float> sws;

  MyRender() {
    super();
    setStrokeColor(color(255, 150));
    setStrokeWeight(2.5);
    sws = new ArrayList<Float>();
  }

  void addWeight(float sw) {
    sws.add(sw);
  }

  void draw(PGraphics pg) {
    style.apply(pg);
    //println(pts.size());

    for (int i = 0; i<pts.size(); i++) {
      Point p = pts.get(i);
      pg.point(p.x, p.y);
      float sw = map(sws.get(i), 0.5, 6, MIN_MAN_SIZE, MAX_MAN_SIZE);
      image(man, p.x, p.y, sw, sw);
    }
  }
}
