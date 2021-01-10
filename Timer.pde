//count the time
class Timer {
  boolean started;
  int startTime;

  Timer() {
    started = false;
  }

  void reStart() {
    println("restart");
    started = true;
    startTime = millis();
  }

  boolean hasPassed(int t) {
    return (millis()-startTime) > t;
  }
}
