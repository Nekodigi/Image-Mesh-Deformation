//mesh good can deform without inverse formula,but not good when move a lot.

PImage img;
MeshDeform meshDeform;
float noiseS = 500;//noise scale
float noiseP = 0.1;//noise power

void setup(){
  size(500, 500, P3D);
  img = loadImage("FevCat.png");
  img.resize(200, 200);//reduce resolution for high speed processing
  meshDeform = new MeshDeform(img, new PVector(0, 0), new PVector(width, height));
  
}

void keyPressed(){
  if(key == 'r'){
    meshDeform.resetCoord();
  }
}

void draw(){
  PVector[][] target = meshDeform.ctrPoss;
  for(int i=0; i<target[0].length; i++){
    for(int j=0; j<target.length; j++){
      float angle = noise(target[i][j].x/noiseS, target[i][j].y/noiseS)*TWO_PI*8;
      target[i][j].add(PVector.fromAngle(angle).mult(noiseP));
    }
  }
  noStroke();
  meshDeform.show();
}
