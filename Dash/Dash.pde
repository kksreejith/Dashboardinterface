import hypermedia.net.*;
import java.util.*;
import java.nio.*;

import ddf.minim.*;

//// identify when the acc is activated and the warning is played
boolean accActivatedSound = false;
boolean accWarningSound = false;

/* Global parameters from UDP */
float speed = 0.0f;
boolean breakPressed = false;
boolean accActive = false;
boolean accActivePrev = false;
boolean Failure = false;
boolean FailurePrev = false;






// set up the sound variables
Minim minim;
AudioPlayer notification1;
AudioPlayer notification2;

Particles galaxy;
Static dashBackground;
//TachGauge tach;
SpeedoGauge speedo;
PImage pressBreak;
PImage exclamation;
PImage warningperipheral;

void setup() {
  size(1364, 768, P3D);
  frameRate(60);
  smooth();
  /* All Parameters */
  /* UDP */
  String ip = "localhost";
  int port = 49610;
  UDP udp;
  udp = new UDP( this, 49610);
  // udp.log( true );
  udp.listen( true );
  
  galaxy = new Particles(500, 20.0);
  dashBackground = new Static();
  // rectMode(CENTER);
  //tach = new TachGauge(150, 400);
  speedo=   new SpeedoGauge(682, 384);
  pressBreak = loadImage("accfailureBrake.png");
  exclamation = loadImage("exclamation.png");
  warningperipheral = loadImage("acc_active_peripheralRED.png");
  // initialize sound
  minim = new Minim(this);

  notification1 = minim.loadFile("notification1.mp3");
  notification2 = minim.loadFile("notification2.mp3");
}

void draw() {
  /*Particle stuff */
  background(0);
  noStroke();
  smooth();
  
  dashBackground.displayLower(accActive);
  //tach.display();
  speedo.display(speed);
  dashBackground.displayUpper(accActive);
  if (Failure && accActive) {
    image(pressBreak, (width-pressBreak.width)/2, 60);
    image(exclamation,665,405);
    image(warningperipheral,297.5,271.5);
  }
  galaxy.update(speed);

  //fill(0,91,139);
  //text("ACC", 25, 85);
  //text("WARN", 120, 125);
  
  
  //ACC Activation. Notification 1
  //Say what is supposed to happen when the 'accActivated' is played
  if (accActivatedSound == true) {
    notification1.rewind();
    notification1.play();   
    accActivatedSound = false;
  }
//  if (accActive) {
//    fill(204, 102, 0);
//  } else {
//    fill (255);
//  }
//  ellipse(50, 55, 20, 20);
  //Warning Notification. Notification 2
  //Say what is supposed to happen when the 'ACC Failure notification' is played
  if (accWarningSound == true) {
    notification2.rewind();
    notification2.play();
    accWarningSound = false;
  }
//  if (Failure) {
//    fill(204, 102, 0);
//  } else {
//    fill (255);
//  }
//  ellipse(160, 95, 25, 25);
}
void receive( byte[] data, String ip, int port ) {
  breakPressed = false;
  accActivePrev = accActive;
  FailurePrev = Failure;
  
  ByteBuffer bb = ByteBuffer.wrap(data).order(ByteOrder.nativeOrder());
  bb.rewind();
  speed = bb.getFloat();
  // println("Speed is : "+speed);
  float acc_active = bb.getFloat();
  if (acc_active != 0.0f) {
    accActive = true;
    // println("Acc active ");
  } else {
    accActive = false;
  }
  if (accActive && (!accActivePrev)) {
    accActivatedSound = true;
  }
  float break_pressed = bb.getFloat();
  if (break_pressed != 0.0f) {
    breakPressed = true;
    // println("Break Pressed");
  }
//  float failure = bb.getFloat();
//  if (failure != 0.0f) {
//    Failure = true;
    // println("Failure...ABORT!!!!");
//  } else {
//    Failure = false;
  }
//  if (Failure && (!FailurePrev) ) {
//    accWarningSound = true;
//  }
//  float condition = bb.getFloat();
//  // println("Condition : ", condition);
//}

void stop() {
  notification1.close();
  notification2.close();
  minim.stop();
  super.stop();
} 
