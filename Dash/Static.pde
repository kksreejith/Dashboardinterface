class Static {
  PImage img, img5;
  PImage accImg1, accImg2, accImg3;
  PImage accActive1, accActive2, accActive3,accActive4, accActive5, accInAct1, accInAct2;
  PImage innerCircleAcc, innerCircleMan;
  //PImage img10, img8, img9;
  Static() {
    img= loadImage("NormalMode_Background.png");
    accImg1 = loadImage("7okmph.png");
    accImg2 = loadImage("3sec.png");
    accImg3 = loadImage("RearCar.png");
    accActive1 = loadImage("acc_active/when_acc_active2.png");
    accActive2 = loadImage("acc_active/when_acc_active1.png");
    accActive3 = loadImage("acc_active/when_acc_active3.png");
    accActive4 = loadImage("acc_active/when_acc_active4.png");
    accActive5 = loadImage("acc_active/frontCar.png");
    accInAct1 = loadImage("acc_active/when_acc_inactive2.png");
    accInAct2 = loadImage("acc_active/when_acc_inactive1.png");
    img5= loadImage("Error!.png");
    innerCircleAcc = loadImage("innerCircle.png");
    innerCircleMan = loadImage("acc_active/manual_innerCircle.png");
    //img8= loadImage("speedlimit.png");
    //img9= loadImage("timelimit.png");
    //img10= loadImage("toparc.png");
  }
  void displayLower(boolean accActive) {
    image(img,0,0);
    if (accActive) {
      image(accActive1,510,690);
      image(accActive2,450,690);
      image(accActive4,297.5, 271.5);
      
    } else {
      image(accInAct1,510,690);
      image(accInAct2,450,690);
    }
    image(img5,575,690);
    
    //image(img8,493,295);
    //image(img9,515,205);
    //image(img10,370,40);
  }
  void displayUpper(boolean accActive) {
    
    if (accActive) {
      image(innerCircleAcc,570,270);
      image(accImg1,450,245);
      image(accImg2,662,350);
      image(accActive5,672.5,411.5);
      image(accActive3, 632.5, 390);
      image(accImg3,660,442);
    } else {
      image(innerCircleMan,570,270);
    }
  }
}
