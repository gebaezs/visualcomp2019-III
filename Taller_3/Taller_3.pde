
import nub.primitives.*;
import nub.core.*;
import nub.processing.*;

// 1. Nub objects
Scene scene;
Node node;
Vector v1, v2, v3;
// timing
TimingTask spinningTask;
boolean yDirection;
// scaling is a power of 2
int n = 4;

// 2. Hints
boolean triangleHint = true;
boolean gridHint = true;
boolean debug = true;
boolean shadeHint = false;
//==================================================
boolean antialiasing = false;
boolean shadow = false;
//==================================================


// 3. Use FX2D, JAVA2D, P2D or P3D
String renderer = P2D;

// 4. Window dimension
int dim = 10;

void settings() {
  size(int(pow(2, dim)), int(pow(2, dim)), renderer);
}

void setup() {
  rectMode(CENTER);
  scene = new Scene(this);
  if (scene.is3D())
    scene.setType(Scene.Type.ORTHOGRAPHIC);
  scene.setRadius(width/2);
  scene.fit(1);

  // not really needed here but create a spinning task
  // just to illustrate some nub timing features. For
  // example, to see how 3D spinning from the horizon
  // (no bias from above nor from below) induces movement
  // on the node instance (the one used to represent
  // onscreen pixels): upwards or backwards (or to the left
  // vs to the right)?
  // Press ' ' to play it
  // Press 'y' to change the spinning axes defined in the
  // world system.
  spinningTask = new TimingTask(scene) {
    @Override
    public void execute() {
      scene.eye().orbit(scene.is2D() ? new Vector(0, 0, 1) :
        yDirection ? new Vector(0, 1, 0) : new Vector(1, 0, 0), PI / 100);
    }
  };

  node = new Node();
  node.setScaling(width/pow(2, n));

  // init the triangle that's gonna be rasterized
  randomizeTriangle();
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  if (gridHint)
    scene.drawGrid(scene.radius(), (int)pow(2, n));
  if (triangleHint)
    drawTriangleHint();
  push();
  scene.applyTransformation(node);
  triangleRaster();
  pop();
}


void randomizeTriangle() {
  int low = -width/2;
  int high = width/2;
  v1 = new Vector(random(low, high), random(low, high));
  v2 = new Vector(random(low, high), random(low, high));
  v3 = new Vector(random(low, high), random(low, high));
}

void drawTriangleHint() {
 push();

  if(shadeHint)
    noStroke();
  else {
    strokeWeight(2);
    noFill();
  }
  beginShape(TRIANGLES);
  if(shadeHint)
    fill(255, 0, 0);
  else
    stroke(255, 0, 0);
  vertex(v1.x(), v1.y());
  if(shadeHint)
    fill(0, 255, 0);
  else
    stroke(0, 255, 0);
  vertex(v2.x(), v2.y());
  if(shadeHint)
    fill(0, 0, 255);
  else
    stroke(0, 0, 255);
  vertex(v3.x(), v3.y());
  endShape();

  strokeWeight(5);
  stroke(255, 0, 0);
  point(v1.x(), v1.y());
  stroke(0, 255, 0);
  point(v2.x(), v2.y());
  stroke(0, 0, 255);
  point(v3.x(), v3.y());

  pop();
}

void keyPressed() {
  if (key == 'g')
    gridHint = !gridHint;
  if (key == 't')
    triangleHint = !triangleHint;
  if (key == 's')
    shadeHint = !shadeHint;
  if (key == 'd')
    debug = !debug;
  if (key == '+') {
    n = n < 7 ? n+1 : 2;
    node.setScaling(width/pow( 2, n));
  }
  if (key == '-') {
    n = n >2 ? n-1 : 7;
    node.setScaling(width/pow( 2, n));
  }
  if (key == 'r')
    randomizeTriangle();
  if (key == ' ')
    if (spinningTask.isActive())
      spinningTask.stop();
    else
      spinningTask.run();
  if (key == 'y')
    yDirection = !yDirection;
}

// 
//  CODIGO BASE PROPORCIONADO 
//  POR EL PROFESOR (JEAN P. C.)
//           /\
//          /  \
//           ||
// ===================================================================================================
//       ||
//      \  /
//       \/
//  MODIFICACION DE LA FUNCION triangleRaster()
//  Y CREACION DE LOS FUNCIONES AUXILIARES 
//        


// Implement this function to rasterize the triangle.
// Coordinates are given in the node system which has a dimension of 2^n
void triangleRaster() {
  // node.location converts points from world to node
  // here we convert v1 to illustrate the idea


  // --> VALORES EN EL EJE (X) DE LOS VECTORES  
  float v1x = node.location(v1).x();
  float v2x = node.location(v2).x();
  float v3x = node.location(v3).x();


  // --> VALORES EN EL EJE (Y) DE LOS VECTORES  
  float v1y = node.location(v1).y();
  float v2y = node.location(v2).y();
  float v3y = node.location(v3).y();


  // --> SE CALCULAN LOS VALORES MINIMOS EN EL EJE (X)
  int minimo_X=round(min(v1x, v2x, v3x));
  int maximo_X=round(max(v1x, v2x, v3x));


  // --> SE CALCULAN LOS VALORES MINIMOS EN EL EJE (Y)
  int minimo_Y=round(min(v1y, v2y, v3y));
  int maximo_Y=round(max(v1y, v2y, v3y));


  if (debug) {

    pushStyle();
    stroke(255, 0, 0);
    // point(round(v1x), round(v1y));
    stroke(0, 255, 0);
    // point(round(v2x), round(v2y));
    stroke(0, 0, 255);    
    // point(round(v3x), round(v3y));
    noStroke();

    int avanzar;

    // --> RECORRER EL RECTANGULO QUE BORDEA EL TRIANGULO
    for (int x = minimo_X; x < maximo_X; x++) {
      for (int y = minimo_Y; y < maximo_Y; y++) {

        // --> INICIALIZACION DE VARIABLES LOCALES
        float a_1_2, a_2_3, a_3_1; 
        float area; 
        float rr, gg, bb;
        float color_r = 0.0;
        float color_g = 0.0; 
        float color_b = 0.0;

        //se recorre cada pixel en 4 subpixeles para suavizar el coloreado aplicando el antialiasing SSAA
        // --> SE APLICA (SSAA) MIENTRAS SE RECORRE LA IMAGEN
        if(antialiasing){
            avanzar = 4;
            for (float itr_x = 0; itr_x < 1; itr_x += (float) (1 / avanzar)) {
                for (float itr_y = 0; itr_y < 1; itr_y += (float) (1 / avanzar)) {                       
                    if (val_area_int_tri(v1x, v1y, v2x, v2y, v3x, v3y, (x + itr_x), (y + itr_y))) {
                        
                        // --> CALCULO DE LAS ARISTAS SEGUN LOS VERTICES
                        a_1_2 = arista(v1x, v1y, v2x, v2y, (x + itr_x), (y + itr_y));
                        a_2_3 = arista(v2x, v2y, v3x, v3y, (x + itr_x), (y + itr_y));
                        a_3_1 = arista(v3x, v3y, v1x, v1y, (x + itr_x), (y + itr_y));
                        
                        // --> SE CALCULA EL AREA
                        area = abs(a_1_2) + abs(a_2_3) + abs(a_3_1);
                        
                        // --> CALCULAR COLOR AREA y normalizado
                        rr = (a_2_3) / area;
                        gg = (a_3_1) / area;
                        bb = (a_1_2) / area;
                        
                        // --> SE NORMALIZA EL RESUTLADO ANTERIOR
                        color_r += abs(rr*255);
                        color_g += abs(gg*255);
                        color_b += abs(bb*255);
                    }
                }
            }
        }else{
            
            // RECORRE LA IMAGEN SIN USAR EL (SSAA)
            avanzar=1;
            if (val_area_int_tri(v1x, v1y, v2x, v2y, v3x, v3y, (x), (y))) {

                // --> CALCULO DE LAS ARISTAS SEGUN LOS VERTICES
                a_1_2 = arista(v1x, v1y, v2x, v2y, (x), (y));
                a_2_3 = arista(v2x, v2y, v3x, v3y, (x), (y));
                a_3_1 = arista(v3x, v3y, v1x, v1y, (x), (y));

                // --> SE CALCULA EL AREA
                area = abs(a_1_2) + abs(a_2_3) + abs(a_3_1);

                // --> CALCULAR COLOR AREA y normalizado
                rr = (a_2_3)/area;
                gg = (a_3_1)/area;
                bb = (a_1_2)/area;

                // --> SE NORMALIZA EL RESUTLADO ANTERIOR
                color_r += abs(rr*255);
                color_g += abs(gg*255);
                color_b += abs(bb*255);
            }
        }

        color_r /= Math.pow(avanzar, 2);
        color_g /= Math.pow(avanzar, 2);
        color_b /= Math.pow(avanzar, 2);
        
        // --> SE ESTABLECE EL COLOR A UN BLANCO CON TRANSPARENCIA DE 90
        if(shadow){
            fill(round(color_r), round(color_g), round(color_b));
            rect(x, y, 1, 1);
        } else {
            if(val_area_int_tri(v1x, v1y, v3x, v3y, v2x, v2y, (x), (y))){
                fill(255, 255, 255, 90);
                rect(x, y, 1, 1);
            }
        }
        
      }
    } 
    popStyle();
  }
}

// --> FUNCION PARA VALIDAR EL AREA INTERNA DEL TRIANGULO
boolean val_area_int_tri(float v1x, float v1y, float v2x, float v2y, float v3x, float v3y, float px, float py) {
  
  boolean edge10, edge20, edge30; 
  boolean edge11, edge21, edge31;

  // ================================================================
  // --> VALIDACIONES (1) 
  if ((((px-v1x)*(v2y-v1y))-((py-v1y)*(v2x-v1x))) >= 0) {
      edge10 = true;
  } else {
      edge10 = false;
  }

  if ((((px-v2x)*(v3y-v2y))-((py-v2y)*(v3x-v2x))) >= 0) {
      edge20 = true;
  } else {
      edge20 = false;
  }

  if ((((px-v3x)*(v1y-v3y))-((py-v3y)*(v1x-v3x))) >= 0) {
      edge30 = true;
  } else {
      edge30 = false;
  }
  // ================================================================

  // ================================================================
  // --> VALIDACIONES (2)    
  if ((((px-v1x)*(v3y-v1y))-((py-v1y)*(v3x-v1x))) >= 0) {
      edge11 = true;
  } else {
      edge11 = false;
  }

  if ((((px-v2x)*(v1y-v2y))-((py-v2y)*(v1x-v2x))) >= 0) {
      edge31 = true;
  } else {
      edge31 = false;
  }

  if ((((px-v3x)*(v2y-v3y))-((py-v3y)*(v2x-v3x))) >= 0) {
      edge21 = true;
  } else {
      edge21 = false;
  }
  // ================================================================
 
 // -->    | ---------- (1) --------- |    | ---------- (2) --------- |
  return ( (edge10 & edge20 & edge30) || (edge11 & edge21 & edge31) );
}

// --> 
float arista(float v1x, float v1y, float v2x, float v2y, float px, float py) {
    float tem_art = (((v2x - v1x) * (py - v1y)) - ((v2y - v1y) * (px - v1x)));
    return tem_art;
}
