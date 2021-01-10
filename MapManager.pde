import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.providers.*;
import java.util.List;

//map
class MapManager {
  UnfoldingMap map;
  DebugDisplay debugDisplay;
  List<Marker> countryMarkers;

  MapManager(PApplet P) {
    map = new UnfoldingMap(P, "map", new StamenMapProvider.TonerBackground());
    map.setBackgroundColor(0);

    debugDisplay = new DebugDisplay(P, map);

    List<Feature> countries = GeoJSONReader.loadData(P, "countries.geo.json");
    countryMarkers = MapUtils.createSimpleMarkers(countries);
    map.addMarkers(countryMarkers);

    WHEREPEOPLE = new HashMap<String, People>();

    for (Marker m : countryMarkers) {
      String countryName = "" + m.getProperties().get("name");
      Location loc = m.getLocation();
      ScreenPosition sp = map.getScreenPosition(loc);

      People p = new People();
      p.setMarker(new MyMarker(m));
      p.name = countryName;
      p.startLoc.set(sp.x, sp.y);

      WHEREPEOPLE.put(countryName, p);

      m.setColor(color(color(0, 0, 0), 0));

      //if (countryName.equals("United States of America")) {
      //  m.setColor(color(255, 0, 0));
      //}
    }

    //println(WHEREPEOPLE);
  }

  void draw() {
    pushStyle();
    imageMode(CORNER);
    noFill();
    map.draw();
    textAlign(CENTER);
    textSize(30);
    fill(255, 0, 0);
    text("US", 188, 216);
    //debugDisplay.draw();
    popStyle();
  }
}
