import processing.serial.*;
//variable para puerto serial
//Serial comSerial;

//Variables definidas para la direccion del viento
float z=50.0;
float velocidad = 3.0;
float radio = 2.0;
float x = 0;
float y = 0;
int ran = 0;
int mov = 0;
int particula = 5;

void setup(){
  size(500,500);
  
  //variables de inicio para puerto serial
  //String nombrePuerto = "/dev/us";
  //comSerial = new Serial(this, nombrePuerto, 9600);
  textSize(16);
  noStroke();
  ellipseMode(RADIUS);
}

void draw(){
  background(0);
  
  if(ran == 0){ // Moviminto de Norte a sur
    text("Direccion del Viento: Sur",10,20);
    for(int i=0;i<5;i++){
      for (int j = i ; j < particula; j++) {
        fill(255,0,0);
        mov = int(random(4));
        x=(width-90)/2+j*30+mov;
        y=z+i*30+mov;
        ellipse(x,y,radio,radio);
      }
      if(i>=0 && i<5 && particula>1){
        particula--;
      }else{
        particula=5;
      }
    }
    
    z += velocidad;
    if(z > height+radio){
      particula=5;
      fill(255);
      ran = int(random(4));
      z=50.0;
      println(ran);
    }
  }else if(ran == 1){ // Movimiento de Oeste a Este
    fill(255,255,0);
    text("Direccion del Viento: Este",10,20);
    particula = 0;
    for(int i=0;i<5;i++){
      if(i<3){
        for(int j=0; j<i+1; j++){
          mov = int(random(4));
          y=(height-90)/2+i*30+mov;
          x=z+j*30+mov;
          ellipse(x,y,radio,radio);
        }
      } else{
        for(int j=0; j<5-i; j++){
          mov = int(random(4));
          y=(height-90)/2+i*30+mov;
          x=z+j*30+mov;
          ellipse(x,y,radio,radio);
        }
      }
    }
    z += velocidad;
    if(z > width+radio){
      particula=5;
      fill(255);
      ran = int(random(4));
      z=50.0;
      println(ran);
    }
  }else if(ran == 2){ //Movimiento de Sur a Norte
    fill(0,153,153);
    text("Direccion del Viento: Norte",10,20);
    //ellipse(width/2,height-z,radio,radio);  
    for(int i=0;i<3;i++){
      for(int j=0; j<5; j++){
        if(i==0 && j==2){
          mov = int(random(4));
          x=(width-90)/2+j*30+mov;
          y=height-z+i*30+mov;
          ellipse(x,y,radio,radio);
        } else if(i==1 && j==1){
          mov = int(random(4));
          x=(width-90)/2+j*30+mov;
          y=height-z+i*30+mov;
          ellipse(x,y,radio,radio);
        } else if(i==1 && j==2){
          mov = int(random(4));
          x=(width-90)/2+j*30+mov;
          y=height-z+i*30+mov;
          ellipse(x,y,radio,radio);
        } else if(i==1 && j==3){
          mov = int(random(4));
          x=(width-90)/2+j*30+mov;
          y=height-z+i*30+mov;
          ellipse(x,y,radio,radio);
        } else if(i==2){
          mov = int(random(4));
          x=(width-90)/2+j*30+mov;
          y=height-z+i*30+mov;
          ellipse(x,y,radio,radio);
        }
      }
    }
    
    z += velocidad;
    if(height-z < radio){
      ran = int(random(4));
      println(ran);
      if(ran == 2){
        z=height;
      }else{
        z=50.0;
      }
    }
  }else if(ran == 3){ //Movimiento de Este a Oeste
    fill(255,51,153);
    text("Direccion del Viento: Oeste",10,20);
    //ellipse(width-z, height/2,radio,radio);
    for(int i=0;i<5;i++){
      if(i==2){
        mov = int(random(4));
        y=(height-90)/2+i*30+mov;
        x=width-z+i*30+mov;
        ellipse(x,y,radio,radio);
      } else if(i==3){
        for(int j=1; j<i+1;j++){
          mov = int(random(4));
          y=(height-90)/2+j*30+mov;
          x=width-z+i*30+mov;
          ellipse(x,y,radio,radio);
        }
      } else if(i==4){
        for(int j=0; j<i+1;j++){
          mov = int(random(4));
          y=(height-90)/2+j*30+mov;
          x=width-z+i*30+mov;
          ellipse(x,y,radio,radio);
        }
      }
    
    }
    z += velocidad;
    if(width-z < radio){
      ran = int(random(4));
      println(ran);
      if(ran == 3){
        z=width;
      }else{
        z=50.0;
      }
    }
  }
}
