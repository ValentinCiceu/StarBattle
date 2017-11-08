

class Asteroid {

  //variables for asteroid 1
  float AsX1=width+150;
  float AsY1=200;

  //Collision variables// width
  float WCollisionA1=29;
  float WCollisionA2=29;
  float WCollisionA3=30;

  //Colision variables// height
  float HCollisionA1=34;
  float HCollisionA2=50;
  float HCollisionA3=39;

  //variables for asteroid 2
  float AsX2=width+100;
  float AsY2=260;


  //variables for asteroid 3
  float AsX3=width+120;
  float AsY3=300;

  //speed
  float asteroidSpeed1=-1;
  float asteroidSpeed2=-1;
  float asteroidSpeed3=-1;

  void moveAst() {
    //collision at thed border
    if (AsX1<=-50) {
      AsX1=random(width, width+2500);
      AsY1=random(0, height);
      asteroidSpeed1=random(-2, -1);
    }
    if (AsX2<=-50) {
      AsX2=random(width, width+2500);
      AsY2=random(0, height);
      asteroidSpeed2=random(-2, -1);
    }
    if (AsX3<=-50) {
      AsX3=random(width, width+2500);
      AsY3=random(0, height);
      asteroidSpeed3=random(-2, -1);
    }



    //collision with the ship//

    //Detection for asteroid 1 on wing
    if (AsX1-20>=collisionX && AsX1-20<=collisionX+collisionWidth && AsY1>=collisionY-35 && AsY1<= collisionY +collisionHeight) {
      AsX1=random(width, width+2500);
      AsY1=random(0, height);
      asteroidSpeed1=random(-2, -1);
      healthPoint+=10;
    }


    //Detection for asteroid 2 on wing
    if (AsX2-15>=collisionX && AsX2-15<=collisionX+collisionWidth && AsY2>=collisionY-50 && AsY2<= collisionY +collisionHeight) {
      AsX2=random(width, width+2500);
      AsY2=random(0, height);
      asteroidSpeed2=random(-2, -1);
      healthPoint+=10;
    }

    //Detection for asteroid 3 on wing
    if (AsX3-5>=collisionX && AsX3-5<=collisionX+collisionWidth && AsY3>=collisionY-40 && AsY3<= collisionY +collisionHeight) {
      AsX3=random(width, width+2500);
      AsY3=random(0, height);
      asteroidSpeed3=random(-2, -1);
      healthPoint+=10;
    }

    //Detection for asteroid 1 on front

    if (AsX1-20>=collisionPointX-81 && AsX1-20<=collisionPointX && AsY1>=collisionPointY-35 && AsY1<=collisionPointY+10) {
      AsX1=random(width, width+2500);
      AsY1=random(0, height);
      asteroidSpeed1=random(-2, -1);
      healthPoint+=10;
    }

    //Detection for asteroid 2 on front
    if (AsX2-15>=collisionPointX-81 && AsX2-15<=collisionPointX && AsY2>=collisionPointY-50 && AsY2<=collisionPointY+10) {
      AsX2=random(width, width+2500);
      AsY2=random(0, height);
      asteroidSpeed2=random(-2, -1);
      healthPoint+=10;
    }

    //Detection for asteroid 3 on front

    if (AsX3-5>=collisionPointX-81 && AsX3-5<=collisionPointX && AsY3>=collisionPointY-45 && AsY3<=collisionPointY+10) {
      AsX3=random(width, width+2500);
      AsY3=random(0, height);
      asteroidSpeed3=random(-2, -1);
      healthPoint+=10;
    }


    AsX1+=asteroidSpeed1;
    AsX2+=asteroidSpeed2;
    AsX3+=asteroidSpeed3;



    //collision with the player's bullets

    //Bullet one hits asteroid 1
    if (bulX-159+bulWidth>=AsX1-20 && bulX-159+bulWidth<= (AsX1-20)+WCollisionA1 && bulY-76>=AsY1 && bulY-76<=AsY1+HCollisionA1) {
      AsX1=random(width, width+2500);
      AsY1=random(0, height);
      asteroidSpeed1=random(-2, -1);
      bulX=-100000000;
      scorePoint+=5;
    }
    //Bullet 1 hits asteroid 2
    if (bulX-159+bulWidth>=AsX2-30 && bulX-159+bulWidth<=AsX2-15+WCollisionA2 && bulY-76>=AsY2 && bulY-76<=AsY2+HCollisionA2) { 
      AsX2=random(width, width+2500);
      AsY2=random(0, height);
      asteroidSpeed2=random(-2, -1);
      bulX=-100000000;
      scorePoint+=5;
    }
    //Bullet 1 hits asteroid 3
    if (bulX-159+bulWidth>=AsX3-20 && bulX-159+bulWidth<=AsX3-5+WCollisionA3 && bulY-76>=AsY3 && bulY-76<=AsY3+HCollisionA3) { 
      AsX3=random(width, width+2500);
      AsY3=random(0, height);
      asteroidSpeed3=random(-2, -1);
      bulX=-100000000;
      scorePoint+=5;
    }

    //bullet 2 hits asteroid 1
    if (bulX2-172+bulWidth>=AsX1-20 && bulX2-172+bulWidth<= (AsX1-20)+WCollisionA1 && bulY2-66>=AsY1 && bulY2-66<=AsY1+HCollisionA1) {
      AsX1=random(width, width+2500);
      AsY1=random(0, height);
      asteroidSpeed1=random(-2, -1);
      bulX2=-100000000;
      scorePoint+=5;
    }

    //Bullet 2 hits asteroid 2
    if (bulX2-172+bulWidth>=AsX2-30 && bulX2-172+bulWidth<=AsX2-15+WCollisionA2 && bulY2-66>=AsY2 && bulY2-66<=AsY2+HCollisionA2) { 
      AsX2=random(width, width+2500);
      AsY2=random(0, height);
      asteroidSpeed2=random(-2, -1);
      bulX2=-100000000;
      scorePoint+=5;
    }

    //Bullet2 hits asteroid 3
    if (bulX2-172+bulWidth>=AsX3-20 && bulX2-172+bulWidth<=AsX3-5+WCollisionA3 && bulY2-66>=AsY3 && bulY2-66<=AsY3+HCollisionA3) { 
      AsX3=random(width, width+2500);
      AsY3=random(0, height);
      asteroidSpeed3=random(-2, -1);
      bulX2=-100000000;
      scorePoint+=5;
    }

    //Bullet3 hits astri=oid 1
    if (bulX3-152+bulWidth>=AsX1-20 && bulX3-152+bulWidth<= (AsX1-20)+WCollisionA1 && bulY3+59>=AsY1 && bulY3+59<=AsY1+HCollisionA1) {
      AsX1=random(width, width+2500);
      AsY1=random(0, height);
      asteroidSpeed1=random(-2, -1);
      bulX3=-100000000;
      scorePoint+=5;
    }

    //Bullet 3 hits asteroid 2
    if (bulX3-152+bulWidth>=AsX2-30 && bulX3-152+bulWidth<=AsX2-15+WCollisionA2 && bulY3+59>=AsY2 && bulY3+59<=AsY2+HCollisionA2) { 
      AsX2=random(width, width+2500);
      AsY2=random(0, height);
      asteroidSpeed2=random(-2, -1);
      bulX3=-100000000;
      scorePoint+=5;
    }

    //Bullet3 hits asteroid 3
    if (bulX3-152+bulWidth>=AsX3-20 && bulX3-152+bulWidth<=AsX3-5+WCollisionA3 && bulY3+59>=AsY3 && bulY3+59<=AsY3+HCollisionA3) { 
      AsX3=random(width, width+2500);
      AsY3=random(0, height);
      asteroidSpeed3=random(-2, -1);
      bulX3=-100000000;
      scorePoint+=5;
    }

    //Bullet 4 hits asteroid 1
    if (bulX4-173+bulWidth>=AsX1-20 && bulX4-173+bulWidth<= (AsX1-20)+WCollisionA1 && bulY4+69>=AsY1 && bulY4+69<=AsY1+HCollisionA1) {
      AsX1=random(width, width+2500);
      AsY1=random(0, height);
      asteroidSpeed1=random(-2, -1);
      bulX4=-100000000;
      scorePoint+=5;
    }

    //Bullet 4 hits asteroid 2
    if (bulX4-173+bulWidth>=AsX2-30 && bulX4-173+bulWidth<=AsX2-15+WCollisionA2 && bulY4+69>=AsY2 && bulY4+69<=AsY2+HCollisionA2) { 
      AsX2=random(width, width+2500);
      AsY2=random(0, height);
      asteroidSpeed2=random(-2, -1);
      bulX4=-100000000;
      scorePoint+=5;
    }

    //Bullet4 hits asteroid 3
    if (bulX4-173+bulWidth>=AsX3-20 && bulX4-173+bulWidth<=AsX3-5+WCollisionA3 && bulY4+69>=AsY3 && bulY4+69<=AsY3+HCollisionA3) { 
      AsX3=random(width, width+2500);
      AsY3=random(0, height);
      asteroidSpeed3=random(-2, -1);
      bulX4=-100000000;
      scorePoint+=5;
    }
    //Phew!
    
  }




  void reveal() {
    fill(255);//first asteroid
    beginShape();
    vertex(AsX1, AsY1);//v1 //origin pointfloat AsX1=130;float AsY1=200;
    vertex(AsX1+10, AsY1+10);//v2
    vertex(AsX1, AsY1+20);//v3
    vertex(AsX1+10, AsY1+31);//v4
    vertex(AsX1+2, AsY1+38);//v5
    vertex(AsX1-10, AsY1+30);//v6
    vertex(AsX1-20, AsY1+25);//v7
    vertex(AsX1-20, AsY1+7);//v8
    vertex(AsX1, AsY1);//v1

    endShape();

    beginShape(); //scond asteroid
    vertex(AsX2, AsY2);//v1 //origin point float AsX2=130; float AsY2=260;
    vertex(AsX2+10, AsY2+2);// v2
    vertex(AsX2+20, AsY2+10);//v3
    vertex(AsX2+20, AsY2+20);//v4
    vertex(AsX2+10, AsY2+30);//v5
    vertex(AsX2, AsY2+40);//v6
    vertex(AsX2-10, AsY2+50);//v7
    vertex(AsX2-20, AsY2+40);//v8
    vertex(AsX2-10, AsY2+30);//v9
    vertex(AsX2-20, AsY2+20);//v10
    vertex(AsX2-20, AsY2+10);//v11
    vertex(AsX2, AsY2);//v1
    endShape();

    beginShape(); //third asteroid
    vertex(AsX3, AsY3);//v1 //origin point float AsX3=180; float AsY3=300;
    vertex(AsX3+10, AsY3);//v2
    vertex(AsX3+20, AsY3+10);//v3
    vertex(AsX3+20, AsY3+20);//v4
    vertex(AsX3+10, AsY3+40);//v5 // subject to change
    vertex(AsX3, AsY3+30);//v6
    vertex(AsX3-10, AsY3+20);//v7
    vertex(AsX3-10, AsY3+10);//v8
    vertex(AsX3, AsY3);//v1

    endShape();



    //collision square for the asteroids// Hit box's
    fill(0);
    //rect(AsX1-20, AsY1, WCollisionA1, HCollisionA1);   //asteroid 1
    //rect(AsX2-15, AsY2, WCollisionA2, HCollisionA2);   //asteroid 2
    //rect(AsX3-5, AsY3, WCollisionA3, HCollisionA3);   //asteroid 3
  }
  
  //So far the asteroid is done. The collisons works, both with the player and the bullets.
  //what i maight sp next is add a bit of colour to the asteroids. Maybe some pot holes for
  //design. Might look into some rotation as well.
  
}  