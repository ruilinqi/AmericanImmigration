//switch scenes
class SceneManager {
  int         num;      // max scene number
  int         index;    // current scene index
  Back[]      backs;
  Migrant[]   mgrts;

  SceneManager() {
    num       = 7;
    index     = 0;
    backs = new Back[3];
    mgrts = new Migrant[3];
    for (int i=0; i<3; i++) {
      int idx = i + 1;
      backs[i] = new Back("back" + idx + ".png");
      mgrts[i] = new Migrant("timeline" + idx + ".csv", i);
    }
  }

  void updateScene(int i) {
    index = i;
  }

  void loadNextScene() {
    index = (index+1) % num;
    println("scene: " + index);
  }

  void draw() {
    if (index == 0) {
      // map
    } else {
      int i = index/2;

      if (index%2 == 1) {
        backs[i].update();
        backs[i].draw();
      } else {
        mgrts[i-1].update();
        mgrts[i-1].draw();
      }
    }
  }
}
