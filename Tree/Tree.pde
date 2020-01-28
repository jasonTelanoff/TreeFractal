int totalEnds = 0;
PImage leaf;
boolean rendering = true;


void setup() {
  size(1000, 900);
  //fullScreen();
  frameRate(60);
  leaf = loadImage("Leaf.png");
  imageMode(CENTER);
  
  background(255);
  drawTree("thicccc");
}

void drawTree(String mode) {
  switch (mode) {
    case "cool" : 
      stroke(255, 0, 0);
      drawBranch(width/2, 750, width/2, 650, 100, 1, 20, 20, 20, 20, 0.8, 20);
      
      break;
      
    case "spruce" :
      stroke(0);
      drawBranch(width/2, height, width/2, height - 200, 200, 1, 10, 10, 10, 10, 0.75, 15);
      
      break;
      
    case "thicccc" : 
      stroke(255, 200, 200);
      drawBranch(width/2, height, width/2, height - 200, 200, 1, 45, 45, 45, 7, 0.5, 1);
      
      break;
  }
}

void drawBranch(float x1, float y1, float x2, float y2, float size, int layer, float aI1, float aI2, float ogAng, int endLayer, float decay, float strokeFactor) {
  if (layer >= endLayer) {
    rendering = false;
    //image(leaf, x1, y1, 30, 30);
    
    totalEnds++;
    if(totalEnds < pow(2, endLayer - 1)) {
      println("Finished branche : " + totalEnds + " / " + (int) pow(2, endLayer - 1));
    } else {
      println("Finished " + totalEnds + " / " + (int) pow(2, endLayer - 1));
    }
    return;
  }
  
  strokeWeight(size/strokeFactor);
  line(x1, y1, x2, y2);
  
  float ang1 = aI1*PI/180;
  float ang2 = aI2*PI/180;
  
  float xInc1 = size*sin(ang1);
  float yInc1 = size*cos(ang1);
  
  float xInc2 = size*sin(ang2);
  float yInc2 = size*cos(ang2);
  
  drawBranch(x2, y2, x2 - xInc1, y2 - yInc1, size*decay, layer+1, aI1+ogAng, aI2-ogAng, ogAng, endLayer, decay, strokeFactor);
  drawBranch(x2, y2, x2 + xInc2, y2 - yInc2, size*decay, layer+1, aI1-ogAng, aI2+ogAng, ogAng, endLayer, decay, strokeFactor);
}
