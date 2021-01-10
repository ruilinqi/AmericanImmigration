import ddf.minim.*;
import processing.sound.*;

//play audio
AudioPlayer song;
Minim       minim;

void SetupAM(PApplet app) {
  minim = new Minim(app);
  song = minim.loadFile("base.mp3");
  song.loop();
}
