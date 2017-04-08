
int MAX_ITERATION = 255;
double SCALE_FACTOR = 0.01;
double OFFSET_FACTOR = 0.1;

double xMin = -2.0;
double xMax = 1.0;
double yMin = -1.5;
double yMax = 1.5;
//double xLen = xMax-xMin;
//double yLen = yMax-yMin;

double scale = 1.0;
double offsetX = 0.0;
double offsetY = 0.0;

boolean isRedraw;

void setup() {
  size(900, 900);
  isRedraw = true;
  //
}

void draw() {

  if (isRedraw) {

    println("["+xMin+";"+yMin+"] - ["+xMax+";"+yMax+"]");


    drawMandelbrotSet();
    isRedraw = false;
  }
}

void mouseWheel(MouseEvent e) {
  scale += (e.getCount() * SCALE_FACTOR);

  //offsetX = (mouseX - width / 2)/(xMax-xMin);
  //offsetY = (mouseY - height / 2)/(yMax-yMin);

  println("[ox:"+offsetX+", oy:"+offsetY+"]");

  //offsetX = getX(mouseX);
  //offsetY = getY(mouseY);

  //xMin =+ (offsetX * OFFSET_FACTOR);
  //xMax =+ (offsetX * OFFSET_FACTOR);
  //yMin =+ (offsetY * OFFSET_FACTOR);
  //yMax =+ (offsetY * OFFSET_FACTOR);

  isRedraw = true;
}

void mouseDragged(){
  // TO DO implement
}

double getX(int i) {
  double x = scale * xMin + scale * ((double)i)*(xMax-xMin) / ((double)width);
  return x;
}

double getY(int j) {
  double y = scale * yMin + scale * ((double)j)*(yMax-yMin) / ((double)height);
  return y;
}

void drawMandelbrotSet() {
  loadPixels();
  for (int i =0; i <width; i ++) {
    for (int j =0; j <height; j ++) {
      double x = getX(i);
      double y = getY(j);

      int iteration = 0;
      double xx = 0.0;
      double yy = 0.0;
      double xx_tmp = 0.0;

      while ((xx*xx+ yy*yy)< 4 && iteration < MAX_ITERATION) {
        xx_tmp = xx*xx - yy*yy + x;
        yy = 2 * xx * yy + y;
        xx = xx_tmp;
        iteration++;
      }
      pixels[i+j*width] = color(iteration);
    }
  }

  updatePixels();
}

/*
void draw(){
 
 if(mousePressed){
 fill(0);
 } else {
 fill(255);
 }
 ellipse(mouseX, mouseY, 20, 20);
 }
 
 */