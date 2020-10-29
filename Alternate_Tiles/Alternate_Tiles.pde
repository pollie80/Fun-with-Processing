color firstColor = color(255, 255, 255), secondColor = color(255, 105, 237); //arbitrary colours
float rectSize;
int numRects = 20;
boolean doFirst = true; //do first colour first

void setup(){
  size(500, 500);
  rectSize = width/numRects; //assumes same width and height
  noStroke(); //probably looks best without borders
}

void draw(){
  //do rects
  for(int x = 0; x < numRects; x++){
    for(int y = 0; y < numRects; y++){
      if(doFirst){
        fill(firstColor);
        //stroke(secondColor);
      }
      else {
        fill(secondColor); 
        //stroke(firstColor);
      }
      
      //draw rect with appropriate color
      rect(rectSize*x, rectSize*y, rectSize, rectSize);
      doFirst = !doFirst;
    }
    doFirst = !doFirst;
  }
}

void mousePressed(){
  //click to change alternation 
  doFirst = !doFirst;
}
