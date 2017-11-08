
class Menu{
  
 float starX;
 float starY;
 color c1=color(255);
 color c2=color(0);
 float n= 0.01;
 float m=0.001;
 
 Menu(){
  starX=random(width);
  starY=random(height);
  m=random(0.001,0.005);
  n=random(0.01,0.05);
   
 }
 

 
 void show(){
   color newC=lerpColor(c1,c2,n);
   stroke(newC);
   
   n+=m;
   if(n>1){
     m-=random(0.001,0.005);
   }
   else if(n<0.01){
     m+=random(0.001,0.005);
   }
   
  point(starX, starY);
  
 }
 
}
 

   
 
  