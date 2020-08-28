int resI = 100, resJ = 2;//deform resolution
MeshDeform meshDeform;
PImage img;

void setup(){
  size(500, 500, P3D);
  img = loadImage("FevCat.png");
  meshDeform = new MeshDeform(img, resI, resJ, new PVector(0, height/4), new PVector(width, height/4*3));
}

void draw(){
  PVector[][] target = meshDeform.ctrUV;
  for(int i=0; i<target.length; i++){
    for(int j=0; j<target[0].length; j++){
      float angle = map(target[i][j].x, 0, 1, 0, TWO_PI)-HALF_PI;//+float(frameCount)/100;
      float r = map(target[i][j].y, 0, 1, 0, meshDeform.br.y-meshDeform.tl.y);
      PVector origin = PVector.add(meshDeform.tl, meshDeform.br).div(2);//midpoint between image top left and bottom right
      meshDeform.ctrPoss[i][j] = PVector.add(origin, PVector.fromAngle(angle).mult(r));//println(PVector.fromAngle(angle).mult(meshDeform.br.y));
    }
  }
  noStroke();
  meshDeform.show();
}
