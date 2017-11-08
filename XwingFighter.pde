void fighter() {
  //Add colours!!!!
  fill(255);
  stroke(0);
  beginShape();  //XWingFighter draw.
  //noFill();

  vertex(playerX, playerY);//v1 //point of origin (160,80)
  vertex(playerX-80, playerY-20);//v2
  vertex(playerX-130, playerY-20);//v4
  vertex(playerX-130, playerY+10);//v5
  vertex(playerX-80, playerY+10);//v3
  vertex(playerX, playerY);//v1

  endShape();
  beginShape(); //the upper wing
  ellipse(playerX-98, playerY-35, 10, 15); //the engine front (upper)
  vertex(playerX-100, playerY-20);//v10
  vertex(playerX-120, playerY-20);//v11
  vertex(playerX-120, playerY-70);//v14
  vertex(playerX-100, playerY-70);//v15///// this is the point
  vertex(playerX-100, playerY-20);//v10

  endShape();



  beginShape(); //lower wing
  ellipse(playerX-98, playerY+25, 10, 15); //the engine front(lower)
  vertex(playerX-100, playerY+10);//v7
  vertex(playerX-120, playerY+10);//v6
  vertex(playerX-120, playerY+60);//v8
  vertex(playerX-100, playerY+60);//v9//////// this is the point
  vertex(playerX-100, playerY+10);//v7 
  endShape();

  stroke(175);
  line(playerX-110, playerY-75, playerX-40, playerY-75); //gun barrel 1
  line(playerX-45, playerY-75, playerX-38, playerY-68);  //pointers
  line(playerX-45, playerY-75, playerX-38, playerY-80); //pointers

  line(playerX-110, playerY-65, playerX-50, playerY-65); // gun barrel 2
  line(playerX-60, playerY-65, playerX-50, playerY-60);//pointers
  line(playerX-60, playerY-65, playerX-50, playerY-70);//pointers

  line(playerX-110, playerY+60, playerX-40, playerY+60);//gun barrel 3
  line(playerX-45, playerY+60, playerX-40, playerY+55); // pointers
  line(playerX-45, playerY+60, playerX-40, playerY+65); // pointers

  line(playerX-110, playerY+70, playerX-45, playerY+70);//gun barrel 4
  line(playerX-55, playerY+70, playerX-48, playerY+65);// pointers 
  line(playerX-55, playerY+70, playerX-48, playerY+75); //pointers
  //stroke(0);
  stroke(0);

  ellipse(playerX-110, playerY-70, 40, 15);  ////this is the hit point upper
  ellipse(playerX-110, playerY+65, 40, 15); ////this is the hit point lower
  beginShape();//engine upper
  vertex(playerX-100, playerY-42); //v17
  vertex(playerX-120, playerY-40);//v18
  vertex(playerX-135, playerY-35);//v19
  vertex(playerX-120, playerY-30);//v20
  vertex(playerX-100, playerY-29);//v21

  endShape();

  beginShape(); //engine 2
  vertex(playerX-100, playerY+18);//v22
  vertex(playerX-120, playerY+20);//v23
  vertex(playerX-135, playerY+25);//v24
  vertex(playerX-120, playerY+30);//v25
  vertex(playerX-100, playerY+32);//v26

  endShape();
  /////////////////////////////////////////////
  beginShape(); //window// flight desk
  vertex(playerX-82, playerY-11);//v12
  vertex(playerX-63, playerY-6);//v14
  vertex(playerX-62, playerY-6);//v14
  vertex(playerX-60, playerY-1);//v14
  vertex(playerX-86, playerY+4);// newv1
  vertex(playerX-83, playerY-11);

  endShape();



  //decorations
  image(republic, playerX+-118, playerY+33);
  image(republic, playerX+-119, playerY+-58);

  fill(124);

  rect(playerX+-129, playerY+-10, 39, 10);
  fill(0);
  rect(playerX+-132, playerY+-7, 49, 3);

  fill(255, 0, 0);

  rect(playerX+-112, playerY+49, 11, 7);
  rect(playerX+-112, playerY+-63, 11, 7);

  stroke(255, 0, 0);

  line(playerX+-80, playerY+-16, playerX+-28, playerY+-3);
  line(playerX+-80, playerY+7, playerX+-28, playerY+1);
  line(playerX+-114, playerY+-52, playerX+-112, playerY+-57);
  line(playerX+-112, playerY+48, playerX+-114, playerY+42);

  stroke(0);

  ellipse(playerX+-88, playerY+-5, 10, 10);


  color newFire=lerpColor(fire, fire2, fireChange);

  
  fireChange+=fireSpeed;
  if(fireChange>1)
  {
    fireSpeed-=0.1;
  }
  else
  if(fireChange<0.01){
    fireSpeed+=0.1;
  }

  fill(newFire);
  ellipse(playerX+-149, playerY+6, 25, 11);   //flames  // make them flicker!
  ellipse(playerX+-149, playerY+-14, 25, 11); //flames  //make them flicker!

  fill(255, 0, 0);
  rect(playerX+-145, playerY+-19, 45, 8); //engine(back 1)
  rect(playerX+-145, playerY+1, 45, 8); //engine(back 2)
  /*
  I'm happy with how the fighter turned out.  THe design of the ship, to the firing
   it turned out better than expexted.
   Some tweaks needed here and there, but nothing too over the top.
   I'll add the iconic noise of shooting, engine flame flickering 
   and possibly some pick-ups. For speed and health.
   */
}