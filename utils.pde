import java.util.*;

String[] timelines = new String[]{
  "1850-1920"
  , "1920-2000"
  , "2000-2018"
};

String[] events = new String[]{
  "US immigration"
  , "US immigration"
  , "US immigration"
};

void setFont() {
  //String[] fontList = PFont.list();
  //printArray(fontList);
  //noLoop();
  PFont font = createFont("Mouse.otf", 24);
  textFont(font);
  textAlign(LEFT, TOP);
}

class CountComparator implements Comparator {
  int compare(Object o1, Object o2) {
    float int1 = ((People) o1).num;
    float int2 = ((People) o2).num;
    return (int1<int2) ? 1 : (int1==int2) ? 0 : -1;
  }
}
