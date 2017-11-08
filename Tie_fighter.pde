
class Tie {

  float tieX=random(width, width+5000);
  float tieY=random(height);
  //float tieX=450;
  //float tieY=141;
  float tieSpeed=-4;
  //float tieSpeed;
  float tieCollisionX=230;
  float tieCollisionY=141;
  float tieCollisionWidth=20;
  float tieCollisionHeight=82;
  //controllers
  int X=0;
  int s=1;

  float theta;
  float choose;

  Tie() {
    theta=0;
    choose=random(-1, 1);
  }

  void move() {
    tieCollisionX+=tieSpeed;
    tieX+=tieSpeed;


    ///tie fighter manouvers


    if (tieY<=-100) {  ///controller
      // tieX=random(width, width+5000);
      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      //tieCollisionY=141;
      tieY=random(height);
      //tieY=141;
      tieSpeed=random(-10, -3);  //first num was 6
      //tieSpeed=-0.5;
      choose=random(-5, 5);
    }


    if (tieY>height+100) { //controller 
      // tieX=random(width, width+5000);
      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      //tieCollisionY=141;
      tieY=random(height);
      //tieY=141;
      tieSpeed=random(-10, -3);  //first num was 6
      //tieSpeed=-0.5;
      choose=random(-5, 5);
    }

    if (tieX<=width/3.5) {
      
      tieY=(tieY+(choose)*cos(theta));
      
    }



    //Tie controller
    if (tieX<=-50) {
      // tieX=random(width, width+5000);
      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      //tieCollisionY=141;
      tieY=random(height);
      //tieY=141;
      tieSpeed=random(-10, -3);  //first num was 6
      //tieSpeed=-0.5;
      choose=random(-5, 5);
    }

    //collision with the fighter// //wings//
    if (tieX>=collisionX && tieX<=collisionX+collisionWidth && tieY>=collisionY-100 && tieY<= collisionY+collisionHeight) { //THis detects the wing span of both ships
      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      tieY=random(height);
      tieSpeed=random(-10, -3); //first num was 6
      healthPoint+=10;
      choose=random(-5, 5);
    }


    //After processing crashed on me, the collision point went wonky a bit
    //and so the normal detection that I did on first attempt
    //Does not work anymore and so I had to alter the code by using the -95 bit
    // which I do not fully understand as to why it works now and that te old version stopped
    //working
    //Collision of the triangle part of the fighter.
    if (tieX>=collisionPointX-81 && tieX<= collisionPointX && tieY>=collisionPointY-95 && tieY<=collisionPointY+10 ) {
      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      tieY=random(height);
      tieSpeed=random(-6, -3);
      healthPoint+=10;
      choose=random(-5, 5);
    }


    //collision with the players bullet //bul1 (bottom of the ship)
    if (bulX4-173+bulWidth>=tieX-20 && bulX4-173+bulWidth<=tieX+40 && bulY4+69>=tieY && bulY4+69<=tieY+tieCollisionHeight) {

      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      tieY=random(height);
      tieSpeed=random(-6, -3);
      bulX4=-100000000;
      X+=s;
      println("HIT" + X);
      scorePoint+=5;
      choose=random(-5, 5);
    }
    //bul2 (second bottom of the ship
    if (bulX3-152+bulWidth>=tieX-20 && bulX3-152+bulWidth<=tieX+40 && bulY3+59>=tieY && bulY3+59<=tieY+tieCollisionHeight) {

      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      tieY=random(height);
      tieSpeed=random(-10, -3); //first num was 6
      bulX3=-100000000;
      scorePoint+=5;
      choose=random(-5, 5);
    }
    //bul3 (second top of ship)
    if (bulX2-172+bulWidth>=tieX-20 && bulX2-172+bulWidth<=tieX+40 && bulY2-66>=tieY && bulY2-66<=tieY+tieCollisionHeight) {

      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      tieY=random(height);
      tieSpeed=random(-10, -3); //6
      bulX2=-100000000;
      scorePoint+=5;
      choose=random(-5, 5);
    }
    //bullet4 (top of the shiip)
    if (bulX-159+bulWidth>=tieX-20 && bulX-159+bulWidth<=tieX+40 && bulY-76>=tieY && bulY-76<=tieY+tieCollisionHeight) {

      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      tieY=random(height);
      tieSpeed=random(-10, -3);//6
      bulX=-100000000;
      scorePoint+=5;
      choose=random(-5, 5);
    }
  }








  void tieFighter() {
    ///Add colours!!!!
    //Tie fighter
    //rect(240, 182, 20, 120); //wing span original
    fill(255);
    stroke(0);

    beginShape(); // the wing (upper)
    fill(80);
    //stroke(255);
    vertex(tieX+20, tieY+1);//v19            int tieX=230;  int tieY=141;
    vertex(tieX+20, tieY+19);//v22
    vertex(tieX+40, tieY+19);//v7
    vertex(tieX+20, tieY+1);//v19
    endShape();

    beginShape();
    vertex(tieX+20, tieY+1);//v19
    vertex(tieX+40, tieY+19);//v7
    vertex(tieX+40, tieY+1);//v8
    vertex(tieX+40, tieY+1);//v19
    endShape();

    beginShape();
    vertex(tieX+20, tieY+1);//v19
    vertex(tieX+40, tieY+1);//v8
    vertex(tieX+40, tieY-21);//v9
    vertex(tieX+20, tieY+1);//v19
    endShape();

    beginShape();
    vertex(tieX+20, tieY+1);//v19
    vertex(tieX+40, tieY-21);//v9
    vertex(tieX-20, tieY-21);//v10
    vertex(tieX, tieY+1);//v20
    endShape();

    beginShape();
    vertex(tieX, tieY+1);//v20
    vertex(tieX-20, tieY-21);//v10
    vertex(tieX-20, tieY+1);//v11
    vertex(tieX, tieY+1);//v20
    endShape();

    beginShape();
    vertex(tieX, tieY+1);//v20
    vertex(tieX-20, tieY+1);//v11
    vertex(tieX-20, tieY+19);//v12
    vertex(tieX, tieY+1);//v20
    endShape();

    beginShape();
    vertex(tieX, tieY+1);//v20
    vertex(tieX-20, tieY+19);//v12
    vertex(tieX, tieY+19);//v21
    vertex(tieX, tieY+1);//v20
    endShape();
    //upper wing is finished////////////

    beginShape(); //lower wing
    vertex(tieX+20, tieY+81);//v26
    vertex(tieX+40, tieY+70);//v13
    vertex(tieX+20, tieY+70);//v24
    endShape();

    beginShape();
    vertex(tieX+20, tieY+81);//v26
    vertex(tieX+40, tieY+81);//v14
    vertex(tieX+40, tieY+70);//v13
    vertex(tieX+20, tieY+81);//v26
    vertex(tieX+20, tieY+62);//v25
    endShape();

    beginShape();
    vertex(tieX+20, tieY+81);//v26
    vertex(tieX+40, tieY+81);//v14
    vertex(tieX+40, tieY+99);//v15
    vertex(tieX+20, tieY+81);//v26
    endShape();

    beginShape();
    vertex(tieX+20, tieY+81);//v26
    vertex(tieX+40, tieY+99);//v15
    vertex(tieX, tieY+99);//v16

    vertex(tieX-20, tieY+99);
    vertex(tieX, tieY+81);//v25
    vertex(tieX+20, tieY+81);//v26
    endShape();

    beginShape();
    vertex(tieX+2, tieY+81);//v26
    vertex(tieX-21, tieY+81);//v17
    vertex(tieX-20, tieY+99);//v16
    vertex(tieX-1, tieY+81);//vunkown 
    endShape();

    beginShape();
    vertex(tieX, tieY+81);//v23
    vertex(tieX-21, tieY+81);//v17
    vertex(tieX-21, tieY+70);//v18
    endShape();

    beginShape();
    vertex(tieX-21, tieY+70);//v18
    vertex(tieX, tieY+70);
    vertex(tieX, tieY+81);
    vertex(tieX-21, tieY+70);

    endShape();
    //lower wing finished


    fill(150);
    //stroke(0);
    rect(tieX, tieY, tieCollisionWidth, tieCollisionHeight);//wing span use this as a collision detector //Origin point

    fill(220);
    ellipse(tieX+10, tieY+39, 40, 40); //main circle
    image(galactic, tieX+1, tieY+-19);
    ellipse(tieX+10, tieY+39, 15, 15); //middle circle


    beginShape();  //cockpit
    fill(255); //white is better//black not so much
    vertex(tieX-8, tieY+31); //v1
    vertex(tieX-5, tieY+36);//v2
    vertex(tieX-4, tieY+39);//v3
    vertex(tieX-8, tieY+47);//v4
    endShape();
  }
  /*
  so far the ties are done. The collisions, movment, everything works fine
   I'm thinking of adding some random manouvers to the tie fighters
   If they get to a certain range they would randomly pull up or down at a certain angle.
   thinking of adding this towards the end of this week.
   Two more things i would like to add are shooting back and explosions.
   Again maybe start on this towards the end of this week.
   */
}