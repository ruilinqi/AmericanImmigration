//line
class MyTracer<T extends Path> extends Tracer {
  int arrivedTimes = 1;

  MyTracer(T path, float initInput1D, float speed1D) {
    super(path, initInput1D, speed1D);
    this.arrivedTimes = (int)map(speed1D, MIN_SPEED, MAX_SPEED, MIN_PEOPLE, MAX_PEOPLE);
  }

  float new_remainder(float num, float denom) {
    if (num >= denom) {
      arrivedTimes--;
      return 0;
    }

    if (0 <= num && num < denom) {
      return num;
    } else if (num > 0) {
      return num % denom;
    } else {
      float result = denom - ((-num) % denom);
      if (result == denom) {
        result = 0;
      }
      return result;
    }
  }

  void step() {
    input1D = new_remainder(input1D + speed1D, 1f);
    trace();
  }

  void trace() {
    float y = easing.val(input1D);
    path.trace(this, y);
  }
}
