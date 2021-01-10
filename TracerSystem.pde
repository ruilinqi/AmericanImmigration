//manage the tracer
import tracer.*;
import tracer.paths.*;

class TracerSystem {
  PGraphics pg;
  ArrayList<Path>     paths;
  ArrayList<MyTracer> tracers;
  MyRender            render;

  TracerSystem(PGraphics pg) {
    this.pg = pg;
    paths   = new ArrayList<Path>();
    tracers = new ArrayList<MyTracer>();
    render  = new MyRender();
  }

  void addLine(PVector p1, PVector p2, float sw, int r, int g, int b) {
    Path p = new Line(new Point(p1.x, p1.y), new Point(p2.x, p2.y));
    p.setStrokeColor(color(r, g, b, 30+sw*15));
    p.setStrokeWeight(2.5);
    
    float speed = map(pow(sw, 0.2), 0.87, 1.43, MIN_SPEED, MAX_SPEED);

    MyTracer t = new MyTracer(p, 0, speed);
    render.addWeight(sw);
    render.add(t);
    tracers.add(t);
    paths.add(p);
  }

  void run() {
    render.step();
    removeArrived();
    show();
  }

  void show() {
    pg.beginDraw();
    pg.background(0, 0);
    pg.fill(0, 50);
    pg.noStroke();
    pg.rect(0, 0, width, height);
    for (Path p : paths) {
      p.draw(pg);
    }
    render.draw(pg);
    pg.endDraw();
  }

  void removeArrived() {
    for (int i=tracers.size() - 1; i>=0; i--) {
      MyTracer t = tracers.get(i);
      if (t.arrivedTimes <= 0) {
        tracers.remove(i);
        paths.remove(i);
        render.remove(t);
      }
    }
  }

  void drawSegments() {
    for (Tracer t : tracers) {
      Path p = t.getPath();
      float dist = 50 / p.getLength();
      float start = Path.remainder(t.getInput1D()-dist, 1);
      float end = t.getInput1D();
      p.draw(pg, start, end);
    }
  }
}
