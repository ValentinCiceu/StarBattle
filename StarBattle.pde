//Star wars game.
//Christmas card game
//(160,80) origin points for the fighter
//Made by Valentin Ciceu. C16343126
//Hope you enjoyed :3

//************\\
//***With 3D***\\
//*************\\

import ddf.minim.*;
Minim minim;
AudioPlayer laser;
AudioPlayer playerLaser;
AudioPlayer mega;
AudioPlayer start;
AudioPlayer main;
AudioPlayer credits;


PImage republic;  //emblem
PImage galactic; //emblem
PImage death; //death star
PImage falcon; //millenium falcon
PImage planet; //planet
PImage boss; //star killer base 

PFont title;



Tie[] ties=new Tie[5]; //how many tie's I want //5
Asteroid[] ast=new Asteroid[5];  //5
Stars[] star=new Stars[500];  //500
Menu[] menu=new Menu[1000]; //1000  the more stars the buggier the music gets

//Songs + sound fx variables

void setup() {
  //size(750, 500);
  fullScreen(P3D);
  smooth();
  frameRate(60);
  //fonts//
  title = createFont("Bauhaus 93", 32);
  //Song//

  //sound efx and music//
  minim= new Minim(this);
  laser= minim.loadFile("megaLaser.wav");
  playerLaser= minim.loadFile("playerLaser.wav");
  mega=minim.loadFile("megaLaser.wav");
  //main=minim.loadFile("star.mp3"); //Bad song
  main=minim.loadFile("Space Battle.wav");  //good song
  start=minim.loadFile("Space Menu.mp3");
  credits=minim.loadFile("credits song.wav");

  //Variables for the credits
  textX=width/2.5;
  textY=height/2;


  //Colours
  titlec1= color(255, 0, 0);
  titlec2= color(0, 255, 0);

  fire= color(255, 0, 0);
  fire2=color(255, 104, 0);




  // rectMode(CENTER);
  deathX=width+100;
  deathY=height-250;
  falX=-10000;
  falY=random(0, height);

  bossX=width;
  bossY=height/10;
  bcol=bossY*4;


  //bullets for the main ship
  ebulX=width-600;
  ebulY=(height/10);

  megaLaser=(height/2)-70;


  ebulX2=width-100;
  ebulX3=width-250;
  ebulX4=width-550;
  ebulX5=width-150;
  ebulX6=width-50;
  ebulX7=width-50;
  ebulX8=width-40;
  ebulX9=width-40;
  ebulX10=width-60;
  ebulX11=width-300;

  //creates the tie's usinf the i variable declared
  for (int i=0; i< ties.length; i++) {
    ties[i]=new Tie();
  }
  for ( int i=0; i<ast.length; i++) {
    ast[i]= new Asteroid();
  }

  for (int i=0; i<star.length; i++) {

    star[i]= new Stars();
  }

  for (int i=0; i<menu.length; i++) {

    menu[i]= new Menu();
  }
  //all the pictures for the game.
  republic= loadImage("Untitled.png");
  //galactic= loadImage("galactic.png");//black in
  galactic= loadImage("galactic2.png");
  death= loadImage("death star.jpg");
  planet= loadImage("Tatooine planet.jpg");
  falcon= loadImage("millenium falcon1.png");
  boss= loadImage("star killer1.png");
  //boss= loadImage("star destroyer.jpg");
}
//Variables for the fiaghter
int playerX=160;
int playerY=80;
int playerspeed=5;

//variables for the tiefighter
//(230, 141)//origin point

//float tieX=230;
float tieX=random(width, width+5000);
float tieY=141;
float tieSpeed=-4;
float tieCollisionX=230;
float tieCollisionY=141;
float tieCollisionWidth=20;
float tieCollisionHeight=82;

//variables for the timer  888
float timer=0;//10000;
float timerSpeed=1.5;

//variables for choose asteroid shape
int choose=0;

//variables for the collision detector for the wings
int collisionX=40;
int collisionY=11;
int collisionWidth=20;
int collisionHeight=128;

//variablse for the collision detector for the main body
int collisionPointX=160;
int collisionPointY=80;



// Multiple key press
boolean[] keys = new boolean[10000];



//bullet variables
boolean shoot=false;
float bulX;
float bulY;

float bulX2;
float bulY2;

float bulX3;
float bulY3;

float bulX4;
float bulY4;

float bulWidth=100;
float bulHeight=2;
float bulShape=50;
float bulSpeed=+50; //50

//HUD variables
int healthPoint=0;
int health=healthPoint;
int scorePoint=0;
int score=scorePoint;

//variables for the death star and the planet
float deathX;
float deathY;
float deathspeed=-0.5;
float X=0;
float Y=0;
float colX=0;
float colY=0;
float pla=0;
float planetX=500;
float planetY=deathY-495;

//variables foe the millenium falcon
float falX;
float falY;
float falSpeed=6;

//boss fight variables
float Bshoot;
float BshootSpeed;
float hitX;
float hitY;

float bossX;
float bossY;
float bcol;
float Bspeed=-1;

//bullets and bullet speed for the boss.
float ebulX;
float ebulX2;
float ebulX3;
float ebulX4;
float ebulX5;
float ebulX6;
float ebulX7;
float ebulX8;
float ebulX9;
float ebulX10;
float ebulX11;
float ebulY;
float ebulSpeed=random(-15, -10);
float ebulSpeed2=random(-15, -10);
float ebulSpeed3=random(-15, -10);
float ebulSpeed4=random(-15, -10);
float ebulSpeed5=random(-15, -10);
float ebulSpeed6=random(-15, -10);
float ebulSpeed7=random(-15, -10);
float ebulSpeed8=random(-15, -10);
float ebulSpeed9=random(-15, -10);
float ebulSpeed10=random(-15, -10);
float ebulSpeed11=random(-15, -10);

///variables for the boss 
float megaLaser;   //rect(-10, megaLaser, 695, 20, 50);//what I want.
float megaLaserX=100; //1000
float megaSpeed;
float megaTimer=0;
float megaTimerSpeed=1.5;
//timerSpeed=1.5;



int Bhealth=100;

///variables for the 2nd boss fight
float recharge=0;
float rechargeRat=0.25;
float fly=0;
float back=0;

//variables for the main screen, game and end screen. and sound cotrols
int stage=1;

float sound=0;        //Main menu control
float soundSpeed=1.5;

float sound2=0;     //In game control
float soundSpeed2=1.5;

float sound3=0;    //Credits control
float soundSpeed3=1.5;

//colours
float change=0.01;
float changeSpeed=0.002;
color titlec1;
color titlec2;

float fireChange=0.01;
float fireSpeed=0.1;
color fire;
color fire2;
////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////Credits//////////////////////////////////////////////

String[] role={"Sound", "Coding", "Teting", "Produtive", "Directing", "Inspector", "Chief", "Coding", "Project", "Party", "Pizza", "Unrecognized", "The ", "Credits"};

String[] special={"Technician", "Assistant", "Manager", "Engineer", "Assasin", "Gadget", "Hopper", "Organizer", "Manager", "Dude", "Guy", "duty", "MVP", "Manager"};

float textX;
float textY;
float textSpeed=1;

//////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////MY METHODS//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


///The main menu of the game
void mainMenu() {
  if (stage==1) {
    sound+=soundSpeed;
    credits.rewind();
    credits.setGain(-100);
    start.setGain(1);
    if (sound>0 && sound<=1400) {
      start.play();
    }
    if (sound>1400 && sound <1402) {
      start.rewind(); //retstarts the song
      sound=0;
    }
    for (int i=0; i<menu.length; i++) { // the background.

      menu[i].show(); //for blinking stars
    } 
    color newtitle= lerpColor(titlec1, titlec2, change);
    fill(newtitle);
    change+=changeSpeed;
    if (change>1)
    {
      changeSpeed-=0.01;
    } else
      if (change<0.01) {
        changeSpeed+=0.001;
      }
    textFont(title);
    textSize(50);
    text("Star battle", width/2.5, (height/4)-100);//title
    textSize(20);
    text("Controlls: ", 35, (height/1.2)+25); //The controlls
    text("Press the Up and Down arrow keys to move", 150, (height/1.2)+25);
    text("Press the space bar to shoot! ", 150, (height/1.2)+50);
    textSize(30);
    text("Press Enter to start the game", width/3, height/2);


    //if(keyPressed){ //works without the keyPressed. this will start the game  
    if (keyCode==ENTER) {

      stage=2;
    }
    // }
  }
} //end of main menu



void game() {

  if (stage==2) {
    //Main sing control
    //start.rewind();
    //rotateX(PI*8);
    sound2+=soundSpeed2;
    start.setGain(-100);
    //credits.rewind();//test this out if it works
    if (sound2>0 && sound2<=20692) {   ///6100 limit for bad song
      main.setGain(-10);
      main.play();
    }
    if (sound2>20692 && sound2<20695) {
      main.rewind();
      sound2=0;
    }

    image(planet, pla, 0); //Tatoonie planet
    image(falcon, falX, falY);//millenium falcon
    image(death, deathX, deathY); //the death star
    //image(boss, bossX, bossY);
    //Killing the planet
    timer+=timerSpeed;
    //megaTimer+=1;
    //comtrollers to help me see whats going on in the background.
    //println(timer);
    //println(frameRate);
    //println(bossX);
    //println(bossY);
    //println(megaLaser);
    //println(bcol);
    //println(frameRate);
    println(sound);

    if (timer>=3000 && timer<=4000) { //moves and stops
      deathX+=deathspeed;
    }
    if (timer>=5000 && timer<=5500) {  //warm up laser
      stroke(50, 205, 50);
      point(deathX, deathY); //preping the laser
      line(deathX+81, deathY+30, deathX+42, deathY+35);
      line(deathX+77, deathY+81, deathX+42, deathY+35);
      line(deathX+110, deathY+59, deathX+42, deathY+35);
      line(deathX+48, deathY+72, deathX+42, deathY+35);
      line(deathX+110, deathY+34, deathX+42, deathY+35);
    }

    if (timer>=5100 && timer<=5500) {  //Main laser // destroys the planet
      planetX=0;
      line(deathX+42, deathY+35, planetX, deathY-500);
    }

    //laser collision with the planet
    //rect(X+0,Y+0,colX+141,colY+113); //don't use!
    if (planetX>=0 && planetX<=colX+141) {

      pla=-400;
    }


    if (timer>=7000 && timer<=8000) {
      deathY-=deathspeed;
    }

    if (timer>=12000) { //collision detector for the boss  //after the boss comes in
      fill(255);
      //////////////////////////////////////////////////////////////////////////////////////  ////////////////////////////////////////////////////////////////////////////////////
      rect(bossX+20, bcol, 500, 40); //the detector
      fill(35, 206, 4);
      textSize(15);
      text("Boss health: "+ Bhealth, width-150, height-20);
    }
    image(boss, bossX, bossY);

    ///boss fight. Stage 1 mini lasers
    if (Bhealth>=50 && Bhealth<=100) {
      if (timer>=12000 && timer<=13000) { 
        //mini Lasers for the main boss



        rect(ebulX, ebulY*4.25, 100, 2, 50);
        rect(ebulX2, ebulY*4.25, 100, 2, 50);
        rect(ebulX3, ebulY*4.85, 100, 2, 50);//
        rect(ebulX4, ebulY*3.85, 100, 2, 50);
        rect(ebulX5, ebulY*3.85, 100, 2, 50);
        rect(ebulX6, ebulY*2, 100, 2, 50);
        rect(ebulX7, (ebulY*1.8)+100, 100, 2, 50);
        rect(ebulX8, ebulY*3, 100, 2, 50);
        rect(ebulX9, ebulY*4.5, 100, 2, 50);
        rect(ebulX10, ebulY*4.8, 100, 2, 50);
        rect(ebulX11, (ebulY*4.8)-50, 100, 2, 50);
        //main lasers. Jumbo laser
        //rect(-10, (ebulY*4.8)-50, 695, 20, 50);

        ebulX+=ebulSpeed;
        ebulX2+=ebulSpeed2;
        ebulX3+=ebulSpeed3;
        ebulX4+=ebulSpeed4;
        ebulX5+=ebulSpeed5;
        ebulX6+=ebulSpeed6;
        ebulX7+=ebulSpeed7;
        ebulX8+=ebulSpeed8;
        ebulX9+=ebulSpeed9;
        ebulX10+=ebulSpeed10;
        ebulX11+=ebulSpeed11;
      }
      if (timer>=13500 && timer<=14500) { 
        //Lasers for the main boss


        rect(ebulX, ebulY*4.25, 100, 2, 50);
        rect(ebulX2, ebulY*4.25, 100, 2, 50);
        rect(ebulX3, ebulY*4.85, 100, 2, 50);//
        rect(ebulX4, ebulY*3.85, 100, 2, 50);
        rect(ebulX5, ebulY*3.85, 100, 2, 50);
        rect(ebulX6, ebulY*2, 100, 2, 50);
        rect(ebulX7, (ebulY*1.8)+100, 100, 2, 50);
        rect(ebulX8, ebulY*3, 100, 2, 50);
        rect(ebulX9, ebulY*4.5, 100, 2, 50);
        rect(ebulX10, ebulY*4.8, 100, 2, 50);
        rect(ebulX11, (ebulY*4.8)-50, 100, 2, 50);
        //main lasers
        //rect(-10, (ebulY*4.8)-50, 695, 20, 50);

        ebulX+=ebulSpeed;
        ebulX2+=ebulSpeed2;
        ebulX3+=ebulSpeed3;
        ebulX4+=ebulSpeed4;
        ebulX5+=ebulSpeed5;
        ebulX6+=ebulSpeed6;
        ebulX7+=ebulSpeed7;
        ebulX8+=ebulSpeed8;
        ebulX9+=ebulSpeed9;
        ebulX10+=ebulSpeed10;
        ebulX11+=ebulSpeed11;
      }
      if (timer>=15000 && timer<=16500) { 
        //Lasers for the main boss



        rect(ebulX, ebulY*4.25, 100, 2, 50);
        rect(ebulX2, ebulY*4.25, 100, 2, 50);
        rect(ebulX3, ebulY*4.85, 100, 2, 50);//
        rect(ebulX4, ebulY*3.85, 100, 2, 50);
        rect(ebulX5, ebulY*3.85, 100, 2, 50);
        rect(ebulX6, ebulY*2, 100, 2, 50);
        rect(ebulX7, (ebulY*1.8)+100, 100, 2, 50);
        rect(ebulX8, ebulY*3, 100, 2, 50);
        rect(ebulX9, ebulY*4.5, 100, 2, 50);
        rect(ebulX10, ebulY*4.8, 100, 2, 50);
        rect(ebulX11, (ebulY*4.8)-50, 100, 2, 50);
        //main lasers
        //rect(-10, (ebulY*4.8)-50, 695, 20, 50);

        ebulX+=ebulSpeed;
        ebulX2+=ebulSpeed2;
        ebulX3+=ebulSpeed3;
        ebulX4+=ebulSpeed4;
        ebulX5+=ebulSpeed5;
        ebulX6+=ebulSpeed6;
        ebulX7+=ebulSpeed7;
        ebulX8+=ebulSpeed8;
        ebulX9+=ebulSpeed9;
        ebulX10+=ebulSpeed10;
        ebulX11+=ebulSpeed11;
      }

      if (timer>=17000 && timer<=18500) { 
        //Lasers for the main boss// @ stage 1 of the fight





        rect(ebulX, ebulY*4.25, 100, 2, 50);
        rect(ebulX2, ebulY*4.25, 100, 2, 50);
        rect(ebulX3, ebulY*4.85, 100, 2, 50);//
        rect(ebulX4, ebulY*3.85, 100, 2, 50);
        rect(ebulX5, ebulY*3.85, 100, 2, 50);
        rect(ebulX6, ebulY*2, 100, 2, 50);
        rect(ebulX7, (ebulY*1.8)+100, 100, 2, 50);
        rect(ebulX8, ebulY*3, 100, 2, 50);
        rect(ebulX9, ebulY*4.5, 100, 2, 50);
        rect(ebulX10, ebulY*4.8, 100, 2, 50);
        rect(ebulX11, (ebulY*4.8)-50, 100, 2, 50);
        //main lasers
        //rect(-10, (ebulY*4.8)-50, 695, 20, 50);

        ebulX+=ebulSpeed;
        ebulX2+=ebulSpeed2;
        ebulX3+=ebulSpeed3;
        ebulX4+=ebulSpeed4;
        ebulX5+=ebulSpeed5;
        ebulX6+=ebulSpeed6;
        ebulX7+=ebulSpeed7;
        ebulX8+=ebulSpeed8;
        ebulX9+=ebulSpeed9;
        ebulX10+=ebulSpeed10;
        ebulX11+=ebulSpeed11;
      }

      if (timer>=19000 && timer<=20500) { 
        //Lasers for the main boss



        rect(ebulX, ebulY*4.25, 100, 2, 50);
        rect(ebulX2, ebulY*4.25, 100, 2, 50);
        rect(ebulX3, ebulY*4.85, 100, 2, 50);//
        rect(ebulX4, ebulY*3.85, 100, 2, 50);
        rect(ebulX5, ebulY*3.85, 100, 2, 50);
        rect(ebulX6, ebulY*2, 100, 2, 50);
        rect(ebulX7, (ebulY*1.8)+100, 100, 2, 50);
        rect(ebulX8, ebulY*3, 100, 2, 50);
        rect(ebulX9, ebulY*4.5, 100, 2, 50);
        rect(ebulX10, ebulY*4.8, 100, 2, 50);
        rect(ebulX11, (ebulY*4.8)-50, 100, 2, 50);
        //main lasers
        //rect(-10, (ebulY*4.8)-50, 695, 20, 50);

        ebulX+=ebulSpeed;
        ebulX2+=ebulSpeed2;
        ebulX3+=ebulSpeed3;
        ebulX4+=ebulSpeed4;
        ebulX5+=ebulSpeed5;
        ebulX6+=ebulSpeed6;
        ebulX7+=ebulSpeed7;
        ebulX8+=ebulSpeed8;
        ebulX9+=ebulSpeed9;
        ebulX10+=ebulSpeed10;
        ebulX11+=ebulSpeed11;
      }
      if(timer>=20510){ //resests the timer so that the boss fight can continue
       timer= 12000; 
      }
    }//end of the timer of shooting. & health
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //boss fight stage 2 mega lasers
    if (Bhealth>=0 && Bhealth<=50) {  
      megaTimer+=megaTimerSpeed;

      if (megaTimer>=1 && megaTimer<=100) { //warning
        fill(255, 0, 0);
        textSize(20);
        text("Laser inbound", width/2, height/2);
      }
      if (megaTimer>=100 && megaTimer<=1000) {///going down // 200 //2000 
        fill(5, 152, 5); 
        //mega.setGain(-10);
        //mega.play();
        megaLaserX=-10;
        rect(megaLaserX, megaLaser, 730, 20, 50); //rect(x1,y1,width,height,roud)
        fly=1;
      }

      // if (megaTimer>=4000 && megaTimer<=5600) {///staying down
      //   fill(5, 152, 5);
      //   rect(-10, megaLaser, 730, 20, 50);
      // }


      if (megaTimer>=1010 && megaTimer<=1499) { //return to original spot //2010  2499
        //using the lerp function to return to original place
        /* to use the lerps i need the original points of the image when its on screen.
         X position is: 699
         Y position is: 76
         look at the lerp example you did. (the chasing player game);
         */
        //point(699,76);
        //bossX=lerp(bossX,699,0.05);
        //mega.rewind();
        bossY=lerp(bossY, 76, 0.02); //0.05
        megaLaser=lerp(megaLaser, 314, 0.02);//0.05 //0.01
        bcol=lerp(bcol, 304, 0.02);//0.05
        megaLaserX=1000; //1000
      }
      //going up
      if (megaTimer>=1200 && megaTimer<=1500) { //warning
        fill(255, 0, 0);
        textSize(20);
        text("Laser inbound", width/2, height/2);
      }
      if (megaTimer>=1500 && megaTimer<=2200) { //4000 //2500 //3200
        fill(5, 152, 5);
        //mega.setGain(-10);
        //mega.play();
        megaLaserX=-10;
        rect(megaLaserX, megaLaser, 730, 20, 50);
        fly=-1;
      }

      if (megaTimer>=2201 && megaTimer<=2600) {//4100
        //mega.rewind();
        bossY=lerp(bossY, 76, 0.02); ///0.05
        megaLaser=lerp(megaLaser, 314, 0.02);//0.05    ///brings back to original place. 0.01
        bcol=lerp(bcol, 304, 0.02);//0.05
        megaLaserX=1000; //1000
      }
      if (megaTimer>=2700) {
        //mega.rewind();
        megaTimer=0;
      }

      //boundary control for the boss
      if (bossY+330>=height) {//bottom border  height/10 is the originl point for the boss
        fly=-1;             //76 is the point
      }
      if (bossY+170<=0) { //top border
        fly=1;
      }
      megaLaser+=fly;
      bossY+=fly;
      bcol+=fly;
      if (megaTimer>=5000) {
        megaTimer=0;
      }
    } else {
      megaLaserX=100;
    }
    //border boundaries for the boss



    //fill(5,152,5);
    //rect(-10, megaLaser, 695, 20, 50);

    //
    if (ebulX<=0) {
      ebulX=width-600;
      ebulSpeed=random(-15, -10);
    }

    if (ebulX2<=0) {
      ebulX2=width-100;
      ebulSpeed2=random(-15, -10);
    }

    if (ebulX3<=0) {
      ebulX3=width-250;
      ebulSpeed3=random(-15, -10);
    }

    if (ebulX4<=0) {
      ebulX4=width-550;
      ebulSpeed4=random(-15, -10);
    }

    if (ebulX5<=0) {
      ebulX5=width-150; 
      ebulSpeed5=random(-15, -10);
    }

    if (ebulX6<=0) {
      ebulX6=width-50;
      ebulSpeed6=random(-15, -10);
    }

    if (ebulX7<=0) {
      ebulX7=width-50;
      ebulSpeed7=random(-15, -10);
    }

    if (ebulX8<=0) {
      ebulX8=width-40;
      ebulSpeed8=random(-15, -10);
    }

    if (ebulX9<=0) {
      ebulX9=width-40;
      ebulSpeed9=random(-15, -10);
    }

    if (ebulX10<=0) {
      ebulX10=width-60;
      ebulSpeed10=random(-15, -10);
    }

    if (ebulX11<=0) {
      ebulX11=width-300;
      ebulSpeed11=random(-15, -10);
    }



    if (timer>=11000 && timer<=12000) { //star killer base comes in

      bossX+=Bspeed;
    }

    if (timer>=0 && timer<=12000) {  //controller for the health

      Bhealth=100;
    }
    //rect(bossX+20, bossY*4, 500, 40);




    if (falX>=width+100) {  //millenium falcon easter egg
      falX=-10000;
      falY=random(0, width);
      falSpeed=random(5, 10);
    }

    falX+=falSpeed;





    //image(falcon,250,250);

    fill(255);

    //spawn stars
    for (int i=0; i<star.length; i++) {
      star[i].starShow();
      star[i].starDraw();
    }

    //spawns asteroids
    for (int i=0; i<ast.length; i++) {
      ast[i].moveAst();
      ast[i].reveal();
    }


    //spawns the tie fighters
    //As i goes up it creates the tie's
    for (int i=0; i<ties.length; i++) {
      ties[i].move();
      ties[i].tieFighter();
    }


















    //the shooting mechanic for the player

    if (checkKey(' ')) {
      bulX= playerX;
      bulY= playerY;

      bulX2= playerX;
      bulY2= playerY;

      bulX3= playerX;
      bulY3= playerY;

      bulX4= playerX;
      bulY4= playerY;

      shoot=true;
    }
    if (shoot) {
      fill(255, 0, 0);
      stroke(0);


      //playerLaser.rewind();
      bulX+=bulSpeed;
      bulX2+=bulSpeed;
      bulX3+=bulSpeed;
      bulX4+=bulSpeed;  

      rect(bulX4-173, bulY4+69, bulWidth, bulHeight, bulShape);  // bullet 4
      rect(bulX3-152, bulY3+59, bulWidth, bulHeight, bulShape);  //bullet 3
      rect(bulX2-172, bulY2-66, bulWidth, bulHeight, bulShape);  // bullet 2
      rect(bulX-159, bulY-76, bulWidth, bulHeight, bulShape);  // bullet 1
    }

    //println(bulX-173);


    //bullet collision with the boss
    //bullet 1
    if (bulX-159+bulWidth>=bossX+20 && bulX-159+bulWidth<=bossX+520 && bulY-76>=bcol && bulY-76<=(bcol)+40) {
      bulX=-100000000;
      scorePoint+=5;
      Bhealth-=2.5;
    }
    //bullet2
    if (bulX2-172+bulWidth>=bossX+20 && bulX2-172+bulWidth<=bossX+520 && bulY2-66>=bcol && bulY2-66<=(bcol)+40) {
      bulX2=-100000000;
      scorePoint+=5;
      Bhealth-=2.5;
    }
    //bullet3
    if (bulX3-152+bulWidth>=bossX+20 && bulX3-152+bulWidth<=bossX+520 && bulY3+59>=bcol && bulY3+59<=(bcol)+40) {
      bulX3=-100000000;
      scorePoint+=5;
      Bhealth-=2.5;
    }

    //bullet4
    if (bulX4-173+bulWidth>=bossX+20 && bulX4-173+bulWidth<=bossX+520 && bulY4+69>=bcol && bulY4+69<=(bcol)+40) {
      bulX4=-100000000;
      scorePoint+=5;
      Bhealth-=2.5;
    }
    //i changed bossY*4 with bcol. if things mess up go back.



    //rect(bossX+20, bossY*4, 500, 40);

    //coolision player with the boss' bullets
    /*
  rect(ebulX, ebulY*4.25, 100, 2, 50);//rect(collisionX, collisionY, collisionWidth, collisionHeight); fighter wings  
     rect(ebulX2, ebulY*4.25, 100, 2, 50);//triangle(collisionPointX-81, collisionPointY+10, collisionPointX-81, collisionPointY-20, collisionPointX, collisionPointY);
     rect(ebulX3, ebulY*4.85, 100, 2, 50);//
     rect(ebulX4, ebulY*3.85, 100, 2, 50);
     rect(ebulX5, ebulY*3.85, 100, 2, 50);
     rect(ebulX6, ebulY*2, 100, 2, 50);
     rect(ebulX7, (ebulY*1.8)+100, 100, 2, 50);
     rect(ebulX8, ebulY*3, 100, 2, 50);
     rect(ebulX9, ebulY*4.5, 100, 2, 50);
     rect(ebulX10, ebulY*4.8, 100, 2, 50);
     rect(ebulX11, (ebulY*4.8)-50, 100, 2, 50);
     */
    //with the wings
    //bullet1
    if (ebulX>=collisionX && ebulX<=collisionX+collisionWidth && ebulY*4.25>=collisionY && ebulY*4.25<= collisionY +collisionHeight) {
      ebulX=width-600;
      ebulSpeed=random(-15, -10);
      healthPoint+=5;
    }
    //bullet2
    if (ebulX2>=collisionX && ebulX2<=collisionX+collisionWidth && ebulY*4.25>=collisionY && ebulY*4.25<= collisionY +collisionHeight) {
      ebulX2=width-100;
      ebulSpeed2=random(-15, -10);
      healthPoint+=5;
    }
    //bullet3
    if (ebulX3>=collisionX && ebulX3<=collisionX+collisionWidth && ebulY*4.85>=collisionY && ebulY*4.85<= collisionY +collisionHeight) {
      ebulX3=width-250;
      ebulSpeed3=random(-15, -10);
      healthPoint+=5;
    }
    //bullet4
    if (ebulX4>=collisionX && ebulX4<=collisionX+collisionWidth && ebulY*3.85>=collisionY && ebulY*3.85<= collisionY +collisionHeight) {
      ebulX4=width-550;
      ebulSpeed4=random(-15, -10);
      healthPoint+=5;
    }
    //bullet5
    if (ebulX5>=collisionX && ebulX5<=collisionX+collisionWidth && ebulY*3.85>=collisionY && ebulY*3.85<= collisionY +collisionHeight) {
      ebulX5=width-150;
      ebulSpeed5=random(-15, -10);
      healthPoint+=5;
    }
    //bullet6
    if (ebulX6>=collisionX && ebulX6<=collisionX+collisionWidth && ebulY*2>=collisionY && ebulY*2<= collisionY +collisionHeight) {
      ebulX6=width-50;
      ebulSpeed6=random(-15, -10);
      healthPoint+=5;
    }
    //bullet7
    if (ebulX7>=collisionX && ebulX7<=collisionX+collisionWidth && (ebulY*1.85)+100>=collisionY && (ebulY*1.85)+100<= collisionY +collisionHeight) {
      ebulX7=width-50;
      ebulSpeed7=random(-15, -10);
      healthPoint+=5;
    }
    //bullet8
    if (ebulX8>=collisionX && ebulX8<=collisionX+collisionWidth && ebulY*3>=collisionY && ebulY*3<= collisionY +collisionHeight) {
      ebulX8=width-40;
      ebulSpeed8=random(-15, -10);
      healthPoint+=5;
    }
    //bullet9
    if (ebulX9>=collisionX && ebulX9<=collisionX+collisionWidth && ebulY*4.5>=collisionY && ebulY*4.5<= collisionY +collisionHeight) {
      ebulX9=width-40;
      ebulSpeed9=random(-15, -10);
      healthPoint+=5;
    }
    //bullet10
    if (ebulX10>=collisionX && ebulX10<=collisionX+collisionWidth && ebulY*4.8>=collisionY && ebulY*4.8<= collisionY +collisionHeight) {
      ebulX10=width-60;
      ebulSpeed10=random(-15, -10);
      healthPoint+=5;
    }
    //bullet11
    if (ebulX11>=collisionX && ebulX11<=collisionX+collisionWidth && (ebulY*4.8)-50>=collisionY && (ebulY*4.8)-50<= collisionY +collisionHeight) {
      ebulX11=width-300;
      ebulSpeed11=random(-15, -10);
      healthPoint+=5;
    }

























    fighter();




    //moving the fighter up and down

    if (checkKey(UP)) {
      playerY-=playerspeed;
      collisionY-=playerspeed;
      collisionPointY-=playerspeed;
    }
    if (checkKey(DOWN)) {
      playerY+=playerspeed;
      collisionY+=playerspeed;
      collisionPointY+=playerspeed;
    }

    //boundaries  //idea --> if ship goes off screen it spawns on the other side...scrap the idea
    if (playerY<=0) {
      playerY=0;
    }
    if (playerY>=height) {
      playerY=height;
    }
    if (collisionY+69<=0) {
      collisionY=0-69;
    }
    if (collisionY+69>=height) {
      collisionY=height-69;
    }
    if (collisionPointY<=0) {
      collisionPointY=0;
    }
    if (collisionPointY>=height) {
      collisionPointY=height;
    }

    //fill(0,0,255); //these are my collision detectors completed
    //rect(collisionX, collisionY, collisionWidth, collisionHeight); //collision detector for the wings
    //triangle(collisionPointX-81, collisionPointY+10, collisionPointX-81, collisionPointY-20, collisionPointX+0, collisionPointY+0); // collision detectorfor the front. (154,80) is the front point



    //Tie controller

    if (tieX<=-50) {
      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      tieY=random(height);
    }

    //collision with the fighter//
    //rect(tieX, tieY, tieCollisionWidth, tieCollisionHeight); //Tie
    //rect(collisionX, collisionY, collisionWidth, collisionHeight); fighter wings
    //triangle(collisionPointX-81, collisionPointY+10, collisionPointX-81, collisionPointY-20, collisionPointX, collisionPointY);

    if (tieX>=collisionX && tieX<=collisionX+collisionWidth && tieY>=collisionY-100 && tieY<= collisionY+collisionHeight) { //THis detects the wing span of both ships
      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      tieY=random(height);
    }
    //After processing crashed on me the collision point went wonky a bit
    //and so the normal detection that i did on first attempt
    //Does not work anymore and so i had to alter the code by using the -95 bit
    // which i do not fully understand as to why it works now and that te old version stopped
    //working

    //Collision of the triangle part of the fighter.

    if (tieX>=collisionPointX-81 && tieX<= collisionPointX && tieY>=collisionPointY-95 && tieY<=collisionPointY+10 ) {
      tieX=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      tieY=random(height);
    }


    //collision detector betwwen the megalaser and the player (insta death) 
    if (collisionX+collisionWidth>megaLaserX && collisionY>=megaLaser-128 && collisionY<=megaLaser) {

      healthPoint+=10;
    }

    //collision detector between the laser and your bullets. (controller)
    if (megaTimer>=100 && megaTimer<=1000 || megaTimer>=1500 && megaTimer<=2200 ) {   

      if (bulX-159+bulWidth>=megaLaserX  && bulY-76>=megaLaser-10 && bulY-76<=megaLaser+60) {   ///both 50 works. but can be better
        bulX=-100000000;
        back=255;
      }
      //bullet2
      if (bulX2-172+bulWidth>=megaLaserX  && bulY2-66>=megaLaser-10 && bulY2-66<=megaLaser+60) {
        bulX2=-100000000;
        back=255;
      }
      //bullet3
      if (bulX3-152+bulWidth>=megaLaserX   && bulY3+59>=megaLaser-10 && bulY3+59<=megaLaser+60) {//needs tweaking
        bulX3=-100000000;
        back=255;
      }

      //bullet4
      if (bulX4-173+bulWidth>=megaLaserX   && bulY4+69>=megaLaser-10 && bulY4+69<=megaLaser+60) { //the first number is over. The second is under the laser
        bulX4=-100000000;
        back=255;
      }
    }

    //ghj






    //tieSpeed=4;
    //tieCollisionX+=tieSpeed;
    //tieX+=tieSpeed;
    fill(35, 206, 4);
    textSize(15);
    text("Score:  " + scorePoint, 5, height-40);
    text("Damage = " + healthPoint + " % ", 5, height-10);
    //On scree controller-> use only for aid in productioni. After that I comment the text controllers out as it will run in the background
    //text("Boss health: "+ Bhealth, width-150, height-20);
    //text(timer, width/2, height/2);
    fill(255);
    //text(megaTimer, width/2, height/2+250);
    //text(sound2, width/2, height/2+100);
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (healthPoint>=100) { //Game over screen   and restart everything //if you died

      timer=0;
      pla=0;
      megaLaserX=100;
      planetX=500;
      planetY=deathY-495;
      deathX=width+100;
      deathY=height-250;
      bossX=width;
      stage=3;
    }

    if (Bhealth<=0) { //if you kille the boss
      timer=0;
      pla=0;
      sound=0;
      megaLaserX=100;
      planetX=500;
      planetY=deathY-495;
      deathX=width+100;
      deathY=height-250;
      bossX=width;
      stage=3; //go to game over screen
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////t
  }//end of stage 1 draw
}//end of game



void end() {
  if (stage==3) {
    sound=0;
    rotateX(PI/8);
    sound2=0;
    Bhealth=100;
    main.setGain(-100);
    credits.setGain(1);
    sound3+=soundSpeed3;
    if (sound>0 && sound<=32464) {
      credits.play();
    }
    if (sound>32464 && sound <32468) {
      credits.rewind(); //retstarts the song
      sound3=0;
    }
    start.rewind();//setting the music back to 0
    main.rewind();//setting the main menu music back to 0
    credits.play();//play the credits music
    // start.setGain(1);
    //start.play();
    for (int i=0; i<menu.length; i++) {

      menu[i].show();
    }
    color newtitle= lerpColor(titlec1, titlec2, change); //changing text colour
    fill(newtitle);
    change+=changeSpeed;
    if (change>1)
    {
      changeSpeed-=0.01;
    } else
      if (change<0.01) {
        changeSpeed+=0.001;
      }
    textSize(30);
    text("Your Score: "+ scorePoint, textX, textY);
    textSize(30);
    text("Thanks for playing Star Battle", (textX)-100, (textY)-50);
    text("Press the Shift button to start or esc to leave", (textX)-200, (textY)+50);  //50, (height/1.2)+50)
    text("Made by Valentin Ciceu (C16343126)", (textX)-150, (textY)+100);  //30,30

    String choose=" ";
    String choice=" ";

    textY-=textSpeed;

    for (int i=0; i<role.length; i++) {
      choose= role[i];
      choice= special[i];
      println(choose   +   choice);
      textSize(30);
      text(choose  +" " +  choice  + ": Valentin Ciceu", textX-120, textY+200+(100*i));

      if (textY+1500<=-50) {
        textY=height;
      }


      //if(keyPressed){
      if (keyCode==SHIFT) {
        stage=1; 
        healthPoint=0;
      }
    }
  }
  //rect(bossX+20, bcol, 500, 40); //the detector   kinda buggy when it moves. //use this for reference.
  //rect(bossX+20, bossY*4, 500, 40); //the detector //kinda buggy when it moves.
}//end of end


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////Void darw/////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void draw() {
  background(0);
  mainMenu();
  game();
  end();
}  ///end of void draw.





//for multiple key pressed
void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased() {
  if (checkKey(' ')) { ///sound effects for the player shooting
    playerLaser.setGain(-10); 
    playerLaser.rewind();
    playerLaser.play();
  }

  keys[keyCode]= false;
}

boolean checkKey( int k)
{
  if (keys.length>=k) {
    return keys[k] || keys[Character.toUpperCase(k)];
  }
  return false;
}

/*
so far the game is playable.
 What I want to add are the following. 
 1: helath of the player, measured in damage taken from 0-100%. checked
 2: timer. Am thinking of adding a boss star killer base at the end using this timer as a controller.//checkeda
 3: stages: Main menu screen. Game screen. Game over Screen.Game win screen which shows the score  .****
 semi-works. ways to fix, can restart the timer everytime you die. //checked
 or look up some info on how to restart everything. //checked
 4: music. left for last**** //checked
 5: add some background planets. //not checked//checked
 6: melenium falcon easter egg. Flying randomely in the background.//checked
 7: designing the boss fight. Choose between the star killer base or the death star.//checked
 8: play the game :3
 9:death star destroying the planet after some time in game. checked
 **10:boss fight--> lasers firing at a straight line for some time. If the hp of boss is less
 than 50%. Then it goes into a rage mode. 
 a giant death star like laser shoots out in the front at a d=straight line.
 the boss will choose to either move up or down with the laser in sync with the descision.
 then it shoots the secondary normal lasers again until the main recharges back.
 this whole fight will be controlled with the time variable. // almost done.
 \ when the health is below 50% thats when the mega laser fires,
 THe mini lasers don't fire anymore just the mega lasers.
 as said above the star killer chooses which side to go up or down.
 then returns back to the original side to recharge.
 Going to place a recharge bar or % on the bottom roght hand side to indicate when the next
 mega laser will fire.**  //checked
 11: colour in the tie fighters //checked
 12: use the lerp function to get the star killer back to it's original place. //checked
 13:fix the megaLaser timer when it starts. It takes too long.// checked
 14:Collision between the player and th000e mega laser (instant death); //checked
 15: fix the collision between the your bullets and the star killer(when it moves it doesnt work) //checked
 16: fix the lerp timers & megatimer so that they are balanced. //checked
 17: find put whats wrong with the framerate at the boss fight.
 18:Fix the emperial emblem. Dosent fit in with the coloured tie fighers as much. //checked
 19:Change the fonts! //checked
 20: the music and sound fx!!*** code so far is 1450 //checked
 21:fix the megalaser + your bullets collision // checked
 */