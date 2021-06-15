import static javax.swing.JOptionPane.*;

//for show
int diam = 35, numCircles = 0;
float distToCenter, counter = 0, speed = 5;
boolean towardsCenter = true;

//for reset button
float topLeft[], w=20, h=20, offset=2;

void setup(){
  background(0);
  size(500, 500);
  distToCenter = height/2;
  topLeft = new float[]{width-w-offset, offset};
  
  ellipseMode(CENTER);
  colorMode(HSB, 360);
  
  getNumCircles();
}

void draw(){
  //background(0); //OPTIONAL BACKGROUND SAVING
  push();
  translate(width/2, height/2);
  
  float rotate_value = radians(counter);
  rotate(rotate_value);
  
  fill(counter, 360, 360); //next bright colour on spectrum
  for(int i = 0; i < numCircles; i++){
    ellipse(0, distToCenter, diam, diam);
    rotate(radians(360/numCircles)); //move on to next circle
  }
  
  //move towards center or away
  if(towardsCenter)
    distToCenter--;
  else 
    distToCenter++;
    
  //swap towards
  if(distToCenter > height/2 || distToCenter < 0)
    towardsCenter = !towardsCenter;
  
  //move on through circle
  counter+=speed;
  if(counter > 360)
    counter = 0;
    
  pop();
  
  rect(topLeft[0], topLeft[1], w, h, 7);
}

/**
  gets the number of circles from JOptionPane
  - has to be positive integer > 0
**/
void getNumCircles(){
  while(numCircles == 0){
    try {
      numCircles = Integer.parseInt(showInputDialog("How many circles? Number must be > 0"));
    } catch (Exception e){
    }
  }
}

/**
  is the mouse on the reset button?
**/
boolean onButton(){
   return mouseX > topLeft[0] && mouseX < topLeft[0]+w && 
     mouseY > topLeft[1] && mouseY < topLeft[1]+h;
}

void mousePressed(){
  //if retry button clicked
  if(onButton()){
    numCircles=0;
    getNumCircles();
  }
}
