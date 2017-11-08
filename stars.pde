
//the stars like in your christmas card
//the stars will move from right to left
class Stars {

  float starSpeed=-3;
  float starX=random(width);
  float starY=random(height);

  void starShow() {

    if (starX<=0) {

      starX=width;
      starY=random(height);
    }
    starX+=starSpeed;

    if (timer>=7000 && timer<=8000) {

      starY-=starSpeed;
    }
    if (starY> height) {
      starX=random(width);
      starY=random(height);
    }
  }



  void starDraw() {
    stroke(255);
    point(starX, starY);
  }
  
}
  //The stars are completely done