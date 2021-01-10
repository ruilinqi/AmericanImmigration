//three dataset csv
class Migrant {
  Table     t;
  int       r;
  int       c;

  int[]     years;
  int       yearIndex;
  boolean   isDone;

  ArrayList<People> ps;

  UI        ui;

  Migrant(String path, int idx) {
    t = loadTable(path, "header");
    r = t.getRowCount();
    c = t.getColumnCount();

    TableRow header = t.getRow(0);
    years = new int[c-1];

    if (idx < 2) {
      for (int i=0; i<c-1; i++)
        years[i] = header.getInt(c-i-1);
    } else {
      for (int i=0; i<c-1; i++)
        years[i] = header.getInt(i+1);
    }

    printArray(years);

    ui = new UI(idx);

    ps = new ArrayList<People>();
    for (int i=1; i<r; i++) {
      TableRow row = t.getRow(i);
      String name = row.getString(0);
      People p = WHEREPEOPLE.get(name);
      //println("country: " + p);
      if ( p != null) {
        ps.add(p);
      }
    }
    println(ps.size());
  }

  void update() {
    if (isDone) return;

    if (frameCount % EACH_MOVE_FRAME == 0) {
      next();
    }
  }

  void next() {
    yearIndex++;

    if (yearIndex == years.length) {
      SM.loadNextScene();
      isDone = true;
      return;
    }

    float power = 0.5;
    float minNum = pow(1000, power);
    float maxNum = pow(10000000, power);

    for (int i=1; i<r; i++) {
      TableRow row = t.getRow(i);
      String name = row.getString(0);
      int num = row.getInt("" + years[yearIndex]);
      People p = WHEREPEOPLE.get(name);
      if ( p != null) {
        float n = map(pow(num, power), minNum, maxNum, 0.5, 6);
        p.move(n);
      }
    }
  }

  void draw() {
    if (isDone) return;
    fill(0, 255, 255);
    noStroke();
    for (People p : ps) {
      p.update();
      //p.draw();
    }

    ui.draw(years[yearIndex]);
  }
}
