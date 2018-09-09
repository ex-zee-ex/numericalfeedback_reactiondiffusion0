import themidibus.*; //Import the library
MidiBus myBus;

float spc, theta2,amp,period,dx,yv,wavew;
float aa,ss, dd, ff, gg, jj, hh,kk,db,ds,dh;
float qq, ww, ee, rr, tt, yy, uu, ii,oo;
int[][] bpix0;
int[][] bpix1;
int[][] spix0;
int[][] spix1;
int[][] hpix0;
int[][] hpix1;
int cs=4;
int w,h,siz;
//int sw1,sw2,sw3,sw4,sw5,sw6,sw7,sw8;
float theta;
void setup(){

size(1000,1000,P3D);
spc=cs;
wavew=width+cs;
period=width/2.0;
dx=(TWO_PI/period)*spc;
amp=height/4;

colorMode(HSB,100);
w=width/cs;
h=height/cs;
siz=(width*height)/(cs*cs);
bpix0=new int[w][h];
bpix1=new int[w][h];
spix0=new int[w][h];
spix1=new int[w][h];
hpix0=new int[w][h];
hpix1=new int[w][h];

//for(int i=0;i<w;i++){
 // for(int j=0;j<h;j++){
//bpix0[i][j]=int(random(0,100));
//  }//endjfor
//}//endifor


 MidiBus.list();
 myBus = new MidiBus(this, 0, -1);
 
 
 
 //sw1=sw2=sw3=sw4=sw5=sw6=sw7=sw8=1;
 
}//endsetup

void draw(){
  theta2 +=.005*(1+50*ww);
  //background(100);
  //int fill3;
//i is x
//translate(width/2,height/2);
float xx=theta2;

for(int i=1;i<w-1;i++){
  
  //here is the bit that generates the waaaves
  amp=cs*(1+height/4*qq);
  yv=(sin(xx)+1)*amp;
 // println(yv);
  xx+=dx;
  fill(0);
 //ellipse(i*spc,height/2+yv,spc,spc);
 
 
 
  //j is y
  for(int j=1;j<h-1;j++){
    
    
    //where is everyone
    int lb=bpix0[i][j];
    
    
    int l_ub=bpix0[i][j+1];
    int l_rb=bpix0[i+1][j];
    int l_db=bpix0[i][j-1];
    int l_lb=bpix0[i-1][j];
    int l_u_rb=bpix0[i+1][j+1];
    int l_d_rb=bpix0[i+1][j-1];
    int l_u_lb=bpix0[i-1][j+1];
    int l_d_lb=bpix0[i-1][j-1];
    
    
    int ls=spix0[i][j];
    
    
    int l_us=spix0[i][j+1];
    int l_rs=spix0[i+1][j];
    int l_ds=spix0[i][j-1];
    int l_ls=spix0[i-1][j];
    int l_u_rs=spix0[i+1][j+1];
    int l_d_rs=spix0[i+1][j-1];
    int l_u_ls=spix0[i-1][j+1];
    int l_d_ls=spix0[i-1][j-1];
    
     
     int lh=hpix0[i][j];
    
    
    int l_uh=hpix0[i][j+1];
    int l_rh=hpix0[i+1][j];
    int l_dh=hpix0[i][j-1];
    int l_lh=hpix0[i-1][j];
    int l_u_rh=hpix0[i+1][j+1];
    int l_d_rh=hpix0[i+1][j-1];
    int l_u_lh=hpix0[i-1][j+1];
    int l_d_lh=hpix0[i-1][j-1];
    
    
    
    int x=(i)*cs;
    int y=(j)*cs;
    
    db=jj*.05;
        ds=hh*.05;
            dh=gg*.01;
    int fillb=int(lb+db*(l_ub+l_u_rb+l_rb+l_d_rb));
    int fillh=int(lh+dh*(l_uh+l_u_rh+l_rh+l_d_rh))%100;
    int fills=int(ls+ds*(l_us+l_u_rs+l_rs+l_d_rs));
    if(fillb>100){
    fillb=100;
   // fillb=(100-fillb%100);
 }
    if(fills>100){fills=(100-fills%100);}
    if(fillh<100){fillh=abs(fillh);}
  //  println(fillb+"  "+fillh+"  "+fills);
    if(((y-height/2+amp)<=yv+cs)&&((y-height/2+amp)>=yv-cs)){

    fillb=50;
    fillh=50;
    fills=50;
   //if(sw1==-1){
   // fillb=0;}
    }
    
    

    

    
     noStroke();
    fill(fillh,fills,fillb);
    pushMatrix();
    translate(x,y);

    rect(0,0,cs,cs);

    popMatrix();
   
   
    
     bpix1[i][j]=int(fillb*(1+.1*kk*random(-1,1)));
     spix1[i][j]=int(fills*(1+.1*kk*random(-1,1)));
     hpix1[i][j]=int(fillh*(1+.1*kk*random(-1,1)));

    
    
    
  
  }//endjfor
}//endifor
//noLoop();

for(int i=0;i<w;i++){
  for(int j=0;j<h;j++){
bpix0[i][j]=bpix1[i][j];
spix0[i][j]=spix1[i][j];
hpix0[i][j]=hpix1[i][j];
//println(bpix0[i][j]);
  }//endjfor
}//endifor


 if(keyPressed){
   /*
   if(key=='q'){
      sw1=sw2=sw3=sw4=sw5=sw6=sw7=sw8=1;
   
   }
   
   if(key=='1'){
   sw1*=-1;
   //println(sw1);
   }
     if(key=='2'){
   sw2*=-1;
   //println(sw1);
   }
     if(key=='3'){
   sw3*=-1;
   //println(sw1);
   }
     if(key=='4'){
   sw4*=-1;
   //println(sw1);
   }
   
     if(key=='5'){
   sw5*=-1;
   //println(sw1);
   }
     if(key=='6'){
   sw6*=-1;
   //println(sw1);
   }
   
     if(key=='7'){
   sw7*=-1;
   //println(sw1);
   }
     if(key=='8'){
   sw8*=-1;
   //println(sw1);
   }
   
   */
 if(key==']'){
  for(int i=0;i<w;i++){
   for(int j=0;j<h;j++){
    bpix0[i][j]=0;
     spix0[i][j]=0;
      hpix0[i][j]=0;
   }//endjfor
  }//endifor
 }//end]
 
 }//endifkeypressed
 
 theta+=.01;
}//enddraw

void controllerChange(int channel, int number, int value) {
  
  //AAALSO note on and note off can be used as switches!! 
  
  // Receive a controllerChange
  /*
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  */
  
  
  
  if(number==20){
  qq=(value)/127.0;
 // println("x="+x);
  }
   if(number==21){
  ww=(value-63)/63.0;

 // println("x="+x);
  }
 if(number==71){
  ee=(value)/127.0;

 // println("x="+x);
  }
   if(number==72){
  rr=(value)/127.0;

 // println("x="+x);
  }
   if(number==25){
  tt=(value)/127.0;

 // println("x="+x);
  }
   if(number==73){
  yy=(value)/127.0;
 // println("x="+x);
  }
   if(number==74){
  uu=(value)/127.0;

 // println("x="+x);
  }
   if(number==70){
  ii=(value)/127.0;

 // println("x="+x);
  }
   if(number==63){
  oo=(value)/127.0;

 // println("x="+x);
  }
  
  
  
  
  
  if(number==22){
  aa=(value)/127.0;

 // println("x="+x);
  }
  if(number==23){
  ss=(value)/127.0;

 // println("x="+x);
  }
  if(number==61){
  dd=(value)/127.0;

 // println("x="+x);
  }
  if(number==24){
  ff=(value)/127.0;

 // println("x="+x);
  }
  if(number==26){
  gg=(value)/127.0;

 // println("x="+x);
  }
  if(number==27){
  hh=(value)/127.0;

 // println("x="+x);
  }
  if(number==62){
  jj=(value-63)/63.0;

 // println("x="+x);
  }
  if(number==95){
  kk=(value-63)/63.0;

 // println("x="+x);
  }
}//endcontrollerchange