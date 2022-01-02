float rotateStrength, halfWidth, halfHeight;
void setup(){
  print("setup");
  size(500, 500);
  stroke(255);
  
  halfWidth = width/2;
  halfHeight = width/2;
  rotateStrength = radians(width/360*4);
  
  push();
  print("draw");
  background(0);
  translate(halfWidth, halfHeight);
  
  for(int i=0; i<halfHeight; i++){
    rotate(rotateStrength);
    for(int j=0; j<i*2; j++){
      point(j, i);
    }
  }
  
  pop();
}

//void draw(){
//}
