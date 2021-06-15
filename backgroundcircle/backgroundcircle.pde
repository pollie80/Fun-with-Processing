float c = 0, offset, totToRotate, rotAdjust;
int numCircles = 15, count;

void setup(){
  background(0);
  size(600, 600);
  frameRate(120);
  
  colorMode(HSB, 2*PI);
  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);
  
  offset = width/4.0;
  rotAdjust = 2.0*PI/((float)numCircles);
}

void draw(){
  delay(100);
  
  //after full circle
  if(c >= 2*PI){
    background(0);
    c = 0;
    totToRotate = 0;
    count++;
  }
  
  push();
  
  translate(width/2.0, height/2.0);
  drawCount();
  rotate(totToRotate);
  
  fill(c, 360, 360);
  c += rotAdjust;
  totToRotate += rotAdjust;
  ellipse(offset, 0, rotAdjust/(2*PI)*(920), rotAdjust/(2*PI)*(920));
  
  pop();
}

void drawCount(){
  fill(0);
  rect(0, 0, 120, 120);
  fill(c, 360, 360);
  text(count, 0, 0);
}
