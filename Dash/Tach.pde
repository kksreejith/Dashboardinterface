class TachGauge {

  int tachgaugeX;
  int tachgaugeY;
  color r;
  color f;
  color n;
  int rpm = 80;
  PFont rpmfont;
  PFont numbers;
  
  TachGauge(int tachX, int tachY) { 
    r = color(0);
    f = color (0) ;
    n = color(0,91,139);
    tachgaugeX=tachX;
    tachgaugeY=tachY;
    rpmfont = loadFont("Xperia-15.vlw");
    numbers = loadFont("Xperia-15.vlw");
  }
  void display() { 
    //Gauge Rim
    // fill(r);
    // ellipse(tachgaugeX,tachgaugeY,215,215);

    //Gauge  
    // fill(f);
    // ellipse(tachgaugeX,tachgaugeY,205,205);
    textFont(rpmfont); 
    fill(255);
    text("x1000",tachgaugeX-16,tachgaugeY+45);
    text("rpm",tachgaugeX-11,tachgaugeY+30);
    
    textFont(numbers); 
    text("0",tachgaugeX-57,tachgaugeY+56);
    text("1",tachgaugeX-74,tachgaugeY+33);
    text("2",tachgaugeX-77,tachgaugeY);
    text("3",tachgaugeX-67,tachgaugeY-29);
    text("4",tachgaugeX-47,tachgaugeY-52);
    text("5",tachgaugeX-17,tachgaugeY-60);
    text("6",tachgaugeX+12,tachgaugeY-57);
    text("7",tachgaugeX+38,tachgaugeY-42);
    fill(255,0,0);
    text("8",tachgaugeX+58,tachgaugeY-22);
    text("9",tachgaugeX+65,tachgaugeY+7);
    text("10",tachgaugeX+45,tachgaugeY+37);
  
    //Dasshes
    fill(142,142,142);
    for (int dash = 99; dash < 136; dash++) {
      pushMatrix();
      translate(tachgaugeX, tachgaugeY);
      rotate(radians(dash*5));
      rect(93, 0, 3, 3);
      popMatrix();
    }
    fill(255);
    for (int raised = 135; raised < 143; raised++) {
      pushMatrix();
      translate(tachgaugeX, tachgaugeY);
      rotate(radians(raised*25));
      rect(90, 0, 5, 3);
      popMatrix();
    }
    //Red Dashes
    fill(0,91,139);
    for (int rDashes=64; rDashes < 71; rDashes++) {
      pushMatrix();
      translate(tachgaugeX, tachgaugeY);
      rotate(radians(rDashes*5));
      rect(93, 0, 3, 3);
      popMatrix();
    }
    // Raised Red Dashes
    int raisedRed = 215;
    pushMatrix();
    translate(tachgaugeX, tachgaugeY);
    rotate(radians(raisedRed*25));
    rect(90, 0, 5, 3);
    popMatrix();
    //Solid Lines
    for (int solid = 175; solid < 196; solid++) {
      pushMatrix();
      translate(tachgaugeX, tachgaugeY);
      rotate(radians(solid*2));
      rect(93, 0, 10, 4);
      popMatrix();
    } 
    //Needle
    pushMatrix();
    fill(n);
    ellipse(tachgaugeX,tachgaugeY,21,21);
    // fill(n);
    strokeWeight(4);
    translate(tachgaugeX,tachgaugeY);
    rotate(radians(rpm));
    quad(0,0,0,-9,-62,62,9,0);
    popMatrix();
  }
}
