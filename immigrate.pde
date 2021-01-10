/******Click once the screen after you run it.******/

/*  DATT3935 Assignment 4 Group 10 */
/*  Project: American immigration  */
final int IMG_SUSTAIN_TIME = 2000; //stay 2s for per image
final int EACH_MOVE_FRAME = 100; //100->3s

final float MIN_SPEED = 0.01;//person speed
final float MAX_SPEED = 0.1;

final int MIN_PEOPLE = 1;//person count 
final int MAX_PEOPLE = 5;

final int MIN_MAN_SIZE = 10;//person size
final int MAX_MAN_SIZE = 30;

HashMap<String, People> WHEREPEOPLE;
PVector AmericaLoc;

MapManager   MM;
SceneManager SM;
TracerSystem TS;

PGraphics tracerPG;
PImage    man;

void setup() {
  size(800, 600, P2D);
  smooth();
  background(0);
  imageMode(CENTER);
  frameRate(36);
  setFont();
  MM = new MapManager(this);
  SM = new SceneManager();

  AmericaLoc = new PVector(188, 212);
  tracerPG = createGraphics(width, height);
  TS       = new TracerSystem(tracerPG);

  man = loadImage("man.png");
  SetupAM(this);
}

void draw() {
  //background(0);
  MM.draw();
  SM.draw();
  TS.run();
  
  image(tracerPG, width*0.5, height*0.5);
  //surface.setTitle("" + frameRate);
}

void mousePressed() {
  SM.loadNextScene();
}
