import processing.serial.*;

Serial myPort;  
int val, screen_increment, old_x=0, old_y=0;      
String inString;  
int lf = 10;       
void setup() 
{

  size(displayWidth-100, 600);
  println(Serial.list());
  
  myPort = new Serial(this, Serial.list()[0], 115200);
  myPort.bufferUntil(lf);
  background(24,24,24);
  

 stroke(255,0,0);
 line(0, 100 , 1600, 100);
 text('4',0,110);
  stroke(255,0,0);
 line(0, 200 , 1600, 200);
 text('3',0,210);
  stroke(255,0,0);
 line(0, 300 , 1600, 300);
 text('2',0,310);
  stroke(255,0,0);
 line(0, 400 , 1600, 400);
 text('1',0,410);


}//setup

void draw()
{
}

void serialEvent(Serial myPort) { 
  inString = myPort.readString();
  inString = trim(inString);
  val = int(inString);
  strokeWeight(0.5);
  stroke(255, 255, 255);
  
  line(old_x, old_y, screen_increment, 600-val);
  
 
  old_x = screen_increment;
  old_y = 600-val;
  
 
  screen_increment=screen_increment+2;
  
 
  if(screen_increment>(displayWidth-100)){
    background(24,24,24); 
    screen_increment=-50; 
     stroke(255,0,0);
 line(0, 100 , 1600, 100);
 text('4',0,110);
  stroke(255,0,0);
 line(0, 200 , 1600, 200);
 text('3',0,210);
  stroke(255,0,0);
 line(0, 300 , 1600, 300);
 text('2',0,310);
  stroke(255,0,0);
 line(0, 400 , 1600, 400);
 text('1',0,410);

  old_x = -50;
  old_y = 0;
  
  }
}
