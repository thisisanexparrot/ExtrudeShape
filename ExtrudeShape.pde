ArrayList<Vertex> vertices2D; 

void setup() {
  size(400, 400, P3D);
  vertices2D = new ArrayList<Vertex>();
}

void draw() {
  fill(255);
  addVertex(30, 30);
  addVertex(30, 90);
  addVertex(90, 90);
  addVertex(90, 30);
  extrudeShape(40);
}

void addVertex(int x, int y) {
  Vertex v = new Vertex(x, y, 0);
  vertices2D.add(v);
}

void extrudeShape(int theHeight) {

  fill(0);
  ArrayList<Vertex> v3D = new ArrayList<Vertex>();

  for (int i = 0; i < vertices2D.size(); i++) {
    Vertex v0 = vertices2D.get(i);
    Vertex v1 = new Vertex(v0.x, v0.y, theHeight);
    v3D.add(v1);
  }

  //top
  beginShape();
  for (int i = 0; i < vertices2D.size(); i++) {
    Vertex v = vertices2D.get(i); 
    vertex(v.x, v.y, v.z);
  }
  endShape(CLOSE);

  //bottom
  beginShape();
  for (int i = 0; i < v3D.size(); i++) {
    Vertex v = v3D.get(i); 
    vertex(v.x, v.y, v.z);
  }
  endShape(CLOSE);

  //body
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < v3D.size(); i++) {
    Vertex top = vertices2D.get(i);
    Vertex bottom = v3D.get(i);
    vertex(top.x, top.y, top.z);
    vertex(bottom.x, bottom.y, bottom.z);
  }
  endShape(CLOSE);
}


