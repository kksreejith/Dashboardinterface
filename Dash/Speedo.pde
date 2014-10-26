class SpeedoGauge {

  int speedogaugeX;
  int speedogaugeY;

  color n;  //NEEDLE
  color b;
  PFont letters, fast;
  
  SpeedoGauge(int speedoX, int speedoY) { 
    n = color(255);
    b = color(124,187,209);
    
    speedogaugeX=speedoX;
    speedogaugeY=speedoY;
    letters = loadFont("SegoeUI-Bold-16.vlw");
    fast = loadFont("Xperia-20.vlw");
  }
  void display(float speed) { 
    textFont(letters); 
    fill(255);
    text("km/h",speedogaugeX-225,speedogaugeY+153);
    textFont(fast); 
    fill(229);
    text("0",speedogaugeX-179,speedogaugeY+151);
    text("20",speedogaugeX-230,speedogaugeY+85);
    text("40",speedogaugeX-245,speedogaugeY+7);
    text("60",speedogaugeX-233,speedogaugeY-75);
    text("80",speedogaugeX-195,speedogaugeY-140);
    text("100",speedogaugeX-126,speedogaugeY-193);
    text("120",speedogaugeX-51,speedogaugeY-217);
    text("140",speedogaugeX+30,speedogaugeY-217);
    text("160",speedogaugeX+107,speedogaugeY-190);
    text("180",speedogaugeX+167,speedogaugeY-140);
    text("200",speedogaugeX+205,speedogaugeY-70);
    text("220",speedogaugeX+215,speedogaugeY+5);
    text("240",speedogaugeX+205,speedogaugeY+87);
    //text("260",speedogaugeX+165,speedogaugeY+160);
    //text("280",speedogaugeX+105,speedogaugeY+205);
    //text("300",speedogaugeX+25,speedogaugeY+230);
    
//    fill(242);
//    for (int speedoDash = 122; speedoDash < 152; speedoDash++) {
//      pushMatrix();
//      translate(speedogaugeX, speedogaugeY);
//      rotate(radians(speedoDash*10));
//      ellipse(205, 0, 10, 4);          //Change 205 to other values to expand 
//      popMatrix();
//    }
//    for (int raisedSpeedo=133; raisedSpeedo < 149; raisedSpeedo++) {
//      pushMatrix();
//      translate(speedogaugeX, speedogaugeY);
//      rotate(radians(raisedSpeedo *20));
//      ellipse(205, 0, 10, 7);      //Change 205 to other values to expand
//      popMatrix();
//    }
    //Needle
    pushMatrix();
    if (accActive) {
      fill(0,0,126,5);
    } 
      else {
      fill (0,126,0,5);
    }
    for (int a=1; a<10; a+=1) {
      for (int b=1; b<10; b+=1) {
        noStroke();
    arc(speedogaugeX, speedogaugeY, -335, -335, radians(-40-0.9*(a/PIE)),radians(speed-40-(b/2*PIE)));
    
      }
    }
    if(Failure) {
      fill(126,0,0,5);
    }
      
    for (int a=1; a<10; a+=1) {
      for (int b=1; b<10; b+=1) {
        noStroke();
    arc(speedogaugeX, speedogaugeY, -335, -335, radians(-40-0.9*(a/PIE)),radians(speed-40-(b/2*PIE)));
      }
    }
     
    fill(n);
    ellipse(speedogaugeX,speedogaugeY,31,31);
    fill(n);
    strokeWeight(4);
    translate(speedogaugeX,speedogaugeY);
    rotate(radians(speed));
    quad(0,0,0,-9,-127,107,9,0);
    popMatrix();
  }
}

